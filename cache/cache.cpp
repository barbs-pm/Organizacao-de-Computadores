/****************************************
* UNIVERSIDADE FEDERAL DA FRONTEIRA SUL *
* Professor: EMÍLIO WUERGES             *
* Alunos: BÁRBARA PEGORARO MARKUS       *
* 		  MURILO XAVIER DE OLIVEIRA     *
* 		  ESTELA MARIS VILAS BOAS       *
*                                       *
*	  SIMULADOR DE MEMÓRIA CACHE        *
*****************************************/

#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <fstream>

using namespace std;
int tamanhoBloco, tamanhoCache, numeroBloco=0;

int compulsry_misses=0, capcity_misses=0/*, conflict_misses=0*/;
/* Tipos de misses da cache
    Compulsory ou Cold misses - a primeira referência para um bloco da memória, começando com uma cache vazia
    Capacity misses - a cache não é grande o suficiente para ter todo bloco que desejamos usar
    Conflict misses - dois blocos mapeados no mesmo lugar
*/

unsigned int memGen(){
    static unsigned int addr=0;
    return (addr++)%(1024);
}

// Simulador da cache
bool cacheSim(unsigned int addr, int cash[3][100000], int &block_counter, int index_addr, int tag_addr){
    int shift_offset=log2(tamanhoBloco);
    bool detected=false;
    bool misses_flag=true;

    // memória cache completamente associativa
    // LRU -> Least Recently Used
      if (block_counter < numeroBloco){
          for (int i=0; i < numeroBloco; i++){

              if (cash[0][i]==addr >> shift_offset){
                  detected=true;
                  cash[1][i]=block_counter;
                  block_counter--;
                  return detected;  //hit
              }
          }

          if (!detected){
              compulsry_misses++;
              cash[0][block_counter]=addr>>shift_offset;
              cash[1][block_counter]=block_counter;
              return false;         //miss
          }

      }else{  // contador de bloco é maior que numeroBloco
          for (int i=0; i < numeroBloco; i++){
              if (cash[0][i]==(addr >> shift_offset)){
                  detected=true;
                  cash[1][i]=block_counter;
                  return detected;  //hit
              }
          }

          if (!detected){
              int compare=0;
              for (int i=1; i < numeroBloco; i++){
                  if (cash[1][compare] > cash[1][i])
                      compare=i;
              }

              cash[0][compare]=addr >> shift_offset;
              cash[1][compare]=block_counter;
              capcity_misses++;
              return false;         //miss
          }

      } // FIM DO LRU
    return true;
}

unsigned int m_w = 0xABABAB55;    //não deve ser zero
unsigned int m_z = 0x05080902;


unsigned int rand_(){             // número aleatório
    m_z = 36969 * (m_z & 65535) + (m_z >> 16);
    m_w = 18000 * (m_w & 65535) + (m_w >> 16);

    unsigned int a = (m_z << 16) + m_w;

    while(a/100000 != 0){
      a=a/10;
    }
    return a;
}

char *msg[2] = {"Miss","Hit"};

int calculoTag(int x){
  return (x >> 5)/2;
}
int calculoOff(int x){
  return (x >> 5);
}
int calculoSet(int x){
  return (x >> 5)%2;
}


// --MAIN--
int main(int argc, const char * argv[]) {

    int flag, shift;
    unsigned int addr;

    cout << " -----Memória cache totalmente associativa----- \n" << endl;
    cout << "Selecione o tamanho do bloco entre 4 e 128 bytes (multiplos de 2): " << endl;
    cin >> tamanhoBloco;
    cout << "Selecione o tamanho da cache: 1KB - 64KB (multiplos de 2): " << endl;
    cin >> tamanhoCache;
    cout << "Tipo de substituição de endereço : LRU \n" << endl;

    int cash[3][100000];
    int block_counter=0;
    int hit_counter=0;
    int index_addr=0, tag_addr=0;

    //  memória cache completamente associativa
    numeroBloco= (tamanhoCache*1024)/tamanhoBloco;

    //setando a cache pra -1
    for (int i=0; i < 2; i++)
        for (int j=0; j < numeroBloco; j++)
            cash[i][j]=-10;

    //abrindo o arquivo.txt para a escrita mais detalhada dos resultados
    ofstream FILE;
    FILE.open("arquivo.txt", ios::out);

    if (FILE.is_open()){
        //arquivo de texto aberto com sucesso
        cout << "Abra arquivo.txt para mais detalhes!"<< '\n' << endl;
    }else{
        cout << "Erro ao abrir arquivo de texto para escrita.";
    }

    //leitura de endereços do arquivo
    string line;
    ifstream myfile ("addrs.txt"); // ifstream = padrão ios:in

    //abre arquivo de leitura
    if (myfile.is_open()){
      while (! myfile.eof()){
          getline (myfile,line);
          addr = stoul(line, nullptr, 0); //converte para unsigned int
          flag = cacheSim(addr, cash, block_counter, index_addr, tag_addr);

          //escreve no arquivo
          FILE << "      tag: " << calculoTag(addr) << "  offset: " << calculoOff(addr) << "  index: " << calculoSet(addr) << "\n";

          if (msg[flag]=="Hit"){
              //escreve no arquivo e conta os acertos
              FILE << "@" << addr << "  hit  "<< '\n';
              hit_counter++;
          }else{
              FILE << "@" << addr << "  miss  "<< '\n';
          }
          block_counter++;
      }
      myfile.close();

    }else{
      cout << "Não foi possível abrir o arquivo de leitura.";
    }
    //fecha o arquivo
    FILE.close();
    //resultado final
    cout << "Hits:  " << hit_counter<<endl << "Compulsory misses:  " << compulsry_misses <<endl<< "Capacity misses:  " << capcity_misses <<endl/*<< "Conflict misses:  " << conflict_misses <<  endl*/;
}

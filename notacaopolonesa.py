'''-------------------------------------
             UFFS CHAPECÓ
        ciência da computação
  
  Bárbara Markus: github.com/barbs-pm
  Murilo Xavier: github.com/muriloxdo
  
        NOTAÇÃO POLONESA REVERSA
--------------------------------------'''

#!/usr/bin/python
# -*- coding: utf-8 -*-

import os

class Pilha:

	def __init__(self):
		self.pilha = []

	def adicionar(self, valor):
		self.pilha.append(valor)
		
	def soma(self):
		return self.pilha.append(self.pilha.pop() + self.pilha.pop())

	def sub(self):
		return self.pilha.append(self.pilha.pop() - self.pilha.pop())

	def mult(self):
		return self.pilha.append(self.pilha.pop() * self.pilha.pop())

	def div(self):
		return self.pilha.append(self.pilha.pop() / self.pilha.pop())

	def imprimir(self):
		return self.pilha

	def topo(self):
		return id(self.pilha[len(self.pilha)-1])

class Main():

	a = Pilha()
	
	while True:
		os.system('cls' if os.name == 'nt' else 'clear')
		print("_______________~<>~______________")
		print("     NOTAÇÃO POLONESA REVERSA\n")
		print(" [1] - Inserir Valor")
		print(" [2] - Somar")
		print(" [3] - Subtrair")
		print(" [4] - Multiplicar")
		print(" [5] - Dividir")
		print(" [0] - Sair")
		
		if len(a.pilha) > 0: 
			stack = a.topo()
			print("\n Pilha:",a.imprimir())
			print("\n Stack Pointer: %i" %stack)

		print("_______________~<>~______________")
		op = int(input(" Escolha uma opção: "))

		if op == 1:			#inserir
			if len(a.pilha) < 8:
				a.adicionar(int(input(" Digite um valor: ")))

		elif op == 2:		#somar
			if len(a.pilha) > 1:
				a.soma()
			
		elif op == 3:		#subtracao
			if len(a.pilha) > 1:
				a.sub()

		elif op == 4:		#multiplicacao
			if len(a.pilha) > 1:
				a.mult()

		elif op == 5:		#divisao
			if len(a.pilha) > 1:
				a.div()
			
		elif op == 0:		#sair
			break;

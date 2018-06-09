cria():
  movl $0, %eax
  ret
vazia(nodo*):
  pushq %rbp
  movq %rsp, %rbp
  movq %rdi, -24(%rbp)
  movq -24(%rbp), %rax
  movq %rax, -8(%rbp)
.L7:
  cmpq $0, -8(%rbp)
  je .L4
  cmpq $0, -8(%rbp)
  je .L5
  movl $0, %eax
  jmp .L3
.L5:
  movq -8(%rbp), %rax
  movq 112(%rax), %rax
  movq %rax, -8(%rbp)
  jmp .L7
.L4:
  cmpq $0, -8(%rbp)
  jne .L8
  movl $1, %eax
  jmp .L3
.L8:
.L3:
  popq %rbp
  ret
.LC0:
  .string "clear"
.LC1:
  .string "\t___________~<>~___________"
.LC2:
  .string "\tC\303\263digo do produto: "
.LC3:
  .string "%d"
.LC4:
  .string "\tNome: "
.LC5:
  .string "\tPre\303\247o: "
.LC6:
  .string "%f"
push(nodo*):
  pushq %rbp
  movq %rsp, %rbp
  subq $32, %rsp
  movq %rdi, -24(%rbp)
  movl $120, %edi
  call malloc
  movq %rax, -8(%rbp)
  movl $.LC0, %edi
  call system
  movl $.LC1, %edi
  call puts
  movl $.LC2, %edi
  movl $0, %eax
  call printf
  movq -8(%rbp), %rax
  movq %rax, %rsi
  movl $.LC3, %edi
  movl $0, %eax
  call scanf
  movl $.LC4, %edi
  movl $0, %eax
  call printf
  call getchar
  movq stdin(%rip), %rax
  movq -8(%rbp), %rdx
  leaq 4(%rdx), %rcx
  movq %rax, %rdx
  movl $100, %esi
  movq %rcx, %rdi
  call fgets
  movl $.LC5, %edi
  movl $0, %eax
  call printf
  movq -8(%rbp), %rax
  addq $104, %rax
  movq %rax, %rsi
  movl $.LC6, %edi
  movl $0, %eax
  call scanf
  movq -8(%rbp), %rax
  movq -24(%rbp), %rdx
  movq %rdx, 112(%rax)
  movq -8(%rbp), %rax
  leave
  ret
.LC7:
  .string "\t___________~<>~__________"
.LC8:
  .string "\tLista vazia."
.LC9:
  .string "\tAperte 1 para voltar: "
.LC10:
  .string "\t___________________~<>~__________________"
.LC11:
  .string "\tC\303\263digo do produto que deseja retirar: "
.LC12:
  .string "%i"
.LC13:
  .string "\t____________~<>~___________"
.LC14:
  .string "\tProduto n\303\243o encontrado"
pop(nodo*):
  pushq %rbp
  movq %rsp, %rbp
  subq $48, %rsp
  movq %rdi, -40(%rbp)
  movq $0, -16(%rbp)
  movq -40(%rbp), %rax
  movq %rax, %rdi
  call vazia(nodo*)
  testl %eax, %eax
  setne %al
  testb %al, %al
  je .L12
  movl $.LC0, %edi
  call system
  movl $.LC7, %edi
  call puts
  movl $.LC8, %edi
  call puts
  movl $.LC9, %edi
  movl $0, %eax
  call printf
  leaq -32(%rbp), %rax
  movq %rax, %rsi
  movl $.LC3, %edi
  movl $0, %eax
  call scanf
  movq -40(%rbp), %rax
  jmp .L18
.L12:
  movl $.LC0, %edi
  call system
  movl $.LC10, %edi
  call puts
  movl $.LC11, %edi
  movl $0, %eax
  call printf
  leaq -28(%rbp), %rax
  movq %rax, %rsi
  movl $.LC12, %edi
  movl $0, %eax
  call scanf
  movq -40(%rbp), %rax
  movq %rax, -8(%rbp)
.L17:
  cmpq $0, -8(%rbp)
  je .L14
  movq -8(%rbp), %rax
  movl (%rax), %edx
  movl -28(%rbp), %eax
  cmpl %eax, %edx
  jne .L15
  movq -8(%rbp), %rax
  movq %rax, -24(%rbp)
  cmpq $0, -16(%rbp)
  jne .L16
  movq -8(%rbp), %rax
  movq 112(%rax), %rax
  movq %rax, -8(%rbp)
  movq -8(%rbp), %rax
  jmp .L18
.L16:
  movq -24(%rbp), %rax
  movq 112(%rax), %rdx
  movq -16(%rbp), %rax
  movq %rdx, 112(%rax)
  movq -40(%rbp), %rax
  jmp .L18
.L15:
  movq -8(%rbp), %rax
  movq %rax, -16(%rbp)
  movq -8(%rbp), %rax
  movq 112(%rax), %rax
  movq %rax, -8(%rbp)
  jmp .L17
.L14:
  movl $.LC0, %edi
  call system
  movl $.LC13, %edi
  call puts
  movl $.LC14, %edi
  call puts
  movl $.LC9, %edi
  movl $0, %eax
  call printf
  leaq -32(%rbp), %rax
  movq %rax, %rsi
  movl $.LC3, %edi
  movl $0, %eax
  call scanf
  movq -40(%rbp), %rax
.L18:
  leave
  ret
.LC15:
  .string "\tC\303\263digo do produto: %d\n"
.LC16:
  .string "\tNome: %s"
.LC17:
  .string "\tPre\303\247o: %.2f"
.LC18:
  .string "\n"
display(nodo*):
  pushq %rbp
  movq %rsp, %rbp
  subq $32, %rsp
  movq %rdi, -24(%rbp)
  movl $.LC0, %edi
  call system
  movl $.LC7, %edi
  call puts
  movq -24(%rbp), %rax
  movq %rax, -8(%rbp)
.L21:
  cmpq $0, -8(%rbp)
  je .L20
  movq -8(%rbp), %rax
  movl (%rax), %eax
  movl %eax, %esi
  movl $.LC15, %edi
  movl $0, %eax
  call printf
  movq -8(%rbp), %rax
  addq $4, %rax
  movq %rax, %rsi
  movl $.LC16, %edi
  movl $0, %eax
  call printf
  movq -8(%rbp), %rax
  movss 104(%rax), %xmm0
  cvtss2sd %xmm0, %xmm0
  movl $.LC17, %edi
  movl $1, %eax
  call printf
  movl $.LC18, %edi
  call puts
  movq -8(%rbp), %rax
  movq 112(%rax), %rax
  movq %rax, -8(%rbp)
  jmp .L21
.L20:
  movq -24(%rbp), %rax
  movq %rax, %rdi
  call vazia(nodo*)
  testl %eax, %eax
  setne %al
  testb %al, %al
  je .L22
  movl $.LC0, %edi
  call system
  movl $.LC7, %edi
  call puts
  movl $.LC8, %edi
  call puts
.L22:
  movl $.LC7, %edi
  call puts
  movl $.LC9, %edi
  movl $0, %eax
  call printf
  leaq -12(%rbp), %rax
  movq %rax, %rsi
  movl $.LC3, %edi
  movl $0, %eax
  call scanf
  nop
  leave
  ret
libera(nodo*):
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq %rdi, -8(%rbp)
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call free
  nop
  leave
  ret
.LC19:
  .string "\t|0| Sair"
.LC20:
  .string "\t|1| Inserir produto"
.LC21:
  .string "\t|2| Excluir produto"
.LC22:
  .string "\t|3| Exibir lista"
.LC23:
  .string "\tEscolha sua op\303\247\303\243o: "
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  call cria()
  movq %rax, -8(%rbp)
.L29:
  movl $.LC0, %edi
  call system
  movl $.LC7, %edi
  call puts
  movl $.LC19, %edi
  call puts
  movl $.LC20, %edi
  call puts
  movl $.LC21, %edi
  call puts
  movl $.LC22, %edi
  call puts
  movl $.LC7, %edi
  call puts
  movl $.LC23, %edi
  movl $0, %eax
  call printf
  leaq -12(%rbp), %rax
  movq %rax, %rsi
  movl $.LC3, %edi
  movl $0, %eax
  call scanf
  movl -12(%rbp), %eax
  cmpl $2, %eax
  je .L25
  cmpl $3, %eax
  je .L26
  cmpl $1, %eax
  jne .L27
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call push(nodo*)
  movq %rax, -8(%rbp)
  jmp .L27
.L25:
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call pop(nodo*)
  movq %rax, -8(%rbp)
  jmp .L27
.L26:
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call display(nodo*)
  nop
.L27:
  movl -12(%rbp), %eax
  testl %eax, %eax
  je .L28
  jmp .L29
.L28:
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call libera(nodo*)
  movl $0, %eax
  leave
  ret

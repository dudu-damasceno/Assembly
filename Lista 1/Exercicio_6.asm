#Exercício_6
.data
esp: .asciiz " "

.text
.globl main
main: 
	
	#Ler input N
	li $v0, 5
	syscall
	
	#Adiciona o valor em um registrador
	add $s2, $zero, $v0
	

	#Defini o primeiro numero a imprimir
	li $s1, 1
	
	#i = 1
	addi $t1, $zero, 1
	
ini:
	
	#Teste da variavel
	slt $t0, $t1, $s2 # (ti< s2) = (i < input) t1 = 1, else t1 = 0
	beq $t0, $zero, fim #if(t1 == 0) fim
	
	#Corpo do while
	#Imprime o valor
	li $v0, 1
	move $a0, $s1
	syscall
	
	#Imprime o espaço
	li $v0, 4
	la $a0, esp
	syscall
	
	#Passa para o proximo número impar
	addi $s1, $s1, 2
	
	#i++
	addi $t1, $t1, 1
	
	j ini

fim:

	#Imprime o ultimo valor
	li $v0, 1
	move $a0, $s1
	syscall

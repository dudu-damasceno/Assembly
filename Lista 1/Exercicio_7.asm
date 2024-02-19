#Exercício_7
.data
.text
.globl main

main:

ini:
	#Ler input N
	li $v0, 5
	syscall
	
	slt $t0, $v0, $zero #if input for menor que zero
	bne $t0, $zero, ini
	
	beq $v0, $zero, ini #if input for igual a zero
	
	#adiciona o input a um registrador
	add $s0, $zero, $v0
	
	#Imdice i
	li $t1, 1

while:	
	slt $t2, $t1, $s0 #Enquanto i for menor que input(t1 < s0 = 1) else: t1=0
	beq $t2, $zero, fim
	
	#Soma os valores ate N
	add $s1, $s1, $t1
	
	#i++
	addi $t1, $t1, 1
	j while
fim:
	#Soma o N
	add $s1, $s1, $t1
	
	#Imprime a soma
	li $v0, 1
	move $a0, $s1
	syscall
	
	
	
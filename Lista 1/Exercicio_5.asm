#Exercício 5
.data
esp: .asciiz " "


.text
.globl main
main:
	
	#Recebe inteiro n
	li $v0, 5
	syscall
	#Guarda o input em s0
	add $s0, $zero, $v0
	#Usado no loop para comparar com t0
	add $s1, $zero, $v0
	
	#Subtraendo da regressão
	li $t1, 1
	#se input igual a 1 so imprime 1
	beq $s0, $t1, fim
	
	#Loop de contagem
	li $t0, 0
	
ini:
	sub $t2, $s1, $t0
	beq $t2, $zero, fim
	
	#imprime o numero
	li $v0, 1
	move $a0, $s0
	syscall
	
	#imprime o espaço
	li $v0, 4
	la $a0, esp
	syscall
	
	#Subtrai o contador regressivamente/Corpo do loop
	sub $s0, $s0, $t1
	#se for igual a um vai para fim
	beq $s0, $t1, fim
	
	#passo
	addi $t0, $t0, 1
	j ini
	
fim:
	#Imprime o valor 1
	li $v0, 1
	li $a0, 1
	syscall

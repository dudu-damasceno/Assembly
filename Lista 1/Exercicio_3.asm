#Exercicio 3
.data 
s: .asciiz "Sim"
n: .asciiz "Nao"

.text
.globl main
main:
	
	#Input da idade
	li $v0, 5
	syscall
	
	#guardar idade no registrador s0 
	add $s0, $zero, $v0
	
	
	#Input do tempo
	li $v0, 5
	syscall
	
	#guardar tempo no registrador s1
	add $s1, $zero, $v0
	
	#Condicoes
if1:	
	# t0 = 64 anos de idade/ Pq o 65 é incluido
	li $t0, 64
	slt $t1, $t0, $s0
	beq $t1, $zero, if2
then1: #Ele tem mais que 65 anos
	li $v0, 4
	la $a0, s
	syscall
	j end_if
	
if2:
	# t0 = 34 anos de trabalho / Pq o 35 é incluido
	li $t0, 0
	li $t0, 34
	slt $t2, $t0, $s1
	beq $t2, $zero, if3
then2:	#Ele tem mais que 35 anos de trabalho
	li $v0, 4
	la $a0, s
	syscall
	j end_if

if3:
	# t0 = 60 anos de idada
	li $t0, 0
	li $t0, 60
	# t3 = 30 anos de trabalho
	li $t3, 30
	#Compara primeiro se ele tem 60
	slt $t4, $t0, $s0
	beq $t4, $zero, else
then3:
	#Compara se tem mais de 30 anos de trabalho
	if32:
	slt $t5, $t3, $s1
	beq $t5, $zero, else
	#Ele tem mais de 60 e tem mais 30 anos de trabalho
	li $v0, 4
	la $a0, s
	syscall
	j end_if
	
else:
	#Se ele não passar por nenhum desses quer dizer que ele não pode aposentar
	li $v0, 4
	la $a0, n
	syscall

end_if:

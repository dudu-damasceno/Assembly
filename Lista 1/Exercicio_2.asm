#Exercicio 2
.data
.text
.globl main
main:
	#Recebe primeiro input
	li $v0, 5
	syscall
	#Adiciona ao registrador s0 maior valor, no caso porque é o primeiro
	add $s0, $zero, $v0
	
	#Segundo input
	li $v0, 5
	syscall
	
	#Compara
	slt $t0, $s0, $v0 #Se antigo for menor que o maior t0 = 1
	beq $t0, $zero, end_if1
if1: #new input é maior que o antigo
	li $s0, 0
	add $s0, $zero, $v0
	
end_if1: #antigo é maior que o novo
	
	#Recebe terceiro input
	li $v0, 5
	syscall
	
	#Compara
	slt $t0, $s0, $v0 #Se antigo for menor que o maior t0 = 1
	beq $t0, $zero, end_if2

if2: #new input é maior que o antigo
	li $s0, 0
	add $s0, $zero, $v0

end_if2: #antigo é maior que o novo

	#Recebe quarto input
	li $v0, 5
	syscall

	#Compara
	slt $t0, $s0, $v0 #Se antigo for menor que o maior t0 = 1
	beq $t0, $zero, end_if3

if3: #new input é maior que o antigo
	li $s0, 0
	add $s0, $zero, $v0

end_if3: #antigo é maior que o novo
	#Imprime o maior valor
	li $v0, 1
	move $a0, $s0
	syscall
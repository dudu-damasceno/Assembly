#Exerc�cio 3 - Aula 12
.data
.text
.globl main
main:
	#Input
	li $v0, 5
	syscall
	
	#Passa como par�metro
	move $a0, $v0
	jal qua_perfeito
	
	#Imprime
	li $v0, 1
	move $a0, $v1
	syscall
	
	#Fim
	li $v0, 10
	syscall
	
.data
.text
qua_perfeito:
	#Pega uma variavel para descobrir se � um quadrado perfeito / i contadora
	li $t0, 0
loop:
	#Multiplica ela por ela msm
	mul $t1, $t0, $t0 #t0 x t0 = t1
	
	#Compara
	beq $t1, $a0, sim #� um quadrado perfeito
	slt $t2, $t1, $a0 #N�o � um quadrado perfeito, pois ultrapossou seu valor
	beq $t2, $zero, nao
	
	#i++
	addi $t0, $t0, 1
	
	j loop
sim:
	#Atribui o valor 1, � um quad perfeito
	li $v1, 1
	jr $ra

nao:
	#Atribui o valor 0, pois n � um quad perfeito
	li $v1, 0
	jr $ra
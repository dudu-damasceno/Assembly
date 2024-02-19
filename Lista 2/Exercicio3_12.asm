#Exercício 3 - Aula 12
.data
.text
.globl main
main:
	#Input
	li $v0, 5
	syscall
	
	#Passa como parâmetro
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
	#Pega uma variavel para descobrir se é um quadrado perfeito / i contadora
	li $t0, 0
loop:
	#Multiplica ela por ela msm
	mul $t1, $t0, $t0 #t0 x t0 = t1
	
	#Compara
	beq $t1, $a0, sim #É um quadrado perfeito
	slt $t2, $t1, $a0 #Não é um quadrado perfeito, pois ultrapossou seu valor
	beq $t2, $zero, nao
	
	#i++
	addi $t0, $t0, 1
	
	j loop
sim:
	#Atribui o valor 1, é um quad perfeito
	li $v1, 1
	jr $ra

nao:
	#Atribui o valor 0, pois n é um quad perfeito
	li $v1, 0
	jr $ra
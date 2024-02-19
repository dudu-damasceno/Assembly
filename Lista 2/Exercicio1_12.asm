#Exercício 1 - Aula 12
.data
.text
.globl main
main:

	#Ler os dois valores
	li $v0, 5
	syscall
	
	#t0 = first_input
	add $t0, $t0, $v0
	
	li $v0, 5
	syscall
	
	#t1 = second_input
	add $t1, $t1, $v0
	
	#Se t0 > t1, trocar
	slt $t3, $t0, $t1
	beq $t3, $zero, troca
	
	#Pega os input como parâmetros
	move $a0, $t0
	move $a1, $t1
	
	jal soma_intervalo
	
	#Encerra o programa
	li $v0, 10
	syscall
troca:
	#Fazer a troca de t0 com t1
	move $t4, $t0
	move $t0, $t1
	move $t1, $t4
	
	#Pega os input como parâmetros
	move $a0, $t0
	move $a1, $t1
	
	jal soma_intervalo
	
	#Encerra o programa
	li $v0, 10
	syscall
	
.data	
.text
soma_intervalo: 
	#Pégo a qnt de valores entre os numeros
	sub $t0, $a1, $a0

loop:
	
	#Soma ate o intervalo
	add $s0, $s0, $a0
	
	#Passa para o proximo numero
	addi $a0, $a0, 1
	
	#Passa o indice i++
	addi $t2, $t2, 1
	
	#LOOP
	bne $t0, $t2, loop
	
end_lopp:
	
	#Soma o ultimo valor
	add $s0, $s0, $a0
	#Imprime
	li $v0, 1
	move $a0, $s0
	syscall
	
	jr $ra
		

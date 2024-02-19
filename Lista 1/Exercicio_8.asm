#Exercício_8
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
	add $t0, $zero, $v0
	
	#Imdice i
	li $t1, 1       # Inicializa o resultado com 1

loop:
    	beq $t0, $zero, fim    # Se $t0 for igual a zero, vai para o final
    	mul $t1, $t1, $t0      # Multiplica $t1 pelo valor atual de $t0
    	addi $t0, $t0, -1      # Decrementa o valor de $t0 em 1
    	j loop                # Salta para a etiqueta "loop"

fim:
	
	li $v0, 1
	move $a0, $t1
	syscall
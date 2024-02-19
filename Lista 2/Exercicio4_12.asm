#Exercício 4 - Aula 12

.data
arr4: .word 0:4
n4: .word 4
arr6: .word 0:6
n6: .word 6
.text
.globl main
main:
	#Array 4
	li $t0, 0 #indice i
	la $t1, arr4 #Pega a base a array 4
	lw $t2, n4 #Pega a qnt de elementos
loop4: 
	#Input
	li $v0, 5
	syscall
	
	#Salva o input na posicao i
	sll $t3, $t0, 2
	add $t3, $t3, $t1	
	sw $v0, 0($t3)
	
	addi $t0, $t0, 1 #i++
	bne $t2, $t0, loop4 #Faz ate chegar no final da array
	li $t3, 0 #Zera o registrador para ser usado na proxima array
end_loop4:
	#Array 6
	li $t0, 0 #indice i
	la $t1, arr6 #Pega a base a array 6
	lw $t2, n6 #Pega a qnt de elementos
loop6:
	#Input
	li $v0, 5
	syscall
	
	#Salva o input na posicao i
	sll $t3, $t0, 2
	add $t3, $t3, $t1
	sw $v0, 0($t3)
	
	addi $t0, $t0, 1 #i++
	bne $t0, $t2, loop6 #Faz ate chegar no final da array
end_loop6:
	jal iguais
	
	#Imprime o somatório de iguais
	li $v0, 1
	move $a0, $v1
	syscall
	
	#Fim
	li $v0, 10
	syscall


.data
.text
iguais:
	#Cada numero da array 6 vai passar por todos da array 4
	li $t0, 0 #indice i
	la $t1, arr6 #Pega a base a array 6
	lw $t2, n6 #Pega a qnt de elementos	
	li $t3, 0
per_6:
	#Percorre a array
	sll $t3, $t0, 2
	add $t3, $t3, $t1
	lw $a0, 0($t3) 
per_4:	
	#Pega esse valor e compara com todos os numeros da array 4
	li $t4, 0 #indice i
	la $t5, arr4 #Pega a base a array 4
	lw $t6, n4 #Pega a qnt de elementos
loop_4per:
	sll $t7, $t4, 2
	add $t7, $t7, $t5
	lw $a1, 0($t7)
	
if:	#Se esse valor for diferente o da arr6
	bne $a0, $a1, end_per_4
	addi $s0, $s0, 1 #Adiciona 1 na variavel iguais
end_per_4:
	addi $t4, $t4, 1 #i++
	bne $t4, $t6, loop_4per #Faz ate chegar no final da array
	
end_per_6:
	addi $t0, $t0, 1 #i++
	bne $t0, $t2, per_6 #Faz ate chegar no final da array
	
	#Retorna somatorio de iguais
	move $v1, $s0
	
	jr $ra

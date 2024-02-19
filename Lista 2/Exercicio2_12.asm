#Exercicio 2 - Aula 12
.data
n: .word 6
arr: .word 0 : 6
.text
.globl main
main:
	#Ler tamanho do vetor
	lw $a0, n
	
	jal lerVetor
	
	jal maior_valor
	
	#Imprime o maior valor
	li $v0, 1
	move $a0, $v1
	syscall
	
	
	#Fim
	li $v0, 10
	syscall
	
.data
.text
lerVetor:
	#Inicializo o i
	addi $t0, $t0, 0
	#Pego a base do vetor
	la $t1, arr
loop:
	#Pegar o valor
	li $v0, 5
	syscall
	
	#Salvando na arr
	sll $t2, $t0, 2 #Qual lugar ela esta
	add $t2, $t2, $t1 #Adiciona a base 
	sw $v0, 0($t2) #Salva na posicao calculada
	
	#i++
	addi $t0, $t0, 1
	bne $t0, $a0, loop #Enquanto i != n ele continua

end_loop:
	jr $ra
	
.data
.text
maior_valor:
	li $t0, 0 #inicia i
	la $t1, arr #Pega a base do vetir
	li $t3, 0 #Inicia variavel do maior valor igual a 0
loop1:
	#Percorre a arr
	sll $t4, $t0, 2
	add $t4, $t4, $t1
	lw $s0, 0($t4)#Pegou o elemento do indice
if_maior:	
	#Novo elemento é maior que o antigo?
	slt $t5, $t3, $s0
	beq $t5, $zero, end_if
	move $t3, $s0 # troca
	
end_if: #Nao é maior e continuamos
	#i++
	addi $t0, $t0, 1
	bne $t0, $a0, loop1
	
end_loop1:

	#Retorna maior valor
	move $v1, $t3
	jr $ra
	
	
	
	

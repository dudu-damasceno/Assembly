#Exercício 1
.data 

#STRINGS
pos: .asciiz "positivo"
neg: .asciiz "negativo"

.text
.globl main
main:

	#Recebendo entradas
	li $v0, 5
	syscall

#Condições
slti $t0, $v0, 0
beq $t0, $zero, else
if: #Se o valor for negativo
	li $v0, 4
	la $a0, neg
	syscall
	
	j end_if
	
else: #Se o valor for positivo
	li $v0, 4
	la $a0, pos
	syscall
	
end_if:

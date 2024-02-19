#Exercicio 4
.data 
equi: .asciiz "equilatero"
iso: .asciiz "isoceles"
esc: .asciiz "escaleno"


.text
.globl main
main:
	#Input do primeiro lado
	li $v0, 5
	syscall
	#guardar primeiro lado 
	add $s0, $zero, $v0
	
	#Input do segundo lado
	li $v0, 5
	syscall
	#guardar segundo lado
	add $s1, $zero, $v0
	
	#Input do terceiro lado
	li $v0, 5
	syscall
	#guardar terceiro lado
	add $s2, $zero, $v0
	
	#Condicoes
if1:	
	
	bne $s0, $s1, if2
then1:  #Primeiro lado é igual ao segundo lado
	bne $s0, $s2, if2
	#Primeiro lado é igual ao terceiro
	li $v0, 4
	la $a0, equi
	syscall
	j end_if

	
if2:  
	beq $s0, $s1, else
        #Primeiro lado é diferente do segundo lado
	beq $s0, $s2, else
	#Primeiro lado é diferente do terceiro
	beq $s1, $s2, else  
	#Segundo lado é diferente do terceiro
	li $v0, 4
	la $a0, esc
	syscall
	j end_if
	
else:
	#Dois lados são iguais
	li $v0, 4
	la $a0, iso
	syscall

end_if:
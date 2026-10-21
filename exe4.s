.data
	base_menor: .asciiz "Digite o valor da base menor: "
	base_maior: .asciiz "Digite o valor da base maior: "
	altura: .asciiz "Digite o valor da altura: "
	area: .asciiz "O valor da area do trapezio e: "
	
.text
	main:
	# 1. Receber os valores
	#ler base menor
	li $v0, 4
	la $a0, base_menor
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	#ler base maior
	li $v0, 4
	la $a0, base_maior
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	#ler altura
	li $v0, 4
	la $a0, altura
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	# 2. Calcular trapezio
	# Area = ((base maior + base menor) * altura)/2)
	add $t0, $s0, $s1  # $t0 = base_menor + base_maior
	mul $t1, $t0, $s2  # $t1 = (base_menor + base_maior) * altura
	
	#Dividir por 2 usando deslocamento de bits (srl 1 equivale a dividir por 2)
	srl $s3, $t1, 1    # $s3 = $t1 / 2
	
	# 3. Exibir resultado
	li $v0, 4
	la $a0, area
	syscall
	
	li $v0, 1
	move $a0, $s3
	syscall
		
	# Encerrar programa
	li $v0, 10
	syscall
.data
	cateto_1:	.asciiz "Digite o primeiro cateto: "
	cateto_2:	.asciiz "Digite o segundo cateto: "
	hipotenusa:	.asciiz "O valor da Hipotenusa e: "
.text
	main:
	# 1. Receber os valores dos Catetos
	# Cateto 1
	li $v0, 4
	la $a0, cateto_1
	syscall
	
	li $v0, 6          # le float para $f0
	syscall
	mov.s $f1, $f0     # $f1 = cateto1
	
	# Cateto 2
	li $v0, 4
	la $a0, cateto_2
	syscall
	
	li $v0, 6          # Lê float para $f0
	syscall
	mov.s $f2, $f0     # $f2 = cateto2
	
	# 2. Calcular a Hipotenusa 
	# sqrt(a^2 + b^2)
	mul.s $f1, $f1, $f1  # $f1 = cateto1 ao quadrado
	mul.s $f2, $f2, $f2  # $f2 = cateto2 ao quadrado
	add.s $f3, $f1, $f2  # $f3 = a^2 + b^2
	sqrt.s $f12, $f3     # $f12 = sqrt($f3)
	
	# 3. Exibir resultado
	li $v0, 4
	la $a0, hipotenusa
	syscall
	
	li $v0, 2          # imprime float que esta em $f12
	syscall
	
	#fim do programa
	li $v0, 10
	syscall
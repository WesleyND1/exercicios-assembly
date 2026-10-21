.data
	num:	.asciiz "Digite um numero inteiro: "
	msg:	.asciiz "Resultado: "

.text
	main:
	# 1. Ler o numero
	li $v0, 4
	la $a0, num
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# 2. verificar se e negativo (< 0)
	bltz $t0, eh_negativo
	
	# caso positivo: calcula o dobro (N * 2)
	mul $t1, $t0, 2      # $t1 = N * 2
	j imprimir           # Pula o bloco de negativo

eh_negativo:
	# se negativo: calcula o triplo (N * 3)
	mul $t1, $t0, 3      # $t1 = N * 3

imprimir:
	# 3. Exibir a mensagem e o resultado
	li $v0, 4
	la $a0, msg
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	# Fim do programa
	li $v0, 10
	syscall
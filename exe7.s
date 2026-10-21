.data
	msg_n:	.asciiz "Digite um numero inteiro: "
	result:	.asciiz "Resultado: "

.text
	main:
	# 1. ler a variavel N
	li $v0, 4
	la $a0, msg_n
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# 2. Verificar se e par ou impar
	andi $t1, $t0, 1     # $t1 = 0 se for par, 1 se for impar
	
	#Se $t1 == 0 (é par), pula para o bloco 'eh_par'
	beqz $t1, eh_par
	
	# caso for impar: some 8
	addi $t2, $t0, 8     # $t2 = N + 8
	j imprimir           # pula para exibir

eh_par:
	# caso for par: some 5
	addi $t2, $t0, 5     # $t2 = N + 5

imprimir:
	# 3. exibir o resultado
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t2     
	syscall
	
	# Fim do programa
	li $v0, 10
	syscall
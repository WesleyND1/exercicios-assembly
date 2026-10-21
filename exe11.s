.data
	num:      .asciiz "\nDigite um numero (0-100) [Negativo para sair]: "
	msg_erro:    .asciiz "Numero invalido! Digite apenas valores entre 0 e 100.\n"
	res_0_25:    .asciiz "\nIntervalo [0-25]: "
	res_26_50:   .asciiz "\nIntervalo [26-50]: "
	res_51_75:   .asciiz "\nIntervalo [51-75]: "
	res_76_100:  .asciiz "\nIntervalo [76-100]: "

.text
	main:
	#inicializa os contadores em 0
	li $s0, 0    # Contador [0-25]
	li $s1, 0    # Contador [26-50]
	li $s2, 0    # Contador [51-75]
	li $s3, 0    # Contador [76-100]

loop_leitura:
	# 1. Solicita a entrada
	li $v0, 4
	la $a0, num
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0 # $t0 guarda o valor digitado

	# 2. Condicao para Parar: Num < 0
	bltz $t0, exibe_resultados

	# 3. validacao: Num > 100 e invalido
	li $t1, 100
	bgt $t0, $t1, numero_invalido

	# 4.classificacao nos intervalos
	li $t1, 25
	ble $t0, $t1, inc_0_25     # Se Num <= 25

	li $t1, 50
	ble $t0, $t1, inc_26_50    # Se Num <= 50

	li $t1, 75
	ble $t0, $t1, inc_51_75    # Se Num <= 75

	# Se chegou ate aqui e Num <= 100, esta no intervalo [76-100]
	addi $s3, $s3, 1
	j loop_leitura

inc_0_25:
	addi $s0, $s0, 1
	j loop_leitura

inc_26_50:
	addi $s1, $s1, 1
	j loop_leitura

inc_51_75:
	addi $s2, $s2, 1
	j loop_leitura

numero_invalido:
	li $v0, 4
	la $a0, msg_erro
	syscall
	j loop_leitura  # solicita o numero novamente sem alterar contadores

exibe_resultados:
	# exibe resultado de [0-25]
	li $v0, 4
	la $a0, res_0_25
	syscall
	li $v0, 1
	move $a0, $s0
	syscall

	# exibe resultado de [26-50]
	li $v0, 4
	la $a0, res_26_50
	syscall
	li $v0, 1
	move $a0, $s1
	syscall

	# exibir resultado de [51-75]
	li $v0, 4
	la $a0, res_51_75
	syscall
	li $v0, 1
	move $a0, $s2
	syscall

	# exibe resultado [76-100]
	li $v0, 4
	la $a0, res_76_100
	syscall
	li $v0, 1
	move $a0, $s3
	syscall

	#encerrar programa
	li $v0, 10
	syscall
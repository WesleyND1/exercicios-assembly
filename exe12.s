.data
	prompt_1:	.asciiz "Digite a altura da pessoa 1 (em cm): "
	prompt_i:	.asciiz "Digite a altura da pessoa "
	dois_pontos:	.asciiz " (em cm): "
	msg_menor:	.asciiz "\nA menor altura do grupo e: "
	msg_maior:	.asciiz " cm\nA maior altura do grupo e: "
	cm:		.asciiz " cm"

.text
	main:
	# 1. ler a primeira altura para inicializar maior e menor
	li $v0, 4
	la $a0, prompt_1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0        # $t0 = Altura lida
	move $s0, $t0        # $s0 = Menor altura
	move $s1, $t0        # $s1 = Maior altura

	# 2. Loop para as outras 14 pessoas (2 ate 15)
	li $t1, 2            # $t1 = contador do loop (inicia em 2)
	li $t2, 15           # $t2 = limite de 15 pessoas

loop_alturas:
	bgt $t1, $t2, exibe_resultados #se contador > 15, encerra o loop

	# mostrar "Digite a altura da pessoa X (em cm): "
	li $v0, 4
	la $a0, prompt_i
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, dois_pontos
	syscall

	#ler a altura
	li $v0, 5
	syscall
	move $t0, $v0 # $t0 = Altura atual

	#compara com a menor altura ($s0)
	blt $t0, $s0, atualiza_menor
	j checa_maior

atualiza_menor:
	move $s0, $t0 #nova menor altura encontrada

checa_maior:
	#compara com a maior altura ($s1)
	bgt $t0, $s1, atualiza_maior
	j proxima_iteracao

atualiza_maior:
	move $s1, $t0 #nova maior altura encontrada

proxima_iteracao:
	addi $t1, $t1, 1     # contador++
	j loop_alturas

exibe_resultados:
	# exibe Menor Altura
	li $v0, 4
	la $a0, msg_menor
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall

	# exibe Maior Altura
	li $v0, 4
	la $a0, msg_maior
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall

	li $v0, 4
	la $a0, cm
	syscall

	# Fim do programa
	li $v0, 10
	syscall
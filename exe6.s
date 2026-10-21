.data
	valor_a:	.asciiz "Digite o valor de A: "
	valor_b:	.asciiz "Digite o valor de B: "
	msg_c:		.asciiz "O valor de C e: "

.text
	main:
	# 1. ler o valor de A
	li $v0, 4
	la $a0, valor_a
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	# 2. ler o valor de B
	li $v0, 4
	la $a0, valor_b
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0
	
	# 3. Comparar se A == B
	beq $t0, $t1, sao_iguais
	
	# se forem difirente: C = A * B
	mul $t2, $t0, $t1    # $t2 guarda C (multiplicacao)
	j exibir_resultado   # pula o bloco 'sao_iguais' para nao somar

sao_iguais:
	# se forem iguais: C = A + B
	add $t2, $t0, $t1    # $t2 guarda C (soma)

exibir_resultado:
	# 4. exibir a mensagem e o valor de C ($t2)
	li $v0, 4
	la $a0, msg_c
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	# Fim do programa
	li $v0, 10
	syscall
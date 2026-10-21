.data
	n_1:	.asciiz "Digite o primeiro numero: "
	n_2:	.asciiz "Digite o segundo numero (o divisor nao pode ser 0): "
	msg_erro:	.asciiz "Valor invalido! O divisor nao pode ser zero.\n"
	result:	.asciiz "O resultado da divisao e: "

.text
	main:
	# 1. Ler o 1º número ($t0)
	li $v0, 4
	la $a0, n_1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

ler_segundo_numero:
	# 2. ler o 2º numero ($t1)
	li $v0, 4
	la $a0, n_2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0        # $t1 = divisor
	
	# 3. Validar se o 2º número é zero
	# Se $t1 != 0, desvia para realizar a divisao
	bnez $t1, realiza_divisao
	
	#caso seja zero: mostrar mensagem de erro e volta a solicitar
	li $v0, 4
	la $a0, msg_erro
	syscall
	
	j ler_segundo_numero #repete a leitura do 2º numero

realiza_divisao:
	# 4. Calcular a divisão ($t0 / $t1)
	div $t0, $t1
	mflo $t2 # $t2 = quociente da divisao

	# 5. Exibir resultado
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	# Fim do programa
	li $v0, 10
	syscall
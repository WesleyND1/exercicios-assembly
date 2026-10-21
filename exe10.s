.data
	num_1:	.asciiz "Digite o primeiro valor: "
	num_2:	.asciiz "Digite o segundo valor: "
	result:	.asciiz "O resto da divisao do maior pelo menor e: "

.text
	main:
	# 1. Ler o primeiro numero ($t0)
	li $v0, 4
	la $a0, num_1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	# 2. Ler o segundo numero ($t1)
	li $v0, 4
	la $a0, num_2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	# 3. verificar que $t0 seja o maior e $t1 seja o menor
	# Se $t0 >= $t1, a ordem esta certa
	bge $t0, $t1, ordem_ok
	
	# caso contrario $t0 < $t1, trocar os valores
	move $t2, $t0        # aux = $t0
	move $t0, $t1        #$t0 = $t1 (maior)
	move $t1, $t2        #$t1 = aux (menor)

ordem_ok:
	# $t0 = Maior(Dividendo)
	# $t1 = Menor(Divisor)

	# 4. calcular o quociente usando DIV
	div $t0, $t1         # Maior / Menor
	mflo $t2             # $t2 = Quociente da divisao inteira

	# 5. Calcular (Quociente * Menor) usando MUL
	mul $t3, $t2, $t1    # $t3 = Quociente * Divisor

	# 6. calcular o Resto usando 'SUB': Resto = Maior - (Quociente * Menor)
	sub $t4, $t0, $t3    # $t4 = Resto

	# 7. mostrar o resultado
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall

	# Fim do programa
	li $v0, 10
	syscall
.data
	#Mensagens a serem exibidas
	qtde_hora: .asciiz "Insira a quantidade das horas trabalhadas: "
	qtde_hora_extra: .asciiz "Digite a quantidade das horas extras: "
	desconto: .asciiz "Digite o valor de desconto: "
	
	salario_liquido: .asciiz "O salario liquido e: "
	salario_bruto: .asciiz "O salario bruto e: "
	
.text
	main:
	# 1. Receber os valores de qtde_horas, qtde_extras e desconto
	#Ler Quantidade de Horas
	li $v0, 4 #imprimir mensagem
	la $a0, qtde_hora
	syscall
	
	li $v0, 5	#ler inteiro
	syscall
	move $s0, $v0	# $s0 = horas normais/dia
	
	#Ler Quantidade de horas extras
	li $v0, 4 #imprimir mensagem
	la $a0, qtde_hora_extra
	syscall
	
	li $v0, 5 #ler inteiro
	syscall
	move $s1, $v0 #guarda o valor das horas extras em $s1
	
	#Ler Desconto
	li $v0, 4 #imprimir mensagem
	la $a0, desconto
	syscall
	
	li $v0, 5 #ler inteiro
	syscall
	move $s2, $v0 #guarda o valor do desconto em $s2
	
	# 2. Processar: calcular salario liquido e bruto
	#Calculo do ganho diario
	li $t0, 10		#carrega as horas em um registrador temporário $t0
	mul $t1, $s0, $t0	# $t1 = horas_normais * R$10,00 
	
	li $t0, 15		#subescreve o valor anterior (R$10) por 15
	mul $t2, $s1, $t0	# $t2 = hora_extras * R$15,00
	
	add $t3, $t1, $t2	# $t3 = ganho diario (horas normais + horas extras)
	
	# Salario Bruto = Multiplicacao por 30 dias
	li $t0, 30           # guarda temporariamente 30 dias no $t0
	mul $s3, $t3, $t0    # $s3 = $t3 * 30 (salario bruto salvo no $s3)
	
	# Calculo Salario Liquido
	sub $s4, $s3, $s2 	#$s4 = SalarioBruto($s3) - Desconto($s2)
	
	# 3. Mostrar resultados
	#exibir salario bruto
	li $v0, 4
	la $a0, salario_bruto
	syscall
	
	li $v0, 1 #exibir inteiro
	move $a0, $s3
	syscall
	
	
	#exibir salario liquido
	li $v0, 4
	la $a0, salario_liquido
	syscall
	
	li $v0, 1
	move $a0, $s4
	syscall
	
	#encerrar programa
	li $v0, 10
	syscall
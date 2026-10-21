.data
	#Mensagens de entrada para cada tipo de camiseta
	camisa_pequena:	.asciiz "Digite a quantidade de camisetas pequenas: "
	camisa_media:	.asciiz "Digite a quantidadse de camisetas médias: "
	camisa_grande:	.asciiz "Digite a quantidade de camisetas grandes: "
	
	#mensagem de saída
	msg_total: .asciiz "Valor total arrecadado:"
.text
	main:
	#Ler a quatidade de preços
		# 1. Camiseta pequena (preco: R$10)
		li $v0, 4 #exibir mensagem
		la $a0, camisa_pequena
		syscall
		
		li $v0, 5 #ler inteiro
		syscall
		move $s0, $v0 #armazena a qtde de pequena em $s0
		
		# 2. camiseta média (preco: R$12)
		li $v0, 4 #exibir mensagem
		la $a0, camisa_media
		syscall
		
		li $v0, 5 #ler inteiro
		syscall 
		move $s1, $v0 #guarda a qtde de media no registrador $s1
		
		# 3. camiseta grande (preco: R$15)
		li $v0, 4 #exibir mensagem
		la $a0, camisa_grande
		syscall
		
		li $v0, 5 # ler inteiro
		syscall
		move $s2, $v0  #guarda a qtde de grande em $s2
		
		# 4. Calcular o total arrecadado
		# calcular o subtotal de camisas pequenas ($s0 * 10)
		li $t0, 10		#carrega o preço 10 em um registrador temporário $t0
		mul $t1,$s0, $t0	# $t1 = qtde_pequena * 10
		
		# calculando o subtotal das camisas médias ($s1 * 12)
		li $t0, 12		#subescreve o preco anterior (R$10) por 12
		mul $t2, $s1, $t0	#$t2 = qtde_media * 12
		
		# calculando o subtotal das camisas grandes ($s2 * 15)
		li $t0, 15		#subescreve o preco anterior (R$12) por 15
		mul $t3, $s2, $t0	# $t3 = qtde_grandes * 15
		
		# Somar tudo para achar o valor total da venda
		add $t4, $t1, $t2	#$t4 = (subtotal pequenas + subtotal médias)
		add $t4, $t4, $t3	# $t4 = $t4 + subtotal grandes (valor final)
		
		# 5. exibir resultado
		li $v0, 4  #mensagem de texto
		la $a0, msg_total
		syscall
		
		li $v0, 1	#mostra o valor guardado em $t4
		move $a0, $t4
		syscall
		
		# 6. finalizar o programa
		li $v0, 10
		syscall 
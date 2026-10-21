.data
    #Seção de dados: Armazena as strings (mensagens) exibidas ao usuário
    msg_largura:     .asciiz "Digite a largura do terreno: "
    msg_comprimento: .asciiz "Digite o comprimento do terreno: "
    msg_resultado:   .asciiz "A area do terreno e: "

.text
    #Seção de código (instruções)
    main:
    	# 1 - Ler a largura do Terreno
        #Exibe a mensagem pedindo a largura
        li $v0, 4                # Código 4: syscall para imprimir string
        la $a0, msg_largura      # Carrega o endereço da string em $a0
        syscall                  # Executa a chamada do sistema

        #Lê o número inteiro digitado
        li $v0, 5                   # Código 5: syscall para ler inteiro
        syscall                     # Executa (o valor lido vem para o registrador $v0)
        move $s0, $v0               # Move a largura guardada em $v0 para o registrador $s0

        # 2 - Ler o comprimento do Terreno
        # Exibe a mensagem pedindo o comprimento
        li $v0, 4                   # Código 4: imprimir string
        la $a0, msg_comprimento  # Carrega o endereço da string de comprimento
        syscall

        #Lê o número inteiro digitado
        li $v0, 5                   # Código 5: ler inteiro
        syscall
        move $s1, $v0               # Move o comprimento lido para o registrador $s1

        # 3 - Calcular a Área (Área = Largura * Comprimento)
        #A instrução 'mul' multiplica dois registradores e guarda em um terceiro
        mul $s2, $s0, $s1           # $s2 = $s0 (largura) * $s1 (comprimento)

        # 4. Exibir o Resultado
        #Mostra a mensagem do resultado
        li $v0, 4                   # Código 4: imprimir string
        la $a0, msg_resultado       # Carrega o endereço da mensagem de resultado
        syscall

        # Exibe o valor da área calculada
        li $v0, 1                   # Código 1: syscall para imprimir inteiro
        move $a0, $s2               # Move o valor da área ($s2) para o argumento ($a0)
        syscall

        # 5. Encerrar o Programa
        li $v0, 10                  # Código 10: syscall para encerrar o programa (sair)
        syscall
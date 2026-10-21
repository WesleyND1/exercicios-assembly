# Exercícios de Assembly MIPS

Este repositório contém 12 exercícios desenvolvidos em *Assembly MIPS* e testados no simulador **MARS (MIPS Assembler and Runtime Simulator)**.

---

## 🛠️ Como Executar os Programas

### Pré-requisitos
- **Java Runtime Environment (JRE)** instalado.
- **MARS Simulator** (arquivo `.jar`).

### Passo a Passo no MARS
1. Abra o simulador MARS.
2. Acesse `File` > `Open` (ou pressione `Ctrl + O`) e selecione o arquivo do exercício (ex: `exercicio01.s`).
3. Monte o programa clicando no ícone de chave de fenda/martelo ou vá em `Run` > `Assemble` (`F3`).
4. Execute o programa clicando no ícone de play verde ou vá em `Run` > `Go` (`F5`).
5. Acompanhe a entrada e saída de dados no painel **MARS Messages / I/O** na parte inferior.

---

## Descrição dos Exercícios

| Exemplo/Arquivo | Descrição do Exercício |
| :--- | :--- |
| **Exercício 1** | **Cálculo de Área de Terreno:** Leitura das dimensões (largura e comprimento) de um terreno retangular e exibição da área total. |
| **Exercício 2** | **Faturamento de Camisetas:** Cálculo do valor total arrecadado na venda de camisetas pequenas (R\$ 10), médias (R\$ 12) e grandes (R\$ 15) com base nas quantidades informadas pelo usuário. |
| **Exercício 3** | **Cálculo de Salário:** Leitura de horas normais trabalhadas (R\$ 10,00/h), horas extras (R\$ 15,00/h) e valor de desconto para calcular e exibir o salário bruto e o salário líquido. |
| **Exercício 4** | **Área do Trapézio (Inteiros):** Cálculo da área de um trapézio utilizando apenas números inteiros através da fórmula $A = \frac{(\text{base maior} + \text{base menor}) \times \text{altura}}{2}$. |
| **Exercício 5** | **Cálculo da Hipotenusa:** Leitura dos catetos de um triângulo retângulo para calcular e exibir a hipotenusa. |
| **Exercício 6** | **Soma ou Multiplicação Condicional:** Leitura de dois valores inteiros $A$ e $B$. Se $A = B$, realiza a soma; caso contrário, multiplica $A$ por $B$. Armazena o resultado em $C$ e o exibe. |
| **Exercício 7** | **Ajuste Par/Ímpar:** Leitura de um número inteiro. Soma +5 se o número for par ou +8 se for ímpar, exibindo o resultado final. |
| **Exercício 8** | **Dobro ou Triplo:** Leitura de um número. Exibe o seu dobro caso seja positivo ou o seu triplo caso seja negativo. |
| **Exercício 9** | **Divisão com Validação:** Leitura de dois números inteiros para exibir a divisão. Valida o segundo número em loop até que seja diferente de zero. |
| **Exercício 10** | **Resto da Divisão sem Operação `REM`:** Recebe dois inteiros e calcula o resto da divisão do maior pelo menor sem utilizar a instrução `rem`. Utiliza apenas as operações `div`, `mul` e `sub`. |
| **Exercício 11** | **Contagem por Intervalos [0-100]:** Leitura contínua de números dentro do intervalo [0, 100] (com validação de entrada). Contabiliza a quantidade nos intervalos `[0-25]`, `[26-50]`, `[51-75]` e `[76-100]`. Encerra a leitura ao receber um número negativo. |
| **Exercício 12** | **Menor e Maior Altura:** Leitura da altura (em centímetros) de 15 pessoas e exibição da menor e da maior altura do grupo. |

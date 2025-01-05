programa
{
    // Função para exibir o menu inicial do jogo
	funcao menuJogo(){
		inteiro opcao
		escreva("\nMENU INICIAL\n")
		escreva(" 1. Cadastrar um filme\n 2. Listar filmes locados e disponiveis\n 3. Filmes Locados\n")
		escreva(" 4. Alugar um filme\n 5. Devolver Filme\n 6. Filme mais locado\n 7. Sair do Programa \n\n")
		leia(opcao)  // Recebe a opção do usuário
	}

	funcao dadosFilme (cadeia NOME, inteiro ANO, inteiro QNTALUG, cadeia DISPONIVEL){
		
		escreva("\nDigite o nome do filme: \n")
		leia(NOME)  // Recebe o nome do filme
		escreva("\nDigite o ano de lançamento do filme: \n")
		leia(ANO)  // Recebe o ano de lançamento do filme
		escreva("\nQuantas vezes o filme foi alugado? \n")
		leia(QNTALUG)  // Recebe a quantidade de vezes que o filme foi alugado
		escreva("\nO filme ja esta locado? \n Responda com SIM ou NAO \n") 
		leia(DISPONIVEL)  // Recebe a disponibilidade do filme
	}
	
    funcao cadastro(cadeia &NOME, inteiro &ANO, inteiro &QNTALUG, cadeia &DISPONIVEL){
		inteiro indice
		inteiro preenchidos = 0
		inteiro filmes[10]

		// Inicializar o vetor
		para (inteiro i = 0; i < 10; i++){
            filmes[i] = 0
        	}
        	escreva("Digite o índice (0 a 9) que deseja preencher: ")
            leia(indice)

            // Validar se o índice está no intervalo correto
            se (indice >= 0 e indice < 10)
            {
              dadosFilme(NOME, ANO, QNTALUG, DISPONIVEL)

                preenchidos = preenchidos + 1
            }senao{
                escreva("Índice inválido! Tente novamente.\n")
            }
            
    }

    // Função para listar filmes disponíveis
	funcao listar(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
		para(inteiro i = 0; i < 10; i++){
			se(DISPONIVEL == "NAO"){  // Exibe filmes disponíveis
				escreva(NOME, ANO)
			}
		}
	}

    // Função para listar filmes locados
	funcao locados(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
		para(inteiro i = 0; i < 10; i++){
			se(DISPONIVEL == "SIM"){  // Exibe filmes locados
				escreva(NOME, ANO)
			}
		}
	}

    // Função para alugar um filme
	funcao alugar(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
		listar(DISPONIVEL, NOME, ANO)  // Chama a função listar para mostrar filmes disponíveis
		escreva("Qual filme deseja locar?")  // Solicita ao usuário escolher o filme para alugar
	}

    // Função para devolver um filme
	funcao devolver(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
	    escreva("Filmes locados:\n")
	    locados(DISPONIVEL, NOME, ANO)  // Exibe os filmes que estão locados
	    
	    escreva("Qual filme deseja devolver? Escolha o índice: ")
	    inteiro indice
	    leia(indice)  // Recebe o índice do filme a ser devolvido
	    
	    // Verifica se o filme está locado (disponível == "Sim")
		se(indice >= 0 e DISPONIVEL == "SIM") {
		    DISPONIVEL = "NAO"  // Marca o filme como devolvido
		    escreva("Filme devolvido com sucesso!\n")
		} senao {
		    escreva("Índice inválido ou filme não está locado!\n")  // Caso o índice seja inválido ou o filme não esteja locado
		}
	}

    // Função para exibir o filme mais locado
	funcao filmeMaisLocado() {
	    inteiro indiceMaisLocado = 0
	    cadeia NOME[10] = {"", "", "", "", "", "", "", "", "", ""}  // Vetor de nomes dos filmes
	    inteiro ANO[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}  // Vetor de anos de lançamento
	    inteiro QNTALUG[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}  // Vetor com a quantidade de vezes que o filme foi alugado
	
	    // Encontra o índice do filme mais locado
	    para(inteiro i = 1; i < 10; i++) {
	        se(QNTALUG[i] > QNTALUG[indiceMaisLocado]) {
	            indiceMaisLocado = i
	        }
	    }
	
	    // Exibe as informações do filme mais locado
	    escreva("Filme mais locado:\n")
	    escreva("Nome: ", NOME[indiceMaisLocado], "\n")
	    escreva("Ano de lançamento: ", ANO[indiceMaisLocado], "\n")
	    escreva("Número de vezes alugado: ", QNTALUG[indiceMaisLocado], "\n")
	}

    // Função principal (início) que controla o fluxo do programa
	funcao inicio()
	{
		inteiro opcao = 1, ano = 1, qntAlug = 0, preenchidos = 0
		cadeia nome="", disponivel="", filmes[10]
        	inteiro indice

		faca{
			menuJogo()  // Exibe o menu inicial

			// Caso o usuário escolha a opção 1: Cadastro de filme
			se(opcao == 1){
				cadastro(nome, ano, qntAlug, disponivel)
				menuJogo()  // Exibe o menu novamente após o cadastro
			}

			// Caso o usuário escolha a opção 2: Listar filmes disponíveis
			se(opcao == 2){
				listar(disponivel, nome, ano)
				menuJogo()  // Exibe o menu novamente
			}

			// Caso o usuário escolha a opção 3: Listar filmes locados
			se(opcao == 3){
				locados(disponivel, nome, ano)
				menuJogo()  // Exibe o menu novamente
			}

			// Caso o usuário escolha a opção 4: Alugar um filme (falta implementação)
			se(opcao == 4){
				// Adicionar código para alugar filme
			}

			// Caso o usuário escolha a opção 5: Devolver um filme
			se(opcao == 5){
    				devolver(disponivel, nome, ano)  // Chama a função para devolver filme
    				menuJogo()  // Exibe o menu novamente
			}

			// Caso o usuário escolha a opção 6: Mostrar o filme mais locado
			se(opcao == 6){
    				filmeMaisLocado()  // Chama a função para exibir o filme mais locado
    				menuJogo()  // Exibe o menu novamente
			}

		}enquanto(opcao < 7)  // O programa continuará até que a opção 7 (Sair) seja escolhida
	}
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4260; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = {filmes, 27, 10, 6}-{filmes, 115, 33, 6};
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
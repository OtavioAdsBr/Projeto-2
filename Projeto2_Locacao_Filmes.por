programa
{
	funcao menuJogo(){
		inteiro opcao
		escreva("\nMENU INICIAL\n")
		escreva(" 1. Cadastrar um filme\n 2. Listar filmes locados e disponiveis\n 3. Filmes Locados\n")
		escreva(" 4. Alugar um filme\n 5. Devolver Filme\n 6. Filme mais locado\n 7. Sair do Programa \n\n")
		leia(opcao)
	}

	funcao cadastro(cadeia NOME, inteiro ANO, inteiro QNTALUG, cadeia DISPONIVEL){
		cadeia filmes[10]
		inteiro i
		
		para(i = 0; i <=9; i++){
			escreva("\nDigite o nome do filme: \n")
			leia(NOME)
			escreva("\nDigite o ano de lançamento do filme: \n")
			leia(ANO)
			escreva("\nQuantas vezes o filme foi alugado? \n")
			leia(QNTALUG)
			escreva("\nO filme ja esta locado? \n") 
			leia(DISPONIVEL)
		}
		se( i > 9){
			escreva("Não é possivel fazer mais cadastros, limite de 10 filmes")
		}
	}

	funcao listar(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
		para(inteiro i = 0; i < 10; i++){
			se(DISPONIVEL == "Não"){
				escreva(NOME, ANO)
			}
		}
	}

	funcao locados(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
		para(inteiro i = 0; i < 10; i++){
			se(DISPONIVEL == "Sim"){
				escreva(NOME, ANO)
			}
		}
	}

	funcao alugar(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
		listar(DISPONIVEL, NOME, ANO) 
		escreva("Qual filme deseja locar?")
	}

	funcao devolver(cadeia DISPONIVEL, cadeia NOME, inteiro ANO){
	    escreva("Filmes locados:\n")
	    locados(DISPONIVEL, NOME, ANO)
	    
	    escreva("Qual filme deseja devolver? Escolha o índice: ")
	    inteiro indice
	    leia(indice)
	    
		se(indice >= 0 e DISPONIVEL == "Sim") {
		    DISPONIVEL = "Não" // Marca o filme como disponível
		    escreva("Filme devolvido com sucesso!\n")
		} senao {
		    escreva("Índice inválido ou filme não está locado!\n")
		}
	}
	funcao filmeMaisLocado() {
	    inteiro indiceMaisLocado = 0
	    cadeia NOME[10] = {"", "", "", "", "", "", "", "", "", ""}
	    inteiro ANO[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	    inteiro QNTALUG[10] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
	
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


		
	funcao inicio()
	{
		inteiro opcao = 1, ano = 1, qntAlug = 0
		cadeia nome="", disponivel="", filmes[10]

		faca{
			menuJogo()

			se(opcao == 1){
				
				cadastro(nome,ano,qntAlug,disponivel)
				menuJogo()
				}
				
			se(opcao == 2){
				listar(disponivel, nome, ano)
				menuJogo()
			}

			se(opcao == 3){
				locados(disponivel, nome, ano)
			}

			se(opcao == 4){
				
			}
			se(opcao == 5){
    				devolver(disponivel, nome, ano) 
			}

			se(opcao == 6){
    				filmeMaisLocado()  // Chamada correta sem parâmetros
			}
			
			
			
		}enquanto(opcao < 7)


		
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 2532; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */
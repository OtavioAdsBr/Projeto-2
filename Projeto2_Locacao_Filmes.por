programa
{
  // Função para exibir o menu inicial do jogo
  funcao inteiro menuJogo()
{
	inteiro opcao
	faca
	{
	limpa() // Limpa o console antes de exibir o menu
	escreva("\nMENU INICIAL\n")
	escreva(" 1. Cadastrar um filme\n 2. Listar filmes cadastrados\n 3. Filmes Locados\n")
	escreva(" 4. Alugar um filme\n 5. Devolver Filme\n 6. Filme mais locado\n 7. Sair do Programa \n\n")
	escreva("Escolha uma opção: ")
	leia(opcao)  // Recebe a opção do usuário
	
	// Verifica se a opção está no intervalo permitido
	 se (opcao < 1 ou opcao > 7)
	{
	  escreva("\nOpção inválida! Por favor, escolha uma opção entre 1 e 7.\n")
	  escreva("Pressione ENTER para tentar novamente...")
	  cadeia pausa
	  leia(pausa) // Pausa antes de repetir o menu
	 }
	 
	 } enquanto (opcao < 1 ou opcao > 7)  // Continua até o usuário inserir uma opção válida
	
	    retorne opcao
	}
	// Função para cadastrar novos filmes no sistema
	funcao inteiro cadastrarFilmes(cadeia nome[], inteiro ano[], inteiro qntAlug[], cadeia disponivel[], inteiro filmesCadastrados)
	{
	    inteiro quantidade
	
	    // Verifica se o limite de filmes foi atingido
	    se (filmesCadastrados >= 10)
	    {
	        escreva("\nNão é possível cadastrar mais filmes. O limite de 10 foi alcançado.\n")
	        retorne filmesCadastrados
	    }
	    limpa()  // Limpa o console antes do cadastro
	
	    faca
	    {
	        escreva("\nQuantos filmes deseja cadastrar? (Disponível: ", 10 - filmesCadastrados, ")\n")
	        leia(quantidade)
	
	        // Verifica se a quantidade de filmes não ultrapassa o limite
	        se (quantidade > 10 - filmesCadastrados)
	        {
	            escreva("\nVocê só pode cadastrar até ", 10 - filmesCadastrados, " filmes.\n")
	            escreva("Tente novamente...\n")
	        }
	    } enquanto (quantidade > 10 - filmesCadastrados)  // Repete até uma quantidade válida ser fornecida
	
	    // Coleta os dados dos novos filmes
	    para (inteiro i = filmesCadastrados; i < filmesCadastrados + quantidade; i++)
	    {
	        limpa()  // Limpa o console antes do cadastro
	        escreva("\nDigite o nome do filme ", i + 1 - filmesCadastrados, ": ")
	        leia(nome[i])
	
	        // Validação do ano de lançamento
	        faca
	        {
	            escreva("Digite o ano de lançamento do filme ", i + 1 - filmesCadastrados, " (1888 a 2024): ")
	            leia(ano[i])
	
	            se (ano[i] < 1888 ou ano[i] > 2024)
	            {
	                escreva("\nAno inválido! Digite um ano entre 1888 e 2024.\n")
	            }
	        } enquanto (ano[i] < 1888 ou ano[i] > 2024)
	
	        // Validação da quantidade de vezes alugado
	        faca
	        {
	            escreva("Quantas vezes o filme foi alugado? (número inteiro não negativo): ")
	            leia(qntAlug[i])
	
	            se (qntAlug[i] < 0)
	            {
	                escreva("\nNúmero inválido! Digite um número inteiro não negativo.\n")
	            }
	        } enquanto (qntAlug[i] < 0)
	
	        escreva("O filme já está locado? (SIM ou NAO): ")
	        leia(disponivel[i])
	
	        // Verifica se a entrada para locação é válida
	        enquanto (disponivel[i] != "SIM" e disponivel[i] != "NAO")
	        {
	            escreva("\nEntrada inválida. Digite 'SIM' ou 'NAO': ")
	            leia(disponivel[i])
	        }
	    }
	
	    filmesCadastrados += quantidade  // Atualiza o total de filmes cadastrados
	    escreva("\nCadastro concluído com sucesso!\n")
	    retorne filmesCadastrados
}



	// Função para listar todos os filmes cadastrados e seus status
	funcao listarFilmes(cadeia nome[], inteiro ano[], inteiro qntAlug[], cadeia disponivel[], inteiro filmesCadastrados)
{
	    limpa() // Limpa o console antes de exibir a lista de filmes
	
	    se (filmesCadastrados == 0)
	    {
	        escreva("\nNenhum filme cadastrado.\n")
	        escreva("\nPressione ENTER para voltar ao menu...")
	        cadeia pausa
	        leia(pausa) // Variável auxiliar para pausar
	        limpa() // Limpa o console antes de retornar ao menu
	        retorne
	    }
	
	    escreva("\nLista de Filmes Cadastrados e Status:\n")
	    para (inteiro i = 0; i < filmesCadastrados; i++)
	    {
	        escreva("\nFilme ", i + 1, ":")
	        escreva("\nNome: ", nome[i])
	        escreva("\nAno: ", ano[i])
	        escreva("\nQuantidade de Aluguéis: ", qntAlug[i])
	        escreva("\nDisponível para locação? ", disponivel[i], "\n")
	    }
	
	    escreva("\nPressione ENTER para voltar ao menu...")
	    cadeia pausa //Capturar a entrada do usuário e pausar a execução até que ele pressione ENTER.
	    leia(pausa) // Variável auxiliar para pausar
	
	    limpa() // Limpa o console novamente antes de exibir o menu
}


  // Função para listar apenas os filmes locados
	funcao locados(cadeia nome[], inteiro ano[], inteiro qntAlug[], cadeia disponivel[], inteiro filmesCadastrados)
{
	    limpa()  // Limpa o console antes de exibir os filmes locados
	
	    // Verifica se há filmes cadastrados
	    se (filmesCadastrados == 0)
	    {
	        escreva("\nNenhum filme cadastrado no sistema.\n")
	        escreva("\nPressione ENTER para voltar ao menu...")
	        cadeia pausa
	        leia(pausa)  // Pausa antes de voltar ao menu
	        limpa()  // Limpa o console antes de retornar ao menu
	        retorne
	    }
	
	    inteiro contador = 0  // Variável para contar filmes locados
	
	    escreva("\nLista de Filmes Locados:\n")
	    para (inteiro i = 0; i < filmesCadastrados; i++)
	    {
	        se (disponivel[i] == "SIM")  // Verifica se o filme está locado
	        {
	            escreva("\nFilme ", contador + 1, ":")
	            escreva("\nNome: ", nome[i])
	            escreva("\nAno: ", ano[i])
	            escreva("\nQuantidade de Aluguéis: ", qntAlug[i])
	            escreva("\nJá está locado? ", disponivel[i], "\n")
	            contador++  // Incrementa o contador de filmes locados
	        }
	    }
	
	    // Verifica se nenhum filme foi locado
	    se (contador == 0)
	    {
	        escreva("\nNenhum filme locado no momento.\n")
	    }
	
	    escreva("\nPressione ENTER para voltar ao menu...")
	    cadeia pausa
	    leia(pausa)  // Pausa antes de voltar ao menu
	    limpa()  // Limpa o console antes de retornar ao menu
}



  // Função para alugar um filme
	funcao alugar(cadeia nome[], inteiro ano[], inteiro qntAlug[], cadeia disponivel[], inteiro filmesCadastrados)
	{
	    limpa()  // Limpa o console antes do cadastro
	    se (filmesCadastrados == 0)
	    {
	        escreva("\nNão há filmes cadastrados. Por favor, cadastre um filme antes de tentar alugar.\n")
	        escreva("\nPressione ENTER para voltar ao menu...")
	        cadeia pausa
	        leia(pausa) // Variável auxiliar para pausar
	        limpa() // Limpa o console antes de retornar ao menu
	        retorne
	    }
	
	    inteiro i, contador = 0
	    inteiro indices[10]  // Armazena os índices dos filmes disponíveis
	
	    escreva("\nFilmes disponíveis para locação:\n")
	    para (i = 0; i < filmesCadastrados; i++)
	    {
	        se (disponivel[i] == "NAO")
	        {
	            escreva("\nOpção ", contador + 1, ":")
	            escreva("\nNome: ", nome[i])
	            escreva("\nAno: ", ano[i])
	            escreva("\nQuantidade de Aluguéis: ", qntAlug[i])
	            escreva("\nDisponível: SIM\n")
	            indices[contador] = i  // Salva o índice
	            contador++
	        }
	    }
	
	    se (contador == 0)
	    {
	        escreva("\nNenhum filme disponível para locação no momento.\n")
	        escreva("\nPressione ENTER para voltar ao menu...")
	        cadeia pausa
	        leia(pausa) // Variável auxiliar para pausar
	        limpa() // Limpa o console antes de retornar ao menu
	        retorne
	    }
	
	    escreva("\nEscolha o número do filme para alugar (1 a ", contador, "):\n")
	    leia(i)
	
	    se (i >= 1 e i <= contador)
	    {
	        inteiro indiceFilme = indices[i - 1]
	        disponivel[indiceFilme] = "SIM"
	        qntAlug[indiceFilme]++
	        escreva("\nVocê alugou o filme ", nome[indiceFilme], " com sucesso!\n")
	    }
	    senao
	    {
	        escreva("\nOpção inválida. Tente novamente.\n")
	    }
	
	    // Pausar antes de limpar o console
	    escreva("\nPressione ENTER para voltar ao menu...")
	    cadeia pausa
	    leia(pausa) // Variável auxiliar para pausar
	    limpa() // Limpa o console após pressionar ENTER, antes de retornar ao menu
}


  	// Função para devolver um filme locado
	funcao devolver(cadeia nome[], inteiro ano[], inteiro qntAlug[], cadeia disponivel[], inteiro filmesCadastrados)
	{
	    inteiro i, contador = 0
	    inteiro indices[10]  // Armazena os índices dos filmes locados
	
	    limpa()  // Limpa o console antes de exibir a mensagem
	
	    escreva("\nFilmes atualmente locados:\n")
	    para (i = 0; i < filmesCadastrados; i++)
	    {
	        se (disponivel[i] == "SIM")
	        {
	            escreva("\nOpção ", contador + 1, ":")  // Exibe a opção de devolução
	            escreva("\nNome: ", nome[i])
	            escreva("\nAno: ", ano[i])
	            escreva("\nQuantidade de Aluguéis: ", qntAlug[i])
	            escreva("\n")
	            indices[contador] = i  // Salva o índice real do filme
	            contador++
	        }
	    }
	
	    // Verifica se há filmes locados
	    se (contador == 0)
	    {
	        escreva("\nNenhum filme locado no momento.\n")
	        escreva("\nPressione ENTER para voltar ao menu...\n")
	        cadeia pausa
	        leia(pausa)  // Pausa antes de voltar ao menu
	        limpa()  // Limpa o console antes de retornar ao menu
	        retorne  // Retorna ao menu sem fazer mais nada
	    }
	
	    escreva("\nEscolha o número do filme para devolver (1 a ", contador, "):\n")
	    leia(i)
	
	    // Valida a opção escolhida
	    se (i >= 1 e i <= contador)
	    {
	        inteiro indiceFilme = indices[i - 1]  // Obtém o índice real do filme
	        disponivel[indiceFilme] = "NAO"  // Atualiza para disponível
	        escreva("\nDevolução do filme ", nome[indiceFilme], " realizada com sucesso!\n")
	    }
	    senao
	    {
	        escreva("\nOpção inválida. Tente novamente.\n")
	    }
	
	    // Pausa antes de voltar ao menu
	    escreva("\nPressione ENTER para voltar ao menu...\n")
	    cadeia pausa
	    leia(pausa)  // Pausa antes de voltar ao menu
	    limpa()  // Limpa o console antes de retornar ao menu
}




  	// Função para exibir o filme mais locado
	funcao filmeMaisLocado(cadeia nome[], inteiro ano[], inteiro qntAlug[], inteiro filmesCadastrados)
{
	    limpa()  // Limpa o console antes de exibir o filme mais locado
	
	    se (filmesCadastrados == 0)
	    {
	        escreva("\nNenhum filme cadastrado.\n")
	        escreva("\nPressione ENTER para voltar ao menu...")
	        cadeia pausa
	        leia(pausa) // Variável auxiliar para pausar
	        limpa() // Limpa o console antes de retornar ao menu
	        retorne
	    }
	
	    inteiro indiceMaisLocado = 0
	    para (inteiro i = 1; i < filmesCadastrados; i++)
	    {
	        se (qntAlug[i] > qntAlug[indiceMaisLocado])
	        {
	            indiceMaisLocado = i
	        }
	    }
	
	    // Verificando se há algum filme com aluguel
	    se (qntAlug[indiceMaisLocado] == 0)
	    {
	        escreva("\nNenhum filme foi alugado até o momento.\n")
	    }
	    senao
	    {
	        escreva("\nFilme mais locado:\n")
	        escreva("Nome: ", nome[indiceMaisLocado], "\n")
	        escreva("Ano de lançamento: ", ano[indiceMaisLocado], "\n")
	        escreva("Número de vezes alugado: ", qntAlug[indiceMaisLocado], "\n")
	    }
	
	    // Pausar antes de limpar o console
	    escreva("\nPressione ENTER para voltar ao menu...")
	    cadeia pausa
	    leia(pausa) // Variável auxiliar para pausar
	    limpa() // Limpa o console após pressionar ENTER, antes de retornar ao menu
}



  // Função principal do programa
  funcao inicio()
  {
    inteiro opcao = 1, filmesCadastrados = 0
    cadeia nome[10], disponivel[10]
    inteiro ano[10], qntAlug[10]

    faca
    {
        opcao = menuJogo()

        escolha (opcao)
        {
            caso 1:
                filmesCadastrados = cadastrarFilmes(nome, ano, qntAlug, disponivel, filmesCadastrados)
                pare

            caso 2:
                listarFilmes(nome, ano, qntAlug, disponivel, filmesCadastrados)
                pare

            caso 3:
                locados(nome, ano, qntAlug, disponivel, filmesCadastrados)
                pare

            caso 4:
                alugar(nome, ano, qntAlug, disponivel, filmesCadastrados)
                pare

            caso 5:
                devolver(nome, ano, qntAlug, disponivel, filmesCadastrados)
                pare

            caso 6:
                limpa()  // Limpa o console antes do cadastro
                filmeMaisLocado(nome, ano, qntAlug, filmesCadastrados)
                pare

            caso 7:
                limpa()  // Limpa o console antes do cadastro
                escreva("\nSaindo do programa...\n")
                pare
        }
    } enquanto (opcao != 7)
  }
}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4506; 
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */

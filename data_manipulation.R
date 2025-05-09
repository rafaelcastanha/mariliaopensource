#Carregando arquivo externo
dados<-read.table(file.choose(), sep="\t", dec="," ,header = T)

#Visualizando os dados
View(dados)

#dimensão dos dados - Linhas, colunas
dim(dados)

#visualizando os 10 primeiros resultados
head(dados)

#Organizando basico - nome colunas
colnames(dados)[5:7]<-c("Receita_milhoes", "Lucros_milhoes", "Total_ativos")

#Tipo de dados
class(dados$Setor)
class(dados$NºEmpregados)
class(dados$Receita_milhoes)
      
#Organizando basico - dados inconsistentes
dados[1,2]
dados[1,2]<-"América do Norte"

#Excluindo uma linha
dados[-2,] #Lembrede  guardar este novo conjunto em uma variável caso queira
dados1<-dados[-2,] #Exemplo

#Excluindo uma coluna
dados[,-1] #Lembre de guardar este novo conjunto em uma variável caso queira

#Extraindo/Excluindo linha e colunas - Ex.: Exclui linha 1 e colunas 2 a 4
dados[-1,-(2:4)]

dados[-1,2:4] #Ex.: Exclui linha 1 e acessa colunas 2 a 4

#Acessando valores
dados[2,3] #linha 2, coluna 3

dados[1, 2:4] #Acessa valores da linha 1 e colunas 2 a 4

#Acessando colunas
dados$Setor #utilizando cifrão

dados[,3:5] #utilizando indices de linha e colunas // Ex.: todas linhas e colunas 3 a 5

dados[1:4,2:4] #utilizando indices de linha e colunas // Ex.: linhas 1 a 4, colunas 2 a 4

#Filtrando dados qualitativos 
dados[dados$Setor == "Energy", ] #Ex.: Empresas do setor "Energy"

#Filtrando dados quantitativos

class(dados$NºEmpregados)

dados[dados$NºEmpregados>200000, ] #Ex.:Empresas com mais de 200k empregados

#Fazendo partições mais detalhadas

#Ex.: Empresas do setor Energy e com mais de 200k empregados

dados[dados$Setor == "Energy" & dados$NºEmpregados > 200000, ] 

#dadosViz

#Tabela de dados - Setor

table(dados$Setor)

tabela1<-table(dados$Setor)

#Tabela de dados - Setor x Continente

table(dados$Setor, dados$Continente)
tabela2<-table(dados$Setor, dados$Continente)

#Grafico 1 - Tabela1

barplot(tabela1, ylim = c(0,100))

#Grafico 2 - Tabela2 

barplot(tabela2, beside = TRUE,
        xlab = "Continente", ylab = "Frequência",
        legend.text = c("Energy", "Tech", "Health"),
        args.legend = c(cex=0.7))

#Dados quantitativos

#Verificando a classe dos dados

class(dados$NºEmpregados)
class(dados$Receita_milhoes)
class(dados$Lucros_milhoes)
class(dados$Total_ativos)

#Conversão para dados numéricos - as.numeric() (caso necessário)

dados$Receita_milhoes<-as.numeric(dados$Receita_milhoes)

#Sumarização estatística de uma variável quantitativa

summary(dados$NºEmpregados)

#Sumarização estatística de diversas variáveis quantitativa 

summary(dados[,4:7]) #resumo estatístico das colunas 4 a 7


#Graficos dados quantitivos

plot(dados$NºEmpregados, dados$Lucros_milhoes, xlab = "Empregados",
     ylab="lucros")

#Visualizando dados filtrados

summary(dados[dados$Setor == "Energy", 4:7]) #Ex.: Resumo estatístico das empresas Energy

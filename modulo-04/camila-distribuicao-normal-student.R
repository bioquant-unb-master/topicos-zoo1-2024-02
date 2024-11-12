
# POPULACOES E DISTRIBUICOES - NORMAL E T  


# ____________________________ DISTRIBUICAO NORMAL _______________________________ #


# A distribuicao normal é uma das mais importantes distribuicoes estatisticas, conhecida tambem 
# como Distribuicao de Gauss ou Gaussiana. Ela é inteiramente descrita por seus parametros 
# (media e desvio padrao), ou seja,conhecendo-se esses valores consegue-se determinar 
# qualquer probabilidade em uma distribuicao normal.

help(dnorm) 
?dnorm # mesma notacao para busca da funcao dnorm

# dnorm - calcula a densidade de probabilidade f(x) no ponto
# pnorm - calcula a funcao de probabilidade acumulada F(x) no ponto
# qnorm - calcula o quantil correspondente a uma dada probabilidade
# rnorm - retira uma amostra aleatoria da distribuicao


# Considere uma variavel aleatoria z com distribuicao normal padrao, com media igual a zero 
# e desvio padrao igual a 1:

plot(function(z)dnorm(z), -3.5,3.5) # grafico de distribuicao de probabilidades
plot(function(z)dnorm(z), -3.5,3.5, ylab = "f(z)", xlab = "z", lwd = 2, col = "red") 

plot(function(z)pnorm(z), -3.5,3.5) # grafico de funcao de distribuicao acumulada (FDA)
plot(function(z)pnorm(z), -3.5,3.5, ylab = "F(z)", xlab = "z", lwd = 2, col = "red")  


### Exemplos


# Ex1. Considerando-se que a estatura de brasileiros apresenta distribuicao normal, sendo
# a media de estatura igual a 1.70 metros e desvio padrao igual a 0.9 metro, qual a probabilidade
# de um homem apresentar estatura maior que 1.80 metros?

pnorm(1.8,1.7,0.9, lower.tail = FALSE)


# Ex2. Qual é a probabilidade de que um peixe capturado aleatoriamente em um lago 
# tenha entre 19.2 cm e 21.7 cm de comprimento,sabendo que a média da população é 17,1 cm e 
# o desvio padrão é de 1,21 cm? 

prob1 <- pnorm(19.2, mean = 17.1, sd = 1.21, lower.tail = FALSE)
prob2 <- pnorm(21.7, mean = 17.1, sd = 1.21, lower.tail = FALSE)

x <- prob1 - prob2; x  

# Ex3. Suponha que o tempo necessário para um leão consumir sua presa siga uma distribuição 
# normal de média de 8 minutos e desvio padrão de 2 minutos. 
# (a) Qual é a probabilidade de que um leão consuma sua presa em menos de 5 minutos? 

pnorm(5,8,2, lower.tail = FALSE)

# (b) E mais do que 9,5 minutos?

pnorm(9.5,8,2, lower.tail = FALSE)

# (c) E entre 7 e 10 minutos? 

prob7 <- pnorm(7,8,2, lower.tail = FALSE)
prob10 <- pnorm(10,8,2, lower.tail = FALSE)

pintervalo <- prob7 - prob10


### Teste de normalidade Shapiro-Wilk
  
# Permite verificar se um conjunto de dados pertencentes a uma determinada amostra apresenta 
# distribuicao normal, ou seja, avalia a normalidade dos dados, podendo ser utilizado para amostras
# de qualquer tamanho.

# A hipótese nula do teste de Shapiro-Wilk é que a população possui distribuição normal. 
# Portanto, um valor de p < 0.05 indica que você deve rejeitar a hipótese nula, ou seja, seus dados 
# não possuem distribuição normal.


help(shapiro.test)

# Ex4. Um pesquisador desejava estudar os padroes de distribuicao geografica de uma populacao de 
# uma uma determinada especie de libelula de uma regiao alagavel no Pantanal. Dessa forma, ele contou 
# quantas libelulas foram observadas em sua area de estudo e obteve os resultados abaixo.
# Tomando-se como base a amostra abaixo, o que o pesquisador pode concluir sobre a distribuicao 
# de seus dados?

a <- c(1,0,2,2,3,4,8,3,2,1,0,0,0,5,1,1,2,7,0,11)
hist(a, col = "blue3")

shapiro.test(a) 

# Ex5. Morcegos como os da especie Glossophaga soricina podem visitar uma quantidade 
# variada de flores em uma unica noite. A fim de se investigar o potencial de polinizacao dessa especie,
# os alunos do Laboratorio de Biologia e Conservacao dos Morcegos da UnB coletaram inicialmente 
# dados sobre o numero de visitas florais realizadas por diferentes individuos em um intervalo de 
# tempo definido. A partir dessa coleta inicial, o que os alunos podem inferir sobre a distribuicao das
# frequencias de visitas florais dessa especie?

visitas <- c(23,25,30,23,28,15,9,34,18,32,21,27,10,17,35,22,3,23,41,33)
hist(visitas)

shapiro.test(visitas)


# _____________________ TESTE DE HIPOTESES (DISTRIBUICAO T-STUDENT) ______________________ #


# A Distribuicao t de Student, ou t,  também é uma das distribuiçoes de probabilidade mais
# conhecidas. Semelhante à curva normal padrão, também simétrica, porém com formato campaniforme
# (forma de campana) e caudas mais alongadas. Ela pode ser ainda utilizada como teste de hipoteses, 
# avaliando-se a existencia de diferença significativa entre as médias de duas amostras.

# Para realizar o teste t, as duas amostras precisam ter distribuicao normal, ter a mesma variancia
# (verificando os desvios padroes das amostras, por exemplo) e serem independentes uma da outra.

?t.test # realiza test-t para uma ou duas amostras

amostra1 <- c(16.6,13.4,14.6,15.1, 12.9,15.2,14.0,16.6,15.4,13.0)
amostra2 <- c(15.8,17.9,18.2,20.2,18.1,17.8,18.3,18.6,17.0,18.4)

# Test-t para uma unica amostra - utilizado quando se quer testar uma media populacional

t.test(amostra1, mu = 12.7) # mu = valor da media po da populacao hipotetica a que se quer comparar

# Test-t nao-pareado para duas amostras - utilizado quando se quer comparar as medias populacionais 
# de duas amostras independentes

var(amostra1)
var(amostra2)
var.test(amostra1,amostra2) # testando a homogeneidade das variancias das duas amostras (premissa)

t.test(amostra1,amostra2, alternative = "two.sided") # as medias pop possuem valores diferentes
t.test(amostra1,amostra2, alternative = "less") # a media pop da amostra 1 é menor do que a media pop da amostra 2
t.test(amostra1,amostra2, alternative = "greater")  # a media pop da amostra 1 é maior do que a media pop da amostra 2

# Test-t pareado - utilizado quando as duas amostras sao dependentes uma da outra

t.test(amostra1,amostra2, paired = T) 

### Exemplo

# Um aluno de mestrado deseja verificar se sua populacao de 
# lagartos pertence a uma populacao cuja media do tamanho cabeca - corpo é 2.6. 
# Utilizando-se o teste apropriado, podemos concluir que a amostra estudada pertence à populacao
# em comparacao? O que podemos concluir sobre a hipotese testada?

# dados: 1.6,3.4,2.3,4.1,4.2,6.6,1.7,4.3 

tamanho <- c(1.6,3.4,2.3,4.1,4.2,6.6,1.7,4.3)
mean(tamanho) # calculando os parametros
sd(tamanho)

shapiro.test(tamanho) # relembrando, no shapiro.test, um valor de p < 0.05 indica que você deve rejeitar 
                      # a hipótese nula, ou seja, seus dados não possuem distribuição normal! nesse caso, 
                      # p > 0.05,o que indica que nossa amostra possui distribuicao normal

t.test(tamanho, mu = 2.6)









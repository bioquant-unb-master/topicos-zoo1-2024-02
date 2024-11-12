#####AULA PRÁTICA DISTRIBUIÇÕES
##Importando os dados:
# Aula 2
# Distribuicao e comparacao de amostras

# 1. Distribuicoes

# Compreender as populacoes e comunidades é complexo, por isso, estudamos 
# amostras de cada uma delas. 
# Eventos biologicos apresentam certo grau de incerteza. 
# Probabilidade esta associada a quantificacao da incerteza!
# A média dos resultados obtidos nos fornece a probabilidade.
# Porem, os eventos sao aleatorios e nao podemos medir com precissao. 

# Tipos de variáveis aleatorias: 
# Variaveis discretas: valores finitos (1,2,3)
# Variaveis continuas: qualquer valor num intervalo (1.3,1.4,1.5)

# Com o acumulo de dados, podemos observar diversos padroes 
# na distribuicao das frequencias!

# Distribucao define uma curva (grafico) e sua area sob a 
# curva que determina a probabilidade de ocorrer o evento 
# associado a mesma. (CPAQV, 2012)
# Importante: A area sob a curva e sempre 1!


# 1.2 Distribuicao uniforme ----

# Varância menor que a media 
# Todos os valores dentro de um intervalo podem ocorrem com a mesma probabilidade
# Ex. Territorialismo. 
# runif(n=numero de obs, min = 0, max = 1), na qual min e max é o intervalo

# Simulacao de 300 moscas femeas com o intervalo de 50 a 200 ovos por dia
unif <- runif(300, min=50, max=200)
summary(unif)
plot(unif)
densidade2 <- dunif(unif)
hist(unif)

# 1.3 Distrinuicao binomial ----

# Agregada
# variância maior que a média
# Variaveis aleatorias de Bernoulli: Aceita o sucesso ou fracasso (1 ou 0)
# Sistema de probabilidade discreta. 
# Grafico com o numero de sucessos da tentativa de Bernoulli.
# Ex. Presenca ou ausencia de especies num corrego. 
# rbinom(n=numero de obs, size=numero de tentativas, prob=probabilidade de 
# sucesso em cada tentativa)

# Simulacao de sucesso de cultivo de cepas de E. coli no laboratorio. 
# Vamos retirar 10 individuos de E. coli por tentativa.
coli <- rbinom(100, size = 200, prob = 0.7)
summary(coli)
plot(coli)
hist(coli)

# 1.4 Distribuição Poisson ---

# Também chamada de distribuição aleatória
# A ocorrência de um indivíduo não interfere na ocorrência de outro
pois=rpois(100,5)
summary(pois)
hist(pois)





## 1.5 Achando nossas distribuições
# Um pesquisador observou a quantidade de larvas de besouro presente em 
#folhas de uma planta nativa do cerrado, a fim de descobrir a distribuição 
#desses indivíduos para prosseguir sua pesquisa


#Vamos estar se nossos dados são de uma distribuição aleatória testando se é uma
#distribuição poisson
data("HorseKicks")

#Para verificar se nossos dados se adequam a uma distribuição de poisson, primeiro vamos
#baixar o pacote vcd.
library(vcd)
?goodfit
#Agora, usamos a função goodfit
HK.fit <- goodfit(HorseKicks)


#Com isso, criamos a nossa distribuição esperada de poisson,e vemos se nossos dados de
#fato se adequam a ela, ou seja, se pertencem a uma distribuição 
#aleatória (H0 e H1). Para isso, usaremos um teste estatístico chamado chi-quadrado

#Para sabermos o resultado, usamos a função summary
summary(HK.fit)

# Agora vamos dar uma olhada no gráfico
plot(HK.fit)



#Observamos o p-valor para concluir sobre a significancia do teste






data("Federalist")
F.fit2 <- goodfit(Federalist, type = "binomial")
summary(F.fit)
summary(F.fit2)
plot(F.fit)
plot(F.fit2)

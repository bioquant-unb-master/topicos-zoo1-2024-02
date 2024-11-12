### Teste de hipoteses

## Pode ser parametrico ou nao parametrico

# Caso seja parametrico, alem de possuir uma distrib normal
# tambem devem possuir variancias homogeneas, caso contrario,
# devemos corrigir isso

# Vamos continuar usando o cats, dessa vez o peso do corao
macho=
femea=

library(MASS)


#Teste de Shapiro-Wilk
#Antes de mais nada, temos que saber se nossos dados seguem uma distribui??o normal. Para isso
#vamos aplicar aos nossos dados o teste de shappiro wilk, que nos diz se os dados seguem ou n?o 
#uma distribui??o normal, e de acordo como professor, ? o teste preferido da waira hehe
#Mas Pedro, pra qu? saber se os dados s?o normais?
#Simples jovem, para saber qual teste de hip?teses podemos aplicar, em conjunto com outros pr? 
#requisitos de cada teste, mas a normalidade ? o primeiro passo e um dos mais importantes.

# H0: sao normais
# H1: nao sao normais


# Teste de homocedasticidade
# Devemos verificar se as varia?ncias s?o homog?neas

# H0:
# H1:



## O tipo de teste que devemos usar para compara??o de amostras depende de:
# Param?trico ou n?o;
# As amostras s?o dependentes ou n?o;
# N?mero de classes na vari?vel dependente (ou de amostras)
# Como nosso conjunto de dados ? param?trico, independete e possui apenas
# 2 classes, vamos usar o teste t



# Primeiro caso:Teste para m?dia populacional
# Suponhamos que voce quer verificar se seus dados pertencem a uma populacao com media ja conhecida
# No caso, media 3.2
# H0:
# H1:



## Segundo caso: Suponhamos que um pesquisador quero comparar se o peso do cora??o
# de machos e femeas pertencem ? mesma distribui??o
# H0:
# H1:


#Amostras pareadas
#Agora temos uma mesma popula??o submetida a diferentes condi??es em distintos momentos, t?pico
#uso de antes e depois para uma mesma popula??o amostral
# antes: 16.6,13.4,14.6,15.1,12.9,15.2,14.0,16.6,15.4,13.0
# depois: 15.8,17.9,18.2,20.2,18.1,17.8,18.3,18.6,17.0,18.4
antes=c(16.6,13.4,14.6,15.1,12.9,15.2,14.0,16.6,15.4,13.0)
depois=c(15.8,17.9,18.2,20.2,18.1,17.8,18.3,18.6,17.0,18.4)





# Vamos supor que uma aluna de pibic da UnB do professor Roberto quer testar sobre a capacidade
# de flota??o na coluna d'?gua entre duas esp?cies de rot?feros: P. major (pm) e K. cochlearis (kc)
rotifer
?rotifer


shapiro.test()
shapiro.test()
var.test()

# Mas Pedro,  n?o seguE uma distribui??o normal, e agora???
# A resposta ?: Mann-Whitney!!

wilcox.test(rotifer$pm.y,rotifer$kc.y)

# Existe outro modo de fazer o teste de homocedasticidade, os dados
levene.test(exemplo_2_1$dados,exemplo_2_1$pop)
##### Comparar  Amostras

##Primeiro usaremos o pacote de dados "iris"




iris
View(iris)


# Comprimento e largura das petalas das esp setosa e versicolor

# lembrando de entender o valor de "p"


setcomp= iris[1:50,1]
setlarg= iris[1:50,2]

verscomp= iris[51:100,1]
verslarg= iris[51:100,2]


# Shapiro-Wilk - Teste de Normalidade


shapiro.test(setcomp)
shapiro.test(setlarg)
shapiro.test(verscomp)
shapiro.test(verslarg)

hist(setcomp)
# voces devem fazer histograma para as demais variaveis usando o comando hist

# Criar Dataframe


tabela = data.frame (setcomp,setlarg,verscomp,verslarg)




# Teste T
 

t.test(tabela$setcomp , tabela$setlarg)

t.test(verscomp, verslarg)


mean(verscomp)
mean(verslarg)

medias= c(mean(setcomp),mean(setlarg))

barplot(medias)


summary(tabela)




# Shapiro-Wilk para a largura de sepalas das especias setosa e versicolor


setsepala = iris[1:50,4]

verssepala = iris[51:100,4]


shapiro.test(setsepala)
shapiro.test(verssepala)

hist(setsepala)
hist(verssepala)

# Teste para uma populacao nao-parametrica: Wilcox (Mann-Whitney)

wilcox.test(verssepala, setsepala)


 
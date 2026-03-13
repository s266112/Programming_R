# Tipi di dati e strutture -----
## tipi di dati: character, numeric, integer, logical, complex
## strutture: vector, factor, matrix, array, list, data frame

b <-1:10
?str    # Manda alla sezione help (spiegazione, in questo caso di str)
str(b)  # Indica il tipo di struttura della variabile

## Scalari ----
### numeric ---- --> Sono i numeri reali, ovvero CON parte decimale (come in C)
a <- 10
b <- 3 / 10
c <- (a + b) / b
c
str(b)

### character ---- --> Sono i char (come in C)
d <- "1"
e <- "2"
str(d)
#d+e --> Non si può fare perchè sono 2 char e non si possono sommare

s <- "hello"
str(s)

### integer ---- --> Sono i numeri interi, SENZA parte decimale
var <- 2
var.int <- 2L # L dopo il numero indica che è un integer

str(var)
str(var.int)

### logical ---- --> Sono i Booleani (come in C)

x <- TRUE
y <- FALSE

x+y
2*x
str(x)

#### verificare o convertire il tipo di oggetto ----

# is.numeric/character/integer/logical... --> Verifica se la variabile è di quel tipo la
is.integer(var)
is.integer(var.int)
is.numeric(s)

# as.numeric/character/integer/logical... --> Stampa il valore della variabile secondo il tipo indicato
as.numeric(s) #s character
as.integer(b) #b numeric
as.numeric(TRUE) #valori logici
as.character(a)

## Vettori ---- --> Sono array (come in C)
# un vettore ammette solo elementi dello stesso tipo
# c(); vector()
vett_num <- c(10, 15, 6.4, 3, 18) # definiamo il vettore x
vett_num                          # stampiamo x
str(vett_num)                     # verifichiamo la struttura di x 

vett_int <- c(1L, 6L, 10L)
vett_int 
str(vett_int )

vett_log  <- c(TRUE, FALSE, T, F)
vett_log
str(vett_log)

vett_char <- c("A", "B", "C")
vett_char
str(vett_char)

is.logical(vett_char)
is.numeric(vett_char)

### Creare una sequenza ----
v <- 1:10               # Crea una sequenza modo (1)
v

a <- seq(from=1, to=10) # Crea una sequenza modo (2)
b <- seq(from=0, to=10, by=2) # Crea una sequenza saltando di 2 in 2
c <- seq(from=8, to=80, length=10) # Crea una sequenza con 10 elementi equidistanti tra loro (per fare le tabelline parto da n*1)

rep(1,15) #un vettore di lunghezza 15 con tutti gli elementi uguali a 1

a <- c(rep(2,3),4,5,rep(1,5),11:15) #(2=Numero da ripete; 3= Quante volte lo ripeto)
a

rep(c("a","b"), 5)  # Ripeti la sequenza a,b 5 volte
rep(c("a","b"), each = 5) #Ripeti 5 volte a poi 5 volte b
rep(c(a,"b"), 2)          #il vettore è convertito in character
rep(c(a,"b"), each=2) 

paste("file", 1:5, ".txt" , sep="") # Incolla file da 1 a 5
paste("file", 1, ".txt" , sep="") # Incolla solo file 1

## Selezione di elementi ed operazioni
#selezione di elementi (la prima posizione ha indice 1)
y <- a[6]   # Elemento 6 di a   
y
z <- a[2:4] # Vettore che prende gli elementi che vanno da 2 a 4     
z
w <- a[c (2,5)] # Estrarre l'elemento 2 e 5
w

x <- c(1, 2, 4, 8, 16, 32) # c(scivi direttamente gli elementi che vuoi tu)
x
x[-4] #!! non è assegnato ad un oggetto --> x [-4]: Elimina il numero in posizione 4
x

# operazioni tra scalare e vettore
x <- 1:10
x*2   
x > 5 

## operazioni tra 2 vettori di lunghezza diversa
x <- rep(10,8)
y <- c(1,2)
x <- x[-1]
y
x*y   
x+y

#operatori logici: OR |, AND &
x <- 1:8

# selezioniamo gli elementi maggiori o uguali a 7 o minori di 5
x
x >= 7
x < 5
x >= 7 | x < 5
x[c(x >= 7 | x < 5)]

x <- 0:7
all(x>0)  # Restitusce TRUE se tutti gli elementi rispettano la condizione 
any(x<0)  # Restiyuisce TRUE se almeno un elemento rispetta la condizione  

# altre funzioni
x <- c(FALSE, FALSE, TRUE)

sum(x)    # Somma
mean(x)   # Media
length(x) # Lunghezza

as.numeric(x)

x <- 1:4

sort(x)   # Ordina gli elementi in ordine crescente o decrescente
order(x)  # Restituisce gli indici che ordinano un vettore o una matrice in base ai valori: Es: x = (3, 1, 2)  OUt = (2, 3, 1)
max(x)    # Restiisce il valore massimo
min(x)    # Restiisce il valore minimo
range(x)  # Restisce il range (max e min)
sum(x)    # Somma
prod(x)   # Prodotto
mean(x)   # Media

# nomi
x <- c(a = 1, b = 2, c = 3)
x
x <- 1:3
names(x)
names(x) <- c("a1","b1","c1")
x

######## Esercizio #########
#1.a Definisci il vettore y con gli elementi 8, 3, 5, 7, 6, 6, 8, 9, 2.

y <- c (8, 3, 5, 7, 6, 6, 8, 9, 2)
y

#1.b Gli elementi di y sono minori di 5? 
all (y < 5)
y

#1.c Crea un nuovo vettore z con gli elementi di y minori di 5.
z <- y[y < 5]
z

#2.Fornisci un esempio in cui valori logici sono convertiti in numerici 0-1 utilizzando un operatore aritmetico
T + T - F


#3. Crea un vettore logico di lunghezza 3. Quindi, moltiplica questo vettore tramite runif(3). Cosa succede?
b <- c (1, 2, 3)
ris <- b*runif(3)
ris
# Stampa 3 numeri casuali compresi tra 0 e 1

#4. Cosa fa questo codice?
set.seed (123)  # Genera numeri casuali
x <- sample(10) < 4 # Genera una permutazione di numeri da 1 a 10 (ordine casuale per set.seed) e confronta con il 4 per generare TRUE o FALSE
x
which(x)        # Restituisce elementi TRUE di x
which(sample(10) < 4) # Genera una permutazione di numeri da 1 a 10 retituendo indice di posizione degli elementi <4.


#5. Definisci un vettore con valori 9, 2, 3, 9, 4, 10, 4, 11. Scrivi il
# codice per calcolare la somma dei tre valori più grandi (Suggerimento: usa la funzione rev).
x <- c(9, 2, 3, 9, 4, 10, 4, 11)
sum(sort(x, decreasing = TRUE)[1:3])

# Usando: Head, tail
head (x, 3)
tail (x)
sum(tail(sort(x), 3))

#6. Crea un vettore x di lunghezza 4. Cosa restituisce il codice?
x <- 1:4
x[c(TRUE, TRUE, NA, FALSE)]


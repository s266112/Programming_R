# --- STRUTTURE DI CONTROLLO ---

# STRUTTURE DI CONTROLLO: Permettono di modificare il flusso del programma, decidendo
#                         cosa fare e quando farlo in base a condizioni o ripetizioni.

## 1. IF/ELSE ##

# IF/ELSE: Se la condizione è vera il codice viene eseguito.
# La sintassi è:

if (condizione) {
#   Codice da eseguire con condizione 1 
} else {
#   Codice da eseguire con condizione 2
}

# Esempio 1:

x <- 2
if (x < 3) {
  print("x è minore di 3")
} else {
  print ("x NON è minore di 3")
}

# Esempio 2:

x <- 4
if (x < 3){
  print("x è minore di 3")
} else {
  print (" x NON è minore di 3")
}

# 1.a IF SENZA ELSE: Se non specifico else, e la condizione è falsa, R non esegue nulla.
# La sintassi è:

if (condizione) {
#   Codice da eseguire con condizione 1
}

# Esempio 1:

x <- 2
if (x < 3){
  print ("x è minore di 3")
}       # Nessun output perchè la condizione è falsa

# Esempio 2:

x <- 4
if (x < 3){
  print ("x è minore di 3")
}       # Nessun output perchè la condizione è falsa

# 1.b: Assegnazione del risultato con if/else: Possiamo assegnare il risultato ad una variabile
# Dato che if/else restituisce in output l'ultima istruzone eseguita, questa può essere salvata in un oggetto

# Esempio 1:
x <- 4
a <- if (x<3){
  print ("x è minore di 3")
} else {
  print ("x NON è minore di 3")
}
a

# Scritto in monoriga:
x <- 4
a <- if (x<3) "x è minore di 3" else "x NON è minore di 3"
a

# Esempio 2:
x <- 4
b <- if (x<3){
  print ("x è minore di 3")
}         # Dato che la condizione è falsa ritorna NULL
b

# Scritto in monoriga:
x <- 4
b <- if (x<3) "x è minore di 3" 
b

# Esercizio: Prova a riscrivere questo codice
if (x<3) a <- "x è minore di 3" else a <- "x NON è minore di 3"
a <- if (x<3) "x è minore di 3" else "x NON è minore di 3"

# 1.c: Blocchi multipli annidati IF/ELSE IF/ ELSE.
#La sintassi è:

if (condizione 1){
# Codice se condizione1 è vera
} else if (condizione2){
# Codice se condizione2 è vera (e condizione1 è falsa)
} else if (condizione3){
# Codice se condizione3 è vera (e le precedenti false)
} else {
# Codice da eseguire se tutte le condizioni sono false
} 

# Esempio 1:
x <- 6
if (x < 3){
  print( "x è minore di 3")
} else if (x==3){
  print("x è uguale a 3")
} else {
  print ("x e maggiore di 3")
}

# 1.d: IFELSE(): Funziona su vettori interi, valutando elemento per elemento.
# La sintassi è:

ifelse (condizone, valore_se_vero, valore_se_falso)

# Esempio 1:
b <- ifelse (x<3, "x è minore di 3", "x NON è minore di 3")
b

# Esempio 2: 
x <- c(2, 4, 1, 5)
ris <- ifelse (x < 3, "Piccolo", "Grande")
ris

## 2. WHILE e REPEAT ##

# 2a: WHILE: Il codice si ripete finchè la condizione è vera. 
#            Se la condizione è falsa da subito, il blocco non viene mai eseguito.
# La sintassi è:

while (condizione){
  # Codice da eseguire
}

# Esempio 1:
i=0
while (i < 6) {
  i <- i+1
  print (i)
}

# Esempio 2:
j <- 6
while (i < 7) {
  i <- i + 1
  print(j)    # La condizione è falsa, quindi non viene eseguita 
}

# 2b: REPEAT: Esegue le istruzioni all'infinito finchè non incontra break.
#             Repeat non ha una condizione di stop, quindi break deve essere
#             inserita manualmente per interrompere il ciclo.
# La sintassi è:

repeat {
  # Codice
  if (condizione) break
}

# Esempio 1:

i <- 0
repeat{
  i <- i+1
  print(i)
  if (i > 5) break
}

# Esempio 2: Sommare i numeri interi consecutivi partendo da 1, e fermarci appena la somma supera 20

somma <- 0
i <-1

repeat{
  somma <- somma + i
  print(paste("i =", i, "somma =", somma))
  if (somma > 20) break
  i <- i +1
}

## 3. CICLI FOR ##

# CICLI FOR: Permettono di ripetere un blocco di codice per ogni elemento di un 
#            vettore, lista, matrice o altro oggetto iterabile.
#            Il vettore può essere di qualunque tipo (char, numerico, ecc..)
# La sintassi è:

for (Variabile in sequenza){
  # Codice da eseguire
}

# Esempio 1: Vettore numerico
for (i in 1:5){
  print (i)
}

# Esempio 2: Vettore di stringhe
xval <- c("a", "b", "c", "d", "e")
for (i in xval){
  print (i)
}

# Scritto in monolinea:
xval <- c("a","b","c","d","e")
for (i in xval) print(i)

# Esempio 3: Vettore di caratteri
frutti <- c("mela", "banana", "kiwi")
for (f in frutti){
  print (paste("Frutto:", f))
}

# Scritto in monolinea
frutti <- c("mela", "banana", "kiwi")
for (f in frutti) print(paste("Frutto:", f))


# 3.a: Usare la funzione get() per ciclare funzioni.

# GET(): Con get() possiamo costruire un ciclo for anche su diversi oggetti.
#        get() prende una stringa e la trasforma nell'oggetto R con quel nome (o un errore).
# La sintassi è:

get ("nome_oggetto")

# Esempio 1:

square <- function(x) x^2
cube <- function(x) x^3
doublesquare <- function(x) x^4

for (name in c("square", "cube", "doublesquare", "mean")) {
  f <- get (name)
  print (f(2))
}

## !! Cosa fa il codice? !!:

# 1. Scorre su una lista di nomi, che sono stringhe.
# 2. Con get(name) ottiene la funzione corrispondente (es: cube)
# 3. La applica al numero 2

# Esempio 2: Con ERRORE

square <- function(x) x^2

for (name in c("square", "triangle")) {
  f <- get(name)
  print(f(2))
}

# 3.b: Cicli for annidati (nested)

# FOR ANNIDATI/NESTED: Quando ho più dimensioni da esplorare, posso usare for uno dentro l'alto
# La sintassi è:

for (variabile1 in sequenza1){
  for (variabile2 in sequenza2){
    # Corpo del ciclo interno
  }
}

# Esempio 1:
xval <- c("a", "b", "c", "d", "e")
for (i in 1:5){
  for (j in xval){
    print(paste(i,j))
  }
}

# Scitto in monolinea:
xval <- c("a","b","c","d","e")
for (i in 1:5)
  for (j in xval) print(paste(i,j))


# Esempio 2: Stampa tutte le coppie di numeri da 1 a 3

for (i in 1:3) {
  for (j in 1:3) {
    print(paste("i =", i, ", j =", j))
  }
}

## 4. MODIFICATORI: BREAK e NEXT ##

# 4.a BREAK: Interrompe un ciclo completamente. Puo essere usato anche con while e for
# La sintassi è:

while o for (condizione) {
  # codice
  if (condizione_di_stop) break
}

# Esempio 1: Con WHILE

i <- 0
while (TRUE){
  i <- i +1
  print (i)
  if (i > 5) break
}

# Esempio 2: Con FOR

for (i in 1:10){
  print (i)
  if (i > 5) break
}

# 4.b NEXT: Salta L'iterazione corrente e passa alla sucessiva.
#           Lo stesso output può essere ottenuto con le tre istruzioni cicliche.
# La sintassi è:

for (variabile in sequenza) {
  if (condizione_di_salto) next
  # Codice eseguito solo se la condizione è falsa
}

# Esempio 1:
i <- 0
repeat {
  i <- i + 1
  if (i == 3) next   # Salta la stampa di 3
  print(i)
  if (i > 5) break
}

# Esempio 2: Stampare solo i numeri dispari da 1 a 10
for (i in 1:10) {
  if (i %% 2 == 0) next  # se il numero è pari, salta l'iterazione
  print(i)               # stampa solo i dispari
}

## 5. FAMIGLIA DELLE APPLY ##

# Si usano come alternativa ai cicli for.
# Le più usate sono: apply, lapply, sapply, tapply, mapply.

# 5.a APPLY: E' utilizzato come un ciclo su uno o più indici di un array o matrici.
# !! apply lavora con gli array, se gli passo un dataframe lui lo converte in una matrice !!

# La sintassi è:

apply(X, MARGIN, FUN, ...)

# X: Matrice o array
# MARGIN: 1 per righe, 2 per colonne
# FUN: La funzione da applicare (es mean, sum, ecc..)

### ESEMPI SEMPLICI ####

# Esempio 1:  Media (MEAN) delle colonne (2)  
z  <- matrix(1:50, nrow = 10, ncol = 5)
v1 <- apply(z, 2, mean); v1     # Vettore medie per colonna

# Esempio 2: Deviazione standard (SD) delle righe (1)  
x  <- matrix(1:50, nrow = 10, ncol = 5)
v2 <- apply(x, 1, sd); v2     # Deviazione standard delle righe

### ESEMPIO CON NA ###

# Esempio 3: Con NA

Z <- matrix(1:50, nrow=10, ncol=5) # Creiamo la matrice
z [1,1] <- NA                      # Inseriamo un NA nella 1 riga, 1 colonna
v1 <- apply(z, 2, mean)            # Adesso se uso apply() per ottenere la media delle colonne
v1                                 # Ottengo un risUltato in cui la prima colonna è NA, 
                                   # perche contiene un valore mancante e mean() di default non ignora i NA.
v1 <- apply(z, 2, mean, na.rm= TRUE)  # Allora devo usare na.rm = TRUE dentro la funzione mean:
v1                                    # Cosi ottengo la funzione giusta

### ESEMPI PERSONALIZZATI NON STANDARD ###

# Esempio 4: Applica la funzione x^2 a ogni colonna
z <- matrix(1:50, nrow=10, ncol=5)
apply(z, 2, function(x) x^2)

# Esempio 5: Normalizza i valori sottraendo il minimo dalla colonna.
z <- matrix(1:50, nrow=10, ncol=5)
apply(z, 2, function(x) x - min(x))

# Esempio 6: Standardizza ogni colonna: media 0, deviazione standard 1.
z <- matrix(1:50, nrow=10, ncol=5)
apply(z, 2, function(x) (x - mean(x)) / sd(x))

# Esempio 7: Fa lo stesso del precedente, ma con una funzione già pronta (scale())
z <- matrix(1:50, nrow=10, ncol=5)
apply(z, 2, scale)

# 5.a.1 : Confronto con il for
v1 <- apply(z, 2, mean, na.rm= TRUE)
v1
# Equivalente nel for:
v2 <- c()
for (i in 1:ncol(z)) v2[i] <- mean(z[,i], na.rm = TRUE)
v2
# Infatti:
v1
v2

# 5.a.1: Tempi di esecuzione
system.time({
  for (i in 1:ncol(z)) v2[i] <- mean(z[,i])
})

system.time({
  v1 <- apply(z, 2, mean)
})

# 5.b: LAPPLY: Applica una funzione a ogni elemento di una lista 
#              e restituisce sempre una lista della stessa lunghezza della lista originale
# La sintassi è:

lapply(X, FUN, ...)

# X: E' una lista
# FUN: La funzione da applicare ad ogni elemento della lista

# Esempio 1: 
x <- as.list(1:5)       # Lista con i numeri da 1 a 5
v1 <- lapply (x, log)   # Calcola il log di ogni elemento della lista x
v1
# Equivalente nel for
v2 <- list()
for (i in seq_along(x)) {
  v2[[i]] <- log(x[[i]])
}
#Infatti:
v1
v2

# Esempio 2: Raddoppiare i numeri in una lista
numeri <- as.list(1:5)  # Lista di numeri da 1 a 5
numeri
raddoppiati <- lapply(numeri, function(x) x * 2)
raddoppiati


# 5.c: SAPPLY: E' analoga ad lapply, ma, quando possibile 
#              restituisce in output un vettore/matrice/array
# La sintrassi è:

sapply(X, FUN, ...)

# X: E' una lista
# FUN: La funzione da applicare ad ogni elemento della lista

# Esempio 1: Calcolo del logaritmo di ogni numero
x <- as.list(1:5)
sapply(x, log);

# Esempio 2: Calcolo del quadrato
x <- 1:5
sapply(x, function(n) n^2)

# Esempio 3: Applicato ad una lista
x <- as.list(1:5)
sapply(3:9, seq)

# 5.d: MAPPLY: Applica una funzione a più insiemi di argomenti, iterando in parallelo su di essi
# La sintassi è:

mapply(FUN, ..., MoreArgs = NULL, SIMPLIFY = TRUE, USE.NAMES = TRUE)

# FUN: E' la funzione da applicare
# ...: Sono i vettori (o liste) da combinare
# SIMPLY = TRUE: Prova a semplificare l'output (come sapply)

# Esempio 1: Ripetianmo i numeri diverse volte
ripeti <- mapply(rep, 1:4, 4:1)
ripeti

# Esempio 2: Sommare elementi corrispondenti
somma_numeri <- mapply(sum, 1:3, 4:6)
somma_numeri

# 5.e: TAPPLY: Applica una funzione a sottogruppi di un vettore, 
#              definiti da un fattore (o da più fattori).
# La sintassi è:

tapply(X, INDEX, FUN, ..., simplify = TRUE)

# X: Vettore su cui applicare la funzione
# INDEX: Fattore (o fattori) che definisce i gruppi
# FUN: La funzione da applicare
# simplify: Se TRUE, semplifica l’output quando possibile

# Esempio 1: Supponiamo di avere dei voti di studenti divisi per corso. 
#            Calcoliamo la media per corso

voti <- c(25, 28, 30, 22, 18, 24)
corsi <- factor(c("A", "A", "A", "B", "B", "B"))
tapply(voti, corsi, mean)

# Esempio 2: Stesso esempio di prima, con aggiunto il fattore sesso.
#            Calcoliamo la media per corso e sesso.
voti <- c(25, 28, 30, 22, 18, 24)
corsi <- factor(c("A", "A", "A", "B", "B", "B"))
sesso <- factor(c("F", "M", "M", "F", "M", "F"))
tapply(voti, list(corsi, sesso), mean)

## --- ESERCIZI ---

# Esercizo 1. Scrivere una funzione che prenda in input un dataset e restituisca un data frame 
#             con colonne il minimo,  il massimo, la media e i tre quartili di ogni variabile numerica.

descrizione_variabili <- function(df) {
  # Seleziona solo le variabili numeriche
  num_df <- df[sapply(df, is.numeric)]
  
  # Applica una funzione anonima per calcolare le statistiche
  risultato <- sapply(num_df, function(x) {
    c(
      Min = min(x, na.rm = TRUE),
      Max = max(x, na.rm = TRUE),
      Media = mean(x, na.rm = TRUE),
      Q1 = quantile(x, 0.25, na.rm = TRUE),
      Mediana = median(x, na.rm = TRUE),
      Q3 = quantile(x, 0.75, na.rm = TRUE)
    )
  })
  
  # Trasponi il risultato per avere le statistiche in colonne
  return(as.data.frame(t(risultato)))
}

# Esercizio 2: Verifica il funzionamento della funzione sul dataset Insurance disponibile nel pacchetto MASS.

library(MASS)
data("Insurance")
head(Insurance)
descrizione_variabili(Insurance)

# Esercizio 3: Creare un unico livello per i distretti 1 e 2 

Insurance$Group <- as.character(Insurance$Group)
Insurance$Group[Insurance$Group %in% c("1", "2")] <- "1-2"
Insurance$Group <- as.factor(Insurance$Group)
Insurance$Group

# Esercizio 4: senza utilizzare cicli for, creare una variabile binaria che indica se i 
#              Claims sono maggiori di 10 ed aggiungerla al dataframe

Insurance$HighClaims <- ifelse(Insurance$Claims > 10, 1, 0)
head(Insurance)

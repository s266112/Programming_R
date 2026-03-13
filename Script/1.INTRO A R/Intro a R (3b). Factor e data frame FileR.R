# --- 1. FACTOR (Fattori) ---
# FACTOR: E' una variabile categoriale che può assumere un numero limitato di valori diversi, chiamati livelli.
#         E' utile per rappresentare dati categorici come sesso, paese, grupppo, ecc..

## 1. Creazione di un vettore di caratteri:
country <- c("Italy","Germany","France","Germany","Germany","Germany",
             "France","Italy","Italy","France", "Italy")
str(country)  # Mostra che è un vettore di caratteri con 11 elementi

## 2. Conversione in factor
countryf <- factor(country)   # Converte il vettore in un factor
str(countryf)       # Mostra i LIVELLI: "France", "Germany", "Italy" (ordinati alfabeticamente). I VALORI sono rappresentati numericamente (1, 2, 3) con etichette

## 3. Verifica e funzioni base
is.factor(countryf)           # E' un factor? Si, quindi TRUE
as.factor(country)            # Alternativa per creare un factor
levels(countryf)              # Mostra i livelli unici: "France", "Germany", "Italy

## 4. Confronto tra un vettore e un factor
cbind(country, countryf)    # Mostra a confronto:   COUNTRY: Valori originali come caratteri   e   COUNTRYF: Stessi valori ma come factor (con livelli)

## 5. Modificare l'ordine dei livelli
?relevel
a <- relevel(countryf, "Italy")   # Rende "Italy" il primo livello
a
factor(country, levels = c("Italy", "Germany", "France"))   # Specifichiamo l'ordine dei livelli durante la creazione

## 6. Rinominare i livelli
countryf2 <- countryf       # Crea una copia del factor countryf e la assegna a countryf2
levels(countryf)           
levels(countryf2) <- c("Italy", "Germany", "France")  # Assegna nuovi livelli a conuntryf2, cambiando l'ordine in "Italy", "Germany", "France"
levels(countryf2)
cbind(countryf, countryf2)  # Mostra una tabella con: - Countryf --> Factor originale (Fra, Ger, Ita)   e  countryf2 --> Factor modificato (Ita, Ger, Fra)

## 7. Tabelle di frequenza
# Crea una tabella per ciascun factor
table(countryf)     # Ordina i risultati in base ai livelli originali (Fra, Ger, Ita)
table(countryf2)    # Ordina i risultati in base ai nuovi livelli (Ita, Ger, Fra)        

## 8. Esempio con Età
age <- c(47,44,44,40,38,36,42,34,34,44,42)  # Crea un vettore chiamato age
age
tapply(age, countryf, mean)   # Divide il vettore age in grapppi basati sui livelli di countryf; applica la funzione mean (media a ciascun gruppo); Restituisce i risultati
cbind(age, countryf)          # Mostra come sono organizzati i dati

## Esempio con Genere
gender <- c(1,1,2,1,1,2,1,2,2,2,1)      # Crea un vettore chiamato Genere
gender
genderf <- factor(gender)               # Converte il vettore numerico in un factor
genderf
levels(genderf)                         # Visualizza i livelli              
levels(genderf) <- c("F","M")           # Assegna nuove etichette ai livelli esistenti 1 -> F, 2-> M
str(genderf)                            # Struttura finale del factor

#### ESERCIZI:#####
#Es 1: Definisci un vettore x con gli elementi 5, 12, 13, 12. Converti questo vettore in factor e ispeziona la sua struttura. Come vengono definiti i livelli?
x <- c(5, 12, 13, 12)       # Crea un vettore numerico
x
xf <- factor (x)            # Converti in factor
xf
str (xf)                    # Mostra la struttura
# I livelli sono definiti come i valori unici del vettore, ordinati in modo crescente (5, 12, 13)

#Es 2: Crea un factor dalla sequenza di stringhe "1", "1", "0", "1","1", "0". Cosa restituiscono length() e mode()?
x <- factor (c("1", "1", "0", "1", "1", "0"))   # Crea factor
x
length(x)      # Lunghezza del factor
mode(x)        # Tipo di dato sottostante
# lenght(f): Restituisce "6" perchè ci sono 6 elementi nel factor
# mode(f):   Restituisce "numeric" perchè i livelli internamente sono rappresentati come numeri,
#            ma attenzione: se crei un factor da stringhe non numeriche, restituirà "numeric"
#            comunque anche se a livello esterno sembrano stringhe.

#Es 3: Converti la variabile factor del punto precedente in un factor con livelli "m" per 0 e "f" per 1. Cosa produce il comando table()?
levels(x) <-c("m", "f")   # Rinomina i livelli: 0 -> m    e   1 -> f. Assicurati che sia c("0", "1") prima di rinominare.
levels(x)
table(x)                  # Tabella di frequenza
# Il comando "table" crea una tabella di frequenza


#4. Eseguire le seguenti righe
v1 <- factor(letters[1:5])      # Crea un factor con livelli a, b, c, d, e
v1
levels(v1) <- rev(levels(v1))   # Inverte l'ordine dei livelli
v1
v2 <- factor(letters[1:5], levels = rev(letters[1:5]))   # Qui sia i valori che i livelli sono impostati in ordine inverso (e, d, c, b, a) 
v2
# 1. Cosa succede a v1 quando modifichi i suoi livelli?   2.In cosa differisce v2 da v1?

## 1. Prima della modifica v1 è un factor con: VALORI a, b,c d, e    e LIVELLI: a, b, c, d, e
##    Dopo la modifica: i VALORI rimangono gli stessi ma l'ORDINE dei livelli è invertito

## 2. V2 viene creato direttamente con i livelli invertiti


# --- 2. DATA FRAME ----
# DATA FRAME: E' una struttura dati fondamentale in R che somiglia a una tabella.
#             E' una lista di vettori (colonne), tutti della stessa lunghezza, ma ciascuno può contenere tipi di dati diversi.
#             Ogni colonna rappresenta una VARIABILE, mentre ogni riga rappresenta un'OSSERVAZIONE o CASO.
#             È bidimensionale (righe x colonne), come una matrice, ma più flessibile perché può gestire colonne eterogenee.
#             I data frame sono molto usati per organizzare, visualizzare e analizzare i dati in R.

## 1. -- CREAZIONE DI UN DATA FRAME -- 

# 1.a. Definire tutte le variabili necessarie: Prima di creare un data frame, tutte le colonne devono esistere come vettori

age <- c(47, 44, 44, 40, 38, 36, 42, 34, 34, 44, 42)    # Creo il vettore age
age

country <- c("Italy", "Germany", "France", "Germany", "Germany", "Germany", "France", "Italy", "Italy", "France", "Italy")     # Creo il vettore country
country

gender <- c(1, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1)      # Creo il vettore gender
gender

# 1.b. Convertire i vettori in factor (se necessario): I factor sono usati per variabili categoriche (es. paesi, sesso, ecc..)

countryf <- factor(country)   # Trasforma "country" in factor
genderf <- factor(gender, 
                  levels = c(1,2), 
                  labels = c("M", "F"))  # 1 = MASCHIO; 2 = FEMMINA

# 1.c: Creare altre variabili derivate: Possiamo creare colonne logiche (TRUE/FALSE) o calcolate

under40 <- age < 40   # TRUE se età < 40, FALSE altrimenti

# 1.d: Creare il data frame: Ora che tutti i vettori esistono, possiamo combinarli in un data frame
dat <- data.frame(
  Country=countryf,   # Factor
  Age=age,            # Numerico
  Sex=genderf,        # Factor
  Under40=under40     # Logico (TRUE/FALSE)
)

## 2. -- STRUTTURA DEL DATAFRAME APPENA CREATO --

head(dat)           # Mostra le prime 6 righe
str(dat)            # Mostra tipi di dati e prime osservazioni
dim(dat)            # Mostra la dimensione del data frame
is.data.frame(dat)  # E' un data frame? Si, quindi TRUE altrimenti FALSE

#View(dat)           # Apre la visualizzazione a tabella (in RStudio) 

## 3. -- OPERAZIONI BASE SUI DATA FRAME --

# 3.a: Selezionare colonne

## Metodo 1: $(per nome colonna)
dat$Age # Seleziona la colonna Age

## Metodo 2: [,] (come una matrice)
dat[, "Age"]    # Tutte le righe della colonna "Age"
dat[1:3, "Age"] # Prime 3 righe della colonna "Age"
dat[3, ]        # Tutta la terza riga
dat[, 1]        # Tutta la prima colonna

## Metodo 3: Accesso con doppie parentesi quadre
dat[["Country"]] # Seleziona la colonna "Country"

# 3.b: Operazioni di subsetting (sottomatrice)

dat[3, 2]       # Terza riga, seconda colonna (valore singolo)
dat[1:3, 2:4]   # Prime 3 righe, colonne dalla 2 alla 4
dat[3, ]        # Tutta la terza riga

dat[, c("Age", "Sex")]   # Per nome della colonna
dat[, c(2,3)]            # Per indice della colonna
dat[, 2:3]               # Per range di colonne 

dat["Age"]     # Restituisce un data frame con una colonna
dat[, "Age"]   # Restituisce un vettore
dat$Age        # Restituisce un vettore

# 3.c: Aggiungere una nuova colonna
dat$Italy <- dat$Country == "Italy"   # Aggiungi la nuova colonna logica "Italy" che è TRUE se il paese è "Italy"
head(dat)

dat$Italy <- under40 * 1              # Crea una nuova colonna numerica "Italy" moltiplicando il vettore logico per 1, sovrascrivendo "Italy".
head(dat)

dat <- cbind.data.frame(dat, Under40 = under40) # Aggiungi di nuovo "Under40" al data frame
head(dat)

# 3.d: Rimuovere una colonna
dat$Under40 <- NULL             # Elimina la colonna "Under40"
head(dat)
# OPPURE:  dat <- dat[, -4]      # Elimina la 4a colonna

# 3.e: Unire due dataframe (cbind)
new_col <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11)
dat <- cbind(dat, ID = new_col)   # Aggiunge una colonna "ID"
head(dat)

# Altri esempi di uso di cbind.data.frame()
cbind.data.frame(dat, under40)
X <- cbind.data.frame(dat, under40)
cbind.data.frame(dat, Under40 = under40 * 1)

# creare una nuova variabile logica uguale a TRUE se Country == Italy
dat$Italy <- dat$Country == "Italy"

## 4. -- CONVERSIONE AUTOMATICA CHARACTER IN FACTOR --

df <- data.frame(x = 1:5, 
                 y = c("A", "B", "C", "D", "E"))

# con conversione automatica in factor (opzionale, ma utile da conoscere)
df <- data.frame(x = 1:5, 
                 y = c("A", "B", "C", "D", "E"),
                 stringsAsFactors = TRUE)

## 5. -- USO DI attach() E detach() --
# Age non è visibile direttamente

Age                   # Errore: oggetto 'Age' non trovato, a meno che non si usi attach()
attach(dat)           # Rende le variabili del data frame visibili direttamente
Age                   # Ora funziona
dat$Age <- Age + 1    # Modifico la colonna Age del data frame

# Age <- Age + 1      # Questo modificherebbe la variabile temporanea, non la colonna del data frame

detach(dat)           # Scollega il data frame
Age                   # Non è più visibile direttamente, serve dat$Age

dat$Age               # Mostra la colonna Age aggiornata


######## Exercizi #########
#1. Esegui il codice seguente
x <- runif(8)                       # Genera 8 numeri casuali tra 0 e 1
y <- letters[1:8]                   # Prende le prime 8 lettere minuscole dell'alfabeto
z <- sample(c(rep(T,5),rep(F,3)))   # Crea un vettore con 5 TRUE e 3 FALSE mescolati

# Definisci un dataframe chiamato newdf con colonne z, y, x.

newdf <- data.frame(z, y, x)        # Crea un data frame con colonne z, y, x
newdf                               # Visualizza il data frame

#2. Crea un dataframe con 5 righe, utilizzando un elenco di caratteri che rappresenta i nomi e un vettore di numeri che rappresentano le età.
names <- c("Luca", "Marco", "Gaia", "Sabrina", "Mirko")  # Vettore di nomi
eta <- c(30, 25, 28, 35, 18)                             # Vettore di età

df2 <- data.frame(names, eta)                            # Crea un nuovo data frame
df2

#3. Rinominare la seconda variabile del dataframe al punto precedente con il nome "Age"
colnames(df2)[2] <- "Age"     # Rinomina la seconda colonna in "Age"
df2

#4. Stampare la dimensione del dataframe
dim(df2)    # Stampa la dimensione del dataframe: righe e colonne

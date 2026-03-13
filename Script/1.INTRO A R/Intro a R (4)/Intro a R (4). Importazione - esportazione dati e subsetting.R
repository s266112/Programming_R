# --- IMPORTAZIONE DATI ---

## 1. Impostare la working directory
getwd()     # Controlla qaul è la cartella di lavoro attuale
setwd("")   # Imposta una nuova cartella di lavoro (tra virgolette mettere il percorso dove ho il file )

# Oppure altri metodi:
# 1. Session -> Set Working Directory or Files tab -> More 
# 2. read.table(<name.file>, <arguments>)           --> Per importare file di TESTO
# 3. read.table("../data/mydata.dat", header=T)     --> Per importare file CSV
# 4. read.csv(<file path + file name>, <arguments>) --> Per importare file CSV

## 2. Importare un file CSV
Food <- read.csv("food_coded1.csv")         # Importa il file food_code1.csv e lo salva nel data frame "Food"

# E' possibile leggere anche i dati direttamente dal file xls. Bisogna prima installare la libreria da RStudio:
install.packages("openxlsx")  # Pacchetto da installare
library(openxlsx)             # Carica il pacchetto per utilizzarlo
a <- read.xlsx("")            # Tra virgolette metto il nome del file, oppure uso tab

## 3. Importiamo i vari data set
cigarette <- read.table ("importazione dataset/cigarette.txt", header = FALSE)
cipolle <- read.table ("importazione dataset/cipolle.dat", header = TRUE, stringsAsFactors = TRUE)
macchine <- read.csv ("importazione dataset/macchine/macchine.data", header = FALSE, na.strings = "?")
nazioni <- read.csv ("importazione dataset/nazioni.csv")
windmill <- read.table ("importazione dataset/windmill.txt", dec = ",", header = TRUE)
str(windmill)

# Dopo l'importazione, eploriamo i dati:
head(Food)       # Mostra le prime 6 righe del data frame
dim(Food)        # Mostra le dimensioni della tabella (righe e colonne)
str(Food)        # Mostra il tipo di dati in ogni colonna 
length(Food)     # Mostra il numero di colonne

## 4. Accedere e lavorare con le colonne di un data frame

# 4.a: Accesso alle colonne
# Queesti sono 3 modi equivalenti per accedere alla colonna GPA
Food$GPA        # Metodo 1:  Usando $
Food[, "GPA"]   # Metodo 2:  Mettendola tra le ""
Food[, 1]       # Metodo 3:  Usando l'indice (1 = prima colonna)

# 4.b: Esplorare una singola colonna
str(Food[[1]])   # Estrae la colonna GPA come vettore (simile a $) e mostra la sua struttura
Food$Gender[2:7] # Seleziona gli elementi dalla 2a alla 7a riga della colonna Gender
str(Food$Gender) # Mostra il tipo di dato (numeric, factor, ecc)

# 4.c: Conversione in fattori
is.numeric(Food$Gender)                   # Gender è Numeric? Si, quindi TRUE
is.factor(Food$Gender)                    # Gender è un Factor? Prima della conversione, no quindi FALSE
Food$Gender <- factor(Food$Gender)        # Convertiamo la colonna in un factor con due  livelli
Food$Gender
levels(Food$Gender) <- c("Female","Male") # Rinominiamo i livelli
str(Food$Gender)

## ---- ESEMPI PRATICI ---

# Esempio 1: Quante donne ci sono nel dataset? --> Conta quante righe hanno Gender uguale a "Female"

## Metodo 1:       sum (Food$Gender=="Female")
(Food$Gender=="Female")     # Crea un vettore logico (TRUE/FALSE): TRUE -> Female ; FALSE -> Male
sum (Food$Gender=="Female") # Somma tutti i TRUE, quindi 76

## Metodo 2:       length(Food$Gender[Food$Gender == "Female"])
Food$Gender == "Female"                       # Seleziona solo le posizioni dove Gender è Female
Food$Gender[Food$Gender == "Female"]          # Estrae tutti i valori "Female"
length(Food$Gender[Food$Gender == "Female"])  # Calcola il numero di elementi. quindi 76

## Metodo 3:       table(Food$Gender)
Food$Gender
table(Food$Gender)    # Crea una tabella di frequenza dove mostra il numero di "Female" e "Male"  
table(Food$Gender)[1] # Seleziona solo il numero di "Female"

# Esempio 2: Selezionamo il peso dei maschi

## Metodo 1:     Food$weight[Food$Gender == "Male"] 
Food$weight                           # Seleziona il peso di tutti gli individui
Food$weight[Food$Gender == "Male"]    # Seleziona solo il peso di "Male"

## Metodo 2:     Food[Food$Gender == "Male", "weight"] --> Forma matriciale
Food[Food$Gender == "Male", "weight"]             # Usiamo la notazione [righe, colonne]
Food[Food$Gender == "Male", c("GPA", "weight")]   # Selezioniamo due colonne contemporaneamente


# Esempio 3: Selezioniamo le colonne sport e lavoro solo per le donne. Le condizioni sono specificate nel campo dedicato alle righe
Food[Food$Gender == "Female", c("sports", "employment")] # Tutte le righe con Gender =="Female", solo colonne sports e employment

# Esempio 4: Selezioniamo il genere dei soggetti con sport==1 e vitamins==1
Food$Gender[Food$sports==1&Food$vitamins==1]      # Seleziona persone che fanno sport e che prendono vitamine


# Esempio 5: Selezioniamo i valori fruit day e veggie day per gli studenti maschi che hanno dichiarato fare attività sportiva (sports==1)

## Metodo 1: Usiamo la forma matriciale
Food2 <- Food[Food$Gender=="Male"&Food$sports==1, c("fruit_day", "veggies_day")]

## Metodo 2: Usiamo la funzione subset()
Food.subset <- subset(Food, 
       subset = (Gender=="Male" & sports==1),
       select = c(fruit_day, veggies_day))
str(Food.subset)

#!!: subset() RIMUOVE AUTOMATICAMENTE i NA nelle condizioni mentre [] invece MANTIENE i NA a meno che non sia esplicitamente filtrato.

# Esempio 6:Eliminiamo la variabile peso selezionando chi ha employment ==1 o ==2

## Metodo 1: Usiamo la forma matriciale
Food[Food$employment==1 | Food$employment==2,]        # Selezioniamo tutte le colonne
Food[Food$employment==1 | Food$employment==2, -48]    # Eliminiamo la colonna weight (colonna 48)

## Metodo 2: Versione compatta con < 3
Food[Food$employment==1 | Food$employment==2,]
Food[Food$employment<3, -48]                  # employment < 3 -> Seleziona i valori 1 e 2 (solo se è codificato come intero)


## Metodo 3: Usiamo la funzione subset()
subset(Food, 
       subset = (employment==1 | Food$employment==2),
       select = -c(weight))

# Esempio 7: Creiamo un nuovo data frame con studenti maschi con reddito >3, salvando nel nuovo oggetto solo le variabili da income a nutritional_check

newdata <- subset(Food,
                  Gender=="Male" & income > 3,                # Filtra i maschi con income > 3 
                  select = c(income:nutritional_check))       # Seleziona tutte le colonne da income a nutritional_check
str(newdata)


##        -- ESECIZI --

# Esercizio 1: Utilizzare una funzione adatta per analizzare la struttura dei dati. Controlla i nomi, la dimensione ed elenca le prime 8 osservazioni.
str(AutoBi)        # Mostra la struttura del dataset (tipo di ogni colonna)
names(AutoBi)      # Mostra i nomi delle colonne
dim(AutoBi)        # Mostra quante righe e colonne ha
head(AutoBi, 8)    # Mostra le prime 8 righe

# Esercizio 2: Utilizzare la funzione summary() per ottenere statistiche riassuntive delle variabili numeriche in un frame di dati.
summary (AutoBi)  # Mostra: minimo, massimo, media, mediana, 1° e 3° quartile, conteggi per categoria (per le colonne categoriali)

# Esercizio 3: Cosa restituiscono le seguenti righe? In cosa differiscono i due comandi per il subsetting?
AutoBi$CLMAGE[AutoBi$CLMAGE<20]   # Seleziona la colonna CLMAGE, e prende solo i valori minori di 20
# Il risultato è un vettore con età < 20

subset(AutoBi,                                                 
       subset=CLMAGE<20,          # Seleziona la colonna CLMAGE, e prende solo i valori minori di 20
       select=CLMAGE)             # Seleziona solo quella colonna
# Il risultato è un dataframe con una sola colonna

## La differenza tra i due è: $CLMAGE[...] = VETTORE   mentre    subset(...) = DATA FRAME

# Esercizio 4: Seleziona le variabili MARITAL e CLMINSUR ed i soggetti rappresentati da un avvocato, escludi i valori mancanti utilizzando la funzione na.omit
na.omit(subset(AutoBi, 
               subset = ATTORNEY == 1,            # Seleziona solo i casi con avvocato
               select = c(MARITAL, CLMINSUR)))    # Tiene solo queste due colonne

# Esercizio 5: Seleziona le donne di età inferiore ai 40 anni, sposate o divorziate, e con perdite (LOSS) superiori a 5000 dollari.
subset(AutoBi,
       subset = (CLMSEX == 2 & 
                 CLMAGE < 40 & 
                (MARITAL == 1 | MARITAL == 4) & 
                 LOSS > 5),
       select = c(CLMSEX, CLMAGE, MARITAL, LOSS))

# Esercizio 6: Aggiungi una nuova colonna con la variabili LOSS su scala logaritmica
AutoBi$logLOSS <- log(AutoBi$LOSS)
head(AutoBi[, c("LOSS", "logLOSS")])

# --- VALORI MANCANTI (NA) ---

## 1. Identificare NA
is.na(Food$calories_day)        # Crea un vettore logico (TRUE/FALSE) dove TRUE indica i valori mancanti
which(is.na(Food$calories_day)) # Numero di righe di valori mancanti

## 2. Calcoli con NA
mean(Food$calories_day)               # Restituisce NA se ci sono valori mancanti  
mean(Food$calories_day, na.rm = TRUE) # Ignora NA e calcola la media

## 3. Filtrare righe con NA
dim(Food[!is.na(Food$calories_day),]) # Eliminiamo i NA su calories_day
 
## 4. Eliminare tutti i NA
na.omit(Food)                # Rimuove righe con almeno un NA in qualsiasi colonna
Food[complete.cases(Food),]  # Restituisce TRUE per righe senza NA in tutte le colonne

# --- ESPORTAZIONE FILE --- 

## 1. Esportare come testo/CSV
write.table(Food,file="Food.dat")   # File di testo generico
write.table(Food,file="Food.csv", sep=",", row.names = FALSE)   # CSV Standard
# Oppure write.csv(...) per file CSV

## Salvataggio in formato R
save(Food,file="Food.RData")  # Salva solo l'oggetto "Food"
save(file="Food.RData")       # Salva TUTTI gli oggetti della sessione
#save.image()

## Caricare i dati salvati
load("Food.RData")            # Ricarica gli oggetti salvati


##    -- ESERCIZI --

#  Il set di dati `feeling` riguarda l'atteggiamento degli elettori americani nei confronti di diverse categorie di individui. 
#  Ogni variabile esprime un punteggio da 0 a 100, indicando un atteggiamento sfavorevole, indifferente 
#  o favorevole nei confronti dei gruppi di persone oggetto della domanda


# Esercizio 1: Definisci una variabile categoriale dalla variabile `ft_immig_2016`con le seguenti classi: 
#             strongly unfavorable (0-25), unfavorable/indifferent (26-50), lightly favorable (51-75),
#             favorable (76-100). Aggiungi la nuova variabile ai dati. Utilizza la funzione 'cut()'

# Creiamo la variabile categoriale
feeling$immig_attitude <- cut(feeling$ft_immig_2016,
                              breaks = c(-1, 25, 50, 75, 100),
                              labels = c("strongly unfavorable", 
                                         "unfavorable/indifferent", 
                                         "lightly favorable", 
                                         "favorable"),
                              include.lowest = TRUE)

# Verifica il risultato
table(feeling$immig_attitude, useNA = "always")  # Mostra conteggi per categoria + NA

# Esercizio 2: Rimuovi i valori mancanti ed esporta il dataframe in  file .csv. 

#  Rimuovi NA e esporta
feeling_clean <- na.omit(feeling)  # Rimuove righe con qualsiasi NA

# Verifica quanti casi sono stati rimossi
cat("Righe originali:", nrow(feeling), "\nRighe pulite:", nrow(feeling_clean))

# Esporta come CSV
write.csv(feeling_clean, 
          file = "feeling_clean.csv", 
          row.names = FALSE)  # Evita colonna con numeri di riga

# Verifica che il file sia stato creato
list.files(pattern = "feeling_clean.csv")  # Dovresti vedere il file


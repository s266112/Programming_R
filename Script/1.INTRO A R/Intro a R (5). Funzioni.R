#   --- FUNZIONI --- 
# FUNZIONE: Una funzione è un blocco di codice che prende dei valori in input (argomenti),
#           esegue delle operazioni, e restituisce un risultato.

# In R è possibile creare proprie funzioni ed organizzarle in pacchetti.
# I pacchetti possono essere pubblicati sul CRAN per renderli disponibili
# Le funzioni vengono salvate all'interno di oggetti nel workspace.

# 1. Sintassi base:

# nome_funzione <- function (arg1, arg2,...)
# { 
#   Corpo della funzione
#  return (risultato)
# }


# Esempio semplice: CUBO DI UN NUMERO
cube <- function(x)
{
  y<-x^3        # Eleva x alla terza
  return (y)    # Restituisci il risultato
}
b <- cube (3)   # Output: 27

# Oppure anche più corto

cube<-function(x)
{
  (x^3)         #  Ritorna automaticamente l'ultima riga (senza return)
}

cube(2)         # Output: 8


# Esempio semplice: POTENZA (Senza return) 
power <- function(x, exp)
{  
  x^exp
}
power(2,2)
a <- power(2,2)   # Output: 4
a   


# Argomenti con valore di default
power <- function(x, exp=1) # L'argomento "exp" ha valore di default = 1 
{ 
  y<-x^exp                  # Calcoliamo x elevato alla exp
  return(y)                 # Restituisce il risultato
}
a <- power(2,2)             # Chiamo la funzione passando 2 come base e 2 come esponente
a                           # Output: 4


# Più Output? Usiamo un vettore o una lista
power <- function(x, exp = 1)   # L'argomento "exp" ha valore di default = 1
{
  y<-x^exp                      # Calcoliamo x elevato alla exp
  return(c(result = y, input = x, exp = exp))   # Restituisce un vettore con più valori
}
a <- power(2,2)                 # Chiamo la funzione passando 2 come base e 2 come esponente
a                               # Output: 4   2   2

# --- ESERCIZI ---

# Esercizio 1: Scriviamo una funzione per calcolare la MEDIA di un vettore

my_mean <- function(a)
{
  media <- sum(a)/length(a)   # somma diviso lunghezza
  return(media)
}
x <- 1:10
my_mean(x)                   # Output: 5.5


# Esercizio 2: Scrivere una funzione che calcola la varianza e confrontare 
#              il risultato con quello ottenuto dalla funzione presente in R: var()

my_var <- function(x)
{
  n <- length(x)                    # Numero di osservazioni
  m <- sum(x) / n                   # Media
  varianza <- sum((x-m)^2) / (n -1) # Formula della varianza
  return (varianza)
}

dati <- c(2, 4, 4, 4, 5, 7, 9)
my_var(dati)    # Mia funzione
var(dati)       # Fuzione di R

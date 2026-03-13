# --- DISTRIBUZIONI DI PROBABILITA' DISCRETE ---

# Le distribuzioni di probabilità discrete descrivono il comportamento di variabili 
# aleatorie (cioè soggette al caso), che possono assumere solo un insieme finito o numerabile di valori. 

# -- 1. DISTRIBUZIONE BINOMIALE --

# La distribuzione binomiale descrive il numero di successi in una sequenza di 
# prove indipendenti, ognuna con due soli esiti (successo o insuccesso), e con 
# probabilità costante di successo .

# La notazione è:
#                    X∼Binom(n,p)
                    
# X: E' la variabile aleatoria, cioè il numero di successi
# n: E' il numero di prove
# p: E' la probabilità di successo di ogni prova
                    
                    
# Esempio 1: Calcolo della probabilità esatta
choose(20,5)* 0.5^5*(1-0.5)^15  # P(X = 5) con X ~ Binom (20, 0.5) 

# Qui stiamo calcolandola probabilità esatta di ottenere esattamente 5 successi
# in 20 prove con probabilità 0.5 di successo.

# 1.a Visualizzazione della distribuzione

x <- c(0:20)                  # Creiamo un vettore di valori da 0 a 20
pbin <- choose (20, x) * 0.5^x*(1 - 0.5)^(20 - x) 
pbin                          # Calcoliamo la funzione di probabilità per ognuno di questi valori
plot(0:20, pbin, type = "h")  # La visualizziamo in un grafico a steli ("type='h'"in plot())

# 1.b Funzioni in R per la distribuzione binomiale

# In R, per ogni distribuzione ci sono 4 funzioni principali preceduti da 4 prefissi
# che indicano il tipo di funzione:
# - "d" = DENSITA' (o PROBABILITA')
# - "p" = FUNZIONE DI RIPARTIZIONE
# - "q" = QUANTILI
# - "r" = GENERA VALORI CASUALI.

# Per la binomiale:
# - dbinom (x, size, prob) -> Calcola P(X = x), cioè la DENSITA'("d")
# - pbinom (x, size, prob) -> Calcola P(X ≤ x), cioè la FUNZIONE DI RIPARTIZIONE ("p")
# - qbinom (p, size, prob) -> Calcola P(X ≤ x) = p, cioè i QUANTILI ("q")
# - rbinom (n, size, prob) -> Genera n valori casuali da Binom(size,prob) ("r")

# Esempio 2: 
dbinom(5, 20, 0.5)

# Esercizio: CALCOLO CON IL DADO

# DOMANDA: Calcola la probabilità  che esca due volte 
#          il numero 6 su 15 lanci, da un dado regolare a 6 facce.

# RAGIONAMENTO: Modello questa domanda con una distribuzione binomiale:
# - n = 15: Numeri di lanci
# - p = 1/6: Probabilità di ottenere un 6
# - x = 2: Numero desiderato di successi (cioè "6")

dbinom(2, size = 15, prob = 1/6) # Output: 0.272603 (circa il 27.3 %)


# Esercizio: GENERAZIONE DI NUMERI CASUALI

# DOMANDA: Simuliamo una sequenza di 100 lanci di una moneta ('testa' o 'croce')
#          generando una simulazione di Bernoulli con $p=0.5$

set.seed(123) # Per riproducibilità
prova <- rbinom(100, 1, 0.5)
prova
table (prova) # Grafico

# -- 2. DISTRIBUZIONE DI POISSON --

# La distribuzione di POISSON descrive il numero di eventi in un 
# intervallo di tempo/spazio, come media λ.

# La formula è:
#                     P(X = x) = (λ^x * e^(-λ)) / x!

# Esercizio: FUNZIONE DI POISSON

# DOMANDA: Replicare per la poisson ciò che abbiamo fatto con la binomiale.
#         a. Scrivere la funzione di probabilità di una poisson
#         b. Rappresentare graficamente la funzione
#         c. Confrontare la poisson con la binomiale (approssimazione), con un grafico

# Punto a: Scrivere la funzione di probabilità di una Poisson

poisson_pmf <- function(x, lambda){                 # Definisco una funzione per calcolare la probabilità 
  prob <- (lambda^x * exp(-lambda)) / factorial(x)  # Calcolo della formula della Poisson
  return(prob)                                      # Ritorna la probabilità calcolata
}
poisson_pmf(3,2)                                    # Calcolo P(X = 3) se λ = 2

# Punto b: Rappresentare graficamente la funzione (in es. per valori da 0 a 10)

lambda <- 3                     # Imposto un valore per la lamda della poisson
x <- 0:15                       # Definisco una sequenza di valori x da 0 a 15 (copre bene la curva labda = 3)
prob_pois <- dpois (x, lambda)  # Calcolo le prob usando la funzione dbinom (uso direttamente dpois, che è la fun massa di probabilità della poisson in R) 
prob_pois                       # Stampo i valori per vederli
# Traccio il grafico a linee verticali tipo "istogramma"
plot(x, prob_pois, type = "h", lwd = 2, col = "blue",
     main = paste("Distribuzione di Poisson (λ =", lambda, ")"),
     xlab = "Numero di eventi (x)", ylab = "Probabilità P(X = x)")

# Punto c: Confrontare la Binomiale con la Poisson in caso un cui la Poisson aprossima bene la Binomiale
# IPOTESI:  - Distribuzione Binomiale con: n = 100  e   p = 0.02
#           - Media Attesa: λ = np = 100 × 0.02 = 2
# Quindi confrontiamo: X = Binomiale (100, 0.02)    e   Y = Poisson (2)

n <- 100                          # Numero di prove nella Binomiale
p <- 0.02                         # Probabilità di successo
lambda <- n * p                   # Media della Poisson
binom_probs <- dbinom(x, n, p)    # Calcolo delle probabilità per la Binomiale
pois_probs <- dpois (x, lambda)   # Calcolo delle probabilità per la Poission
# Confronto grafico
plot(x, binom_probs, type = "h", lwd = 2, col = "blue",
     ylim = c(0, max (binom_probs, pois_probs)),
     main = "Binomiale vs Poisson",
     xlab = "x", ylab = "probabilità")
points(x + 0.1, pois_probs, type = "h", lwd = 2, col = "red")

# Legenda
legend("topright", legend = c("Binomiale(100, 0.02)", "Poisson(2)"),
       col = c("blue", "red"), lty = 1, lwd = 2)

# 3. -- DISTRIBUZIONI DI PROBABILITA' CONTINUE NORMALE (O GAUSSIANA) --

# Una variabile aleatoria X continua è normalmente distribuita 
# se segue la distribuzione:
#                        X∼N(μ,σ^2) 
# μ: E' la MEDIA
# σ^2: E' la VARIANZA (attenzione: non la deviazione standard!)
# E' SIMMETRICA, a "campana", con centro in μ

# Esempio Grafico:

xx <- seq(-5, 5, 0.01)  # Creiamo una sequenza di valori da -5 a 5, con passo 0.01
# Disegnamo 3 curve normali con medie diverse
plot(xx, dnorm(xx, -2, 1), type = "l", xlim = c(-6, 6), ylab = "densità", col = 1, lwd = 2)
points(xx, dnorm(xx, 0, 1), type = "l", lty = 2, col = 2, lwd = 3)  # Media 0
points(xx, dnorm(xx, 2, 1), type = "l", lty = 3, col = 3, lwd = 3)  # Media 2

# In Alternativa, per aggiungere una curva, si può scrivere:
curve(dnorm(x, -1, 1.5), col = 4, lwd = 3, lty = 4, add = TRUE)

# dnorm(x, mean, sd): Calcola la densità della normale in x
# Più la deviazione standard (sd) è alta, più la curva è "piatta"

# 3.1 Funzione di ripartizione

# La funzione di ripartizione ci dice la probabilità che una variabile X 
# assuma un valore minore o uguale ad un certo valore.

# Esempio:
curve(pnorm(x, -1, 1.5), col = 4, lwd = 3, lty = 4, xlim = c(-4, 4))

# pnorm(x, mean, sd): Restituisce P (X ≤ x) 

# Esercizio: CALCOLARE le seguenti quantità per X ~ N(170,100):

# a: Calcolare P(X ≤ 185):
# IDEA: La dev standard 𝜎è la radice quadrata della VARIANZA, quindi 𝜎= sqrt(100) = 10
pnorm(185, mean = 170, sd = 10) # Output = 0.9331928 circa 93,3 % di prob


# b: Calcolare P(165 ≤ X ≤ 190):
# IDEA: P(165 ≤ X ≤ 190) = P(X ≤ 190) - P(X < 165)
pnorm(190, mean = 170, sd= 10) - pnorm(165, mean = 170, sd = 10) # 0.6687123 circa il 66.87 %


# c: Calcolare il 99-eseimo percentile di X ~ N(170,100)
# IDEA: Equivale a trovare il valore di x tale che P(X ≤ x) = 0.99
qnorm(0.99, mean = 170, sd = 10) # Output = 193.2635 circa 99 %

# d: Calcolare lo scarto interquartile di X∼N(170,100)
# IDEA: Lo scarto interquartile (IQR) è la differenza tra il 3° quartile (Q3) e il 1° quartile (Q1), quindi IQR = Q3 - Q1 
qnorm(0.75, mean = 170, sd = 10) # Q3
qnorm(0.25, mean = 170, sd = 10) # Q1
qnorm(0.75, 170, 10) - qnorm (0.25, 170, 10) # Output = 13.4898, circa il 50 %

# -- 4. GENERAZIONE DI NUMERI CASUALI --

##  4.1 Distribuzione uniforme continua:
# Ogni valore tra 0 e 1 ha la stessa probabilità di essere estratto

# Esercizio: DISTRIBUZIONE CONTINUA
# DOMANDA: Simulare 500 numeri casuali distribuiti uniformemente tra 0 e 1 
#          e verificare quanti di questi valori sono inferiori a 0.4.

set.seed(14)                      # Impostiamo un "seme" per rendere la simulazione ripetibile
simu <- runif(500, 0, 1)          # Generiamo 500 numeri casuali uniformi tra 0 e 1
sum(simu < 0.4) / length(simu)    # Calcoliamo la proporzione dei valori inferiori
                                  # Output: 0.396, circa il 40 %
## 4.2: Distribuzione di Poisson:

# Esercizio: DISTRIBUZIONE DI POISSON
# DOMANDA: Generare 500 valori casuali da una distribuzione di Poisson con 
#          media 5 e confrontare la distribuzione empirica con quella teorica.

set.seed(3)
n <- 500                      # Numero di osservazioni da generare
dati.pois <- rpois(n, 5)      # Generiamo 500 valori da una distribuzione di Poisson
freq_ass <- table(dati.pois)  # Creiamo la tabella delle frequenze assolute
freq_df <- as.data.frame(freq_ass) # Convertiamo la tabella in un data frame
punti <- as.numeric(levels(freq_df$dati.pois))    # Otteniamo i valori distinti osservati (x)
freq <- as.numeric(freq_ass / n)                    # Calcolimao la frequenza relativa

# Grafico delle Frequenza empiriche
plot(punti, freq, type="h", ylab="Probabilità", xlab="x", xlim=c(0,13))

# Aggiungiamo la distribuzione teorica di Poisson con media 5 (per confronto)
points(punti + 0.1, dpois(punti, 5), type="h", col=2, lwd=3)

## 4.3 Distribuzione Gaussiana (o Normale)

# Esercizio: DISTRIBUZIONE GAUSSIANA
# DOMANDA: Generare 800 valori da una distribuzione normale con media 10 e varianza 25, 
#          e confrontare l'istogramma dei dati con la densità teorica della distribuzione normale.

set.seed(42)
dati.norm <- rnorm(800, 10, 5) # 800 valori da N(10, 25): media = 10, sd = 5

# Istogramma dei dati simulati, con densità (freq = FALSE) al posto di conteggi
hist(dati.norm, probability = TRUE, col = "lightblue", 
     main = "Distribuzione normale simulata", xlab = "Valori")

# Sovrapponiamo la curva teorica della densità normale
curve(dnorm(x, mean = 10, sd = 5), col = "red", lwd = 2, add = TRUE)

# Aggiungiamo la legenda
legend("topright",                                      # Posizione della legenda
       legend = c("Dati simulati", "Densità teorica"),  # Etichette
       col = c("lightblue", "red"),                     # Colori corrispondenti
       lwd = c(10, 2),                                  # Larghezza delle linee/barre
       bty = "n")                                       # Rimuove il bordo della legenda
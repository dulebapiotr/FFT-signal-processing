# Programownaie w języku Fortran - projekt 2
## Program
### Pliki
W katalogu **src** znajduje się plik makefile, który kompiluje i uruchamia programy. 
### Uruchamianie
Po pobraniu kodu źródłowego, z poziomu katalogu **src** wydajemy komendę:
```
make all
```
Program zostanie skompilowany i uruchomiony. Wyniki zostaną zapisane w katalogu res.
### Generowanie wyników
Po wejściu do katalogu **res** wydajemy z jego poziomu komendę:
```
make plot
```
Wykresy powinny zostać wygenerowane w katalogu **res**

## Sprawozdanie
### Transformata sygnału złożonego.
Dla sygnału danego wzorem: 
**f(t)=sin(2πt*200)+2sin(2πt*400)**,
jego wykres w dziedzinie czasu na przedziale **0<x<1** wygląda nastepująco:

![alt text](https://github.com/dulebapiotr/FFT-signal-processing/blob/master/res/signal_time.png)

Syngnał następnie poddano transformacie Fouriera. Otrzymano następujący wynik:
![alt text](https://github.com/dulebapiotr/FFT-signal-processing/blob/master/res/signal_frequency.png)

Jak widać na powyższym wykresie, można wyróżnić 2 widoczne "szpilki". Odpowiadają one sygnałom składającym się 
na sygnał wejściowy. Ich częstotliwości to odpowiednio **200Hz** i **400Hz**.
Dzięki zastosowaniu transformaty można w łatwy i widoczny sposób pokazać, z jakich sygnałów złożony jest jakiś sygnał, co jest ciężkie do zauważenia w dziedzinie czasu.

### Zastosowanie transformaty Fouriera do filtracji zaszumionego sygnału.
Naszym sygnałem wejściowym będzie czysty sinus, czyli **f(t)=sin(2πt)**.
Jego wykres w dziedzinie czasu, jak powszechnie wiadomo wygląda następująco:

![alt text](https://github.com/dulebapiotr/FFT-signal-processing/blob/master/res/clear_sinus_time.png)

Następnie został naniesiony  na niego szum, w naszym przypadku losowe wartości. Teraz nasz sygnał prezentuje się nastepująco:

![alt text](https://github.com/dulebapiotr/FFT-signal-processing/blob/master/res/sinus_time.png)

Tak zaszumiony sygnał poddano transformacie Fouriera. Otrzymano następujący wynik:

![alt text](https://github.com/dulebapiotr/FFT-signal-processing/blob/master/res/sinus_frequency.png)

Widać, że oprócz pojedynczej wyrażnej "szpilki" wystapuje dużo innych, mnijeszych. Są to właśnie częstotliwości szumów które dodaliśmy uprzednio. 
Następnie pozbywając się tych mnijeszych szpilek sygnałów(redukując elementy tablicy o module mniejszym od 50 do 0), otrzymujemy następujący wykres:

![alt text](https://github.com/dulebapiotr/FFT-signal-processing/blob/master/res/sinus_frequency_clear.png)





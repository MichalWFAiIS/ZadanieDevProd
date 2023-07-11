# ZadanieDevProd

Zadanie dodatkowe w ramach zajęć z Przygotowanie środowiska developerskiego i produkcyjnego na PSPiZK

## Wykorzystane polecenia

Utworzenie obrazu z pliku Dockerfile
```
docker build --tag zadaniedevprod .
```

Utworzenie kontenera na podstawie obrazu
```
docker run --name ZadanieDevProd -p 8080:8080 zadaniedevprod
```

## Opis

Dostęp do aplikacji z poziomu przeglądarki pod adresem
```
http://localhost:8080/swagger/index.html
```

W ramach zadania wykorzystano aplikację stworzoną na podstawie domyślnego szablonu ASP.NET z VS2022.
Plik Dockerfile zorganizowano w postaci dwustopniowej (multi-stage building): środowiska kompilacyjnego (build-env) i środowiska uruchomieniowego (runtime).
Oba środowiska opierają się na standardowej dystrybucji Linuxa ubuntu:22.04.

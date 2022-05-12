TASK1:
    -folosesc bl, registrul de 8 biti din ebx pe care il xorez inainte pentru a ma asigura ca nu am nicio valoare suspecta
    -cu ajutorul lui bl modific pe rand fiecare caracter din sirul de modificat (esi) printr-un for si ecx, inepand de la finalul sirului pana ce ecx ajunge 0 si nu mai am elemente in sir
    -adaug la bl dl - pasul de codificat si verific daca se depaseste de litera Z (90 in ascii)
    -daca da se sare la DEPASIT unde din bl scad 26 pentru ca astfel se ajunge la litera corecta intervalul fiind de la A la Z(65-90) 
    -pun in edi(sirul ce va fi in final codificat) de la final litera modificata adica bl
    -se decrementeaza ecx in ambele cazuri si se sare inapoi la caesar realizandu-se un for

TASK2:
    1)-points-distance-
        -cu ajutorul registrilor edx si ecx aflu punctele, astfel folosesc dx si cx (prima jumatatea a registrilor pe 16 biti intrucat structura este short) 
        -retin x-ul fiecarui punct prima data in cx si dx si verific daca cele 2 punct eau X-ul egal sau Y-ul
        -se face jump la labelul corespunzator,pt X_EQUAL distanta este diferenta dintre Y deci trebuie sa modific dx si cx inainte de le compara si a face operatia; 
        -in cazul Y_EQUAL cele 2 elemente doar se compara
        -cu ajutorul labelului CONTINUE tin evidenta unde se termina calculul distantei pentru a se putea continua si a se pune distanta in parametrul cerul care era int pointer
        -pun astfel la adresa la care pointeaza edi, un word 16 biti reprezentati de distanta ceruta

    2)-road-
        -copiez vectorul de distanta in esi intrucat voi folsi registrul ebx pentru calculul distantei dintre 2 puncte
        -decrementez ecx - numarul de puncte intrucat acesta este numarul de perechi pentru care voi calcula distanta dintre ele
        -labelul FOR afla aceste perechi, de la final, incepand cu x-ul lor pentru a se respecta logica de la algoritmul anterior

        -acum ca stiu perechea de puncte aflu distanta dintre ele in acelasi mod cu ajutorul lui eax pe care am avut grija sa il retin inaintea forului punandu-l in varful stivei, eax a fost folosit pana in acest punct pentru aflarea perechilor si trebuie mereu reitnut inainte de acestea de aceea folosesc stiva

        -aflu distanta la fel ca la 1) si ma intorc in FOR
        -acum putem introduce distantele in vector asa ca fac jump la acest label
        -aici ebx recapata scopul sau initial, reia valoarea lui esi care retine vectorul de distnate modificat anterior 
        -pun in vector distanta si retin iar vectorul modificat pentru ca ne vom intoarce in for unde ebx va fi folosit pt a afla perechea

        -la after distance, reactualizez eax cu vectorul de puncte din care se vor prelucra perechile cand se revine in for si decid daca ma intorc in for sau am terminat

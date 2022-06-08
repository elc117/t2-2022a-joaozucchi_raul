% CADEIA ALIMENTAR COM RECURSÃO, I/O E ARQUIVOS

% criação da cadeia alimentar
come(grilo, vegetal).
come(sapo, grilo).
come(cobra, sapo).
come(gaviao, cobra).
come(caramujo, vegetal).
come(peixe, caramujo).
come(pelicano, peixe).
come(besouro, vegetal).
come(sapo, besouro).
come(aguia, sapo).
come(rato, vegetal).
come(cobra, rato).
come(coelho, vegetal).
come(veado, vegetal).
come(raposa, coelho).
come(aguia, coelho).
come(aguia, raposa).
come(lobo, raposa).
come(lobo, veado).

cadeiaAlimentar(A, B) :- come(A, B).
cadeiaAlimentar(A, B) :-
    come(A, X),
    cadeiaAlimentar(X, B).


escreverCadeiaPredador() :-
    open("predador.txt", write, Stream),
    write("Digite o nome do animal: "),
    read(X),
    cadeiaAlimentarEscrita(X, vegetal, Stream),
    write(Stream, X),
    close(Stream).

cadeiaAlimentarEscrita(A, B, Stream) :- 
    come(A, B),
    write(Stream, B),
    nl(Stream),
    write(Stream, " ^"),
    nl(Stream),
    write(Stream, " |"),
    nl(Stream).
cadeiaAlimentarEscrita(A, B, Stream) :-
    come(A, X),
    cadeiaAlimentarEscrita(X, B, Stream),
    write(Stream, X),
    nl(Stream),
    write(Stream, " ^"),
    nl(Stream),
    write(Stream, " |"),
    nl(Stream).


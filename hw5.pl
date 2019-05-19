:- module(hw5, [catomic_number/2, ion/2, molecule/2]).
:- [catoms].

sum([], 0).
sum([H|T], N) :- sum(T, N1), N is N1+H.

last([N], N).
last([_|T], N) :- last(T, N).

total([H], TOTAL) :- catomic_number(H, TOTAL).
total([H1,H2|T], TOTAL) :- TOTAL >= 0, catomic_number(H1, N1), catomic_number(H2, N2), N1 =< N2, REM is TOTAL-N1, total([H2|T], REM).

bond([H], CHARGE) :- ion(H, CHARGE).
bond([H1|T], CHARGE) :- ion(H1, C1), bond(T, C2), CHARGE is C1+C2.

catomic_number(NAME, NUMBER) :- catom(NAME, MASS, RADIUS, ELECTRON_LIST), sum(ELECTRON_LIST, SUM), SUM = NUMBER.

ion(NAME, CHARGE) :- catom(NAME, MASS, RADIUS, ELECTRON_LIST), last(ELECTRON_LIST, LAST), (LAST>4 -> CHARGE is LAST-8 ; CHARGE is LAST).

molecule(LIST, TOTAL) :- total(LIST, TOTAL), bond(LIST,0).



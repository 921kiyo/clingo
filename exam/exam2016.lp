refuse(P, F):- not eat(P, F), person(P), food(F).
person(p1).
person(p2).
food(nuts).
food(bread).
allergic(p1, nuts).
allergic(p2, bread).

eat(P,F):- not refuse(P, F), not allergic(P, F), person(P), food(F).

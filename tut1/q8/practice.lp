step(0..6). % This is shorthand for the facts step(0), ..., step(6).
block(a).
block(b).
block(c).
on(b, table, 0).
on(a, table, 0).
on(c, a, 0).
finished(T) :- goal(T2), step(T), T >= T2.
goal(T) :- on(c, table, T), on(b,c, T),
on(a, b, T), not finished(T-1).
goalMet :- goal(T).
:- not goalMet.
clear(table, T) :- step(T).
clear(L, T) :- not blocked(L, T), block(L), step(T).
blocked(L, T) :- on(B, L, T).
0 { move(B, L, T) } 1 :- B != L, block(B), not blocked(B, T),
clear(L, T), not finished(T).
:- move(B, L, T), move(B2, L2, T), B != B2.
:- move(B, L, T), move(B, L2, T), L != L2.

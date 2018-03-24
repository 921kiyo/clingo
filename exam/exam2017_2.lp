q(X):- not p(X), s(X).
r(1, a).
r(2, b).
s(1).
s(2).
t(a).
t(b).

p(X):- not q(X), not r(X, a), s(X).

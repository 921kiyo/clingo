p(X):- not q(X), r(X).
q(X):- not p(X), r(X).
s:- q(X), not s.
r(1).
r(2).

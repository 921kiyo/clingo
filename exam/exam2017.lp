q(X):- not p(X), s(X).
r(1, a).
r(2, b).
s(1).
s(2).
t(a).
t(b).

% p(X):- not q(X), not r(X, a), s(X).

p(X):- s(X), rule(1).
p(X):- s(X), not q(X), rule(2).
p(X):- s(X), not r(X, C), rule(3, C).
p(X):- s(X), not r(X, C), not q(X), rule(4, C).

{
  rule(1),
  rule(2),
  rule(3, a),
  rule(3, b),
  rule(4, a),
  rule(4, b)
}.

  #minimize[
  rule(1) = 1,
  rule(2) = 2,
  rule(3, a) = 3,
  rule(3, b) = 3,
  rule(4, a) = 4,
  rule(4, b) = 4
].


goal:- q(1), not q(2).
:- not goal.

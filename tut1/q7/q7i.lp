r(1..2).
p(X) :- not q(X), r(X).
q(X) :- not p(X), r(X), in_hyp(1).
q(X) :- p(X), r(X), in_hyp(2).
q(X) :- s(X), in_hyp(3).
s(X) :- p(X), in_hyp(4).
:- not p(1).
:- not q(2).
:- p(2).
:- q(1).
0 { in_hyp(1), in_hyp(2), in_hyp(3), in_hyp(4) } 4.
#minimize[ in_hyp(1)=3, in_hyp(2)=3,in_hyp(3)=2, in_hyp(4)=2 ].

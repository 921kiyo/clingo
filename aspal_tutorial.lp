% skeleton rules

proven_guilty(bob, murder).
proven_guilty(fred, robbery).
person(bob).
person(fred).
crime(murder).
crime(robbery).

murderer(P) :- person(P), rule(1).
murderer(P) :- person(P), proven_guilty(P,C1), rule(2, C1).
murderer(P) :- person(P), proven_guilty(P,C1), proven_guilty(P,C2), rule(3, C1, C2).

goal :- murderer(bob), not murderer(fred).
:- not goal.

{rule(1), rule(2,murder), rule(2,robbery), rule(3,robbery, murder)}.

#minimize[rule(1)=1, rule(2,murder)=2, rule(2,robbery)=2, rule(3,robbery, murder)=3].

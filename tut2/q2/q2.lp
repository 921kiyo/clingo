
% Background Knowledge
proven_guilty(bob, murder).
proven_guilty(fred, robbery).
person(bob).
person(fred).
crime(murder).
crime(robbery).

% Skeleton rules
murderer(V1):- person(V1), rule(1).
murderer(V1):- person(V1), proven_guilty(V1, C1), rule(2, C1).
murderer(V1):- person(V1), proven_guilty(V1, C1), proven_guilty(V1, C2), rule(3, C1, C2).

{rule(1), rule(2, robbery), rule(2, murder), rule(3, robbery, murder)}.

goal:- murderer(bob), not murderer(fred).
:- not goal.

#minimize [rule(1)=1, rule(2, robbery)=2, rule(2, murder)=2, rule(3, robbery, murder)=3].

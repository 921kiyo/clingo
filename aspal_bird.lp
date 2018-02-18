bird(a).
bird(b).
ability(fly).
ability(swim).
can(a, fly).
can(b, swim).

% skeleton rules
penguin(V1):- bird(V1), rule(1).
penguin(V1):- bird(V1), not can(V1, C1), rule(2, C1).
penguin(V1):- bird(V1), not can(V1, C1), not can(V1, C2), rule(3, C1, C2).

{rule(1), rule(2, fly), rule(2, swim), rule(3, fly, swim)}.


goal:- penguin(b), not penguin(a).

:- not goal.

#minimize [rule(1)=1, rule(2, fly)=2, rule(2, swim)=2, rule(3, fly, swim)=3].

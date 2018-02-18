property(sparrow, alive).
property(sparrow, has_wings).
property(aeroplane, has_wings).
thing(sparrow).
thing(aeroplane).


bird(V1):- thing(V1), rule(1).
bird(V1):- thing(V1), property(V1, C1), rule(2, C1).
bird(V1):- thing(V1), not property(V1, C1), rule(3, C1).

{rule(1), rule(2, alive), rule(2, has_wings), rule(3, alive), rule(3, has_wings)}.


goal:- bird(sparrow), not bird(aeroplane).
:- not goal.

#minimize[rule(1)=1, rule(2, alive)=2, rule(2, has_wings)=2, rule(3, alive)=2, rule(3, has_wings)=2].

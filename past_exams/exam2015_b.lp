% Question i
entertainer(V1):- person(V1).
entertainer(V1):- person(V1), male(V1).
entertainer(V1):- person(V1), has_job(V1, C).
entertainer(V1):- person(V1), male(V1), has_job(V1, C).
king(V1):- person(V1).
king(V1):- person(V1), male(V1).
king(V1):- person(V1), has_job(V1, C).
king(V1):- person(V1), male(V1), has_job(V1, C).

$ Question ii

entertainer(V1):- person(V1), rule(1).
entertainer(V1):- person(V1), male(V1), rule(2).
entertainer(V1):- person(V1), has_job(V1, C), rule(3, C).
entertainer(V1):- person(V1), male(V1), has_job(V1, C), rule(4, C).
king(V1):- person(V1), rule(5).
king(V1):- person(V1), male(V1), rule(6).
king(V1):- person(V1), has_job(V1, C), rule(7, C).
king(V1):- person(V1), male(V1), has_job(V1, C), rule(8, C).

{rule(1),
 rule(2),
 rule(3, monarch),
 rule(3, jester),
 rule(4, monarch),
 rule(4, jester),
 rule(5),
 rule(6),
 rule(7, monarch),
 rule(7, jester),
 rule(8, monarch),
 rule(8, jester)}.


 % question ii + H + goal

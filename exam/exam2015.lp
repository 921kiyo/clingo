male(X):- not female(X), person(X).
female(X):- not male(X), person(X).
person(p1).
person(p2).
has_job(p1, monarch).
has_job(p2, jester).
job(monarch).
job(jester).

king(X):- male(X), has_job(X, monarch).
entertainer(X):- has_job(X, jester).

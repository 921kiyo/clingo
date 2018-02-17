headache(X):- jaundice(X).
headache(X):- migraine(X).
sickness(X):- stomachBug(X).

% Abducibles
{jaundice(bob), migraine(bob), yelloEyes(bob)}.

:- migraine(X), jaundice(X).
:- jaundice(X), not yelloEyes(X).
:- jaundice(X), not sickness(X).

:- not headache(bob).

#minimize[jaundice(bob)=1, migraine(bob)=1, yelloEyes(bob)=1].


% KB
headache(X):- jaundice(X).
headache(X):- migraine(X).
sickness(X):- stomachBug(X).

% IC
:- migraine(X), jaundice(X).
:- jaundice(X), not yellowEyes(X).
:- jaundice(X), not sickness(X).

% Observation
:- not headache(bob).
0{jaundice(bob), migraine(bob), yellowEyes(bob)}3.

#minimize [jaundice(bob)=1, migraine(bob)=1, yellowEyes(bob)=1].

rock(X):- not paper(X), not scissors(X), player(X).
paper(X):- not rock(X), not scissors(X), player(X).
scissors(X):- not rock(X), not paper(X), player(X).

wins(X):- rock(X), scissors(Y).
wins(X):- scissors(X), paper(Y).
wins(X):- paper(X), rock(Y).

player(1).
player(2).

% a.i
% rock(X):- player(X).
% scissors(X):- player(X).

% a.ii
% rock(1):- not paper(1), player(1).
% paper(1):- not rock(1), player(1).
% scissors(2).

% a.iii
%rock(X):- player(X).
%paper(X):- player(X).
%scissors(X):- player(X).


% b.i
% :- wins(1), paper(1).


% b.ii
% 1{wins(1), paper(1)}1.


% b.iii
rock(1).
scissors(2).

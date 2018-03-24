rock(X):- not paper(X), not scissors(X), player(X).
paper(X):- not rock(X), not scissors(X), player(X).
scissors(X):- not rock(X), not paper(X), player(X).

wins(X):- rock(X), scissors(Y).
wins(X):- scissors(X), paper(Y).
wins(X):- paper(X), rock(Y).

player(1).
player(2).

% a.i
% rock(1).

% a.ii
% scissors(2).

% a.iii
% rock(1).
% scissors(2).

% b.i
% :- paper(1).

% b.ii
% :- not scissors(2).


% b.iii
% :- not wins(1).

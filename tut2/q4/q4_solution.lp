% background

player(p1). player(p2).
rank(1..10).
suit(clubs).
suit(diamonds).
suit(hearts).
suit(spades).
is_suit(c(R,S),S) :- rank(R), suit(S).
time(1..5).
hand(p1, c(10, clubs)).
hand(p1, c(8, clubs)).
hand(p1, c(7, diamonds)).
hand(p1, c(5, hearts)).
hand(p1, c(6, hearts)).
hand(p2, c(2, clubs)).
hand(p2, c(5, clubs)).
hand(p2, c(9, clubs)).
hand(p2, c(2, diamonds)).
hand(p2, c(9, spades)).

play(p1, c(10, clubs), 1).
play(p2, c(2, clubs), 1).
play(p1, c(8, clubs), 2).
play(p2, c(9, clubs), 2).
play(p2, c(9, spades), 3).
play(p1, c(5, hearts), 3).
play(p2, c(5, clubs), 4).
play(p1, c(7, diamonds), 4).
play(p2, c(2, diamonds), 5).
play(p1, c(6, hearts), 5).

card(c(R, S)) :- rank(R), suit(S).
already_played(c(R, S), T2) :- time(T2), play(P, c(R, S), T), T < T2.
in_hand(P, c(R, S), T) :- hand(P, c(R, S)),
not already_played(c(R, S), T), time(T).
has_suit(P, S, T) :- in_hand(P, c(R, S), T).
leader(p1, 1).
leader(P, T+1) :- play(P, c(R, S), T), play(OP, c(OR, S), T), R > OR.
leader(P, T+1) :- play(P, c(R, S), T), play(OP, c(OR, OS), T),
S != OS, leader(P, T).
leader_played_suit(S, T) :- play(P, c(R, S), T), leader(P, T).

% SM
can_play(P, C, T) :- player(P), time(T), card(C), rule(0).
can_play(P, C, T) :- player(P), time(T), card(C), leader(P, T), rule(1).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), rule(2).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), is_suit(C, S), rule(3).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), is_suit(C, S),
in_hand(P, C, T), rule(4).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), is_suit(C, S),
not has_suit(P, S, T), rule(5).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), in_hand(P, C, T), rule(6).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), in_hand(P, C, T),
not has_suit(P, S, T), rule(7).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C), leader(P, T),
leader_played_suit(S, T), not has_suit(P, S, T),
rule(8).
can_play(P, C, T) :- player(P), time(T), card(C), leader(P, T),
in_hand(P, C, T), rule(9).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), rule(10).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), is_suit(C, S), rule(11).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), is_suit(C, S),
in_hand(P, C, T), rule(12).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), is_suit(C, S),
in_hand(P, C, T), not has_suit(P, S, T), rule(13).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), is_suit(C, S),
not has_suit(P, S, T), rule(14).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), in_hand(P, C, T),
rule(15).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), in_hand(P, C, T),
not has_suit(P, S, T), rule(16).
can_play(P, C, T) :- player(P), suit(S), time(T), card(C),
leader_played_suit(S, T), not has_suit(P, S, T),
rule(17).
can_play(P, C, T) :- player(P), time(T), card(C), in_hand(P, C, T),
rule(18).


#minimise [
rule(0)=1, rule(1)=2, rule(2)=3, rule(3)=4, rule(4)=5, rule(5)=5, rule(6)=4,
rule(7)=5, rule(8)=4, rule(9)=3, rule(10)=2, rule(11)=3, rule(12)=4,
rule(13)=5, rule(14)=4, rule(15)=3, rule(16)=4, rule(17)=3, rule(18)=2
].
{ rule(0..18) }.
:- not goal.
goal :-
can_play(p1, c(10, clubs), 1), can_play(p1, c(8, clubs), 1),
can_play(p1, c(7, diamonds), 1), can_play(p1, c(5, hearts), 1),
can_play(p1, c(7, diamonds), 3), can_play(p1, c(6, hearts), 3),
can_play(p1, c(6, hearts), 4), can_play(p1, c(7, diamonds), 4),
can_play(p1,c(6, hearts), 1), not can_play(p2, c(2, diamonds), 1),
not can_play(p2, c(9, spades), 1), can_play(p2, c(2, clubs), 1),
not can_play(p2, c(8, clubs), 1), not can_play(p2, c(10, clubs), 1),
not can_play(p1, c(2, diamonds), 1), can_play(p1, c(5, hearts), 3),
not can_play(p1, c(10, clubs), 3).

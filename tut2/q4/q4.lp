% Background Knowledge
player(p1).
player(p2).
rank(1..10).
suit(clubs).
suit(diamonds).
suit(hearts).
suit(spades).
is_suit(c(R, S), S):- rank(R), suit(S).
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

card(c(R, S)):- rank(R), suit(S).
already_played(c(R, S), T2):- time(T2), play(P, c(R, S), T), T < T2.
in_hand(P, c(R, S), T):- hand(P, c(R, S)),
not already_played(c(R, S), T), time(T).
has_suit(P, S, T):- in_hand(P, c(R, S), T).
leader(p1, 1).
leader(P, T + 1):- play(P, c(R, S), T), play(OP, c(OR, S), T), R > OR.
leader(P, T + 1):- play(P, c(R, S), T), play(OP, c(OR, OS), T),
S != OS, leader(P, T).
leader_played_suit(S, T):- play(P, c(R, S), T), leader(P).


% L = 0
can_play(P, C, T):- rule(0), player(P), card(C), time(T).
% L = 1
can_play(P, C, T):- rule(1), player(P), card(C), time(T), in_hand(P, C, T).
can_play(P, C, T):- rule(2), player(P), card(C), time(T), leader_played_suit(S, T).
can_play(P, C, T):- rule(3), player(P), card(C), time(T), leader(P, T).
% L = 2
can_play(P, C, T):- rule(4), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T).
can_play(P, C, T):- rule(5), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader_played_suit(S, T).
can_play(P, C, T):- rule(6), player(P), card(C), time(T), suit(S), leader_played_suit(S, T), in_hand(P, C, T).
can_play(P, C, T):- rule(7), player(P), card(C), time(T), in_hand(P, C, T), leader(P, T).
can_play(P, C, T):- rule(8), player(P), card(C), time(T), leader_played_suit(S, T), is_suit(C, S).
% L = 3
can_play(P, C, T):- rule(9), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), in_hand(P, C, T), leader_played_suit(S, T).
can_play(P, C, T):- rule(10), player(P), card(C), time(T), suit(S), leader_played_suit(S, T), is_suit(C, S), in_hand(P, C, T).
can_play(P, C, T):- rule(11), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader(P, T), leader_played_suit(S, T).
can_play(P, C, T):- rule(12), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader_played_suit(S, T), is_suit(C, S).
can_play(P, C, T):- rule(13), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), in_hand(P, C, T).
can_play(P, C, T):- rule(14), player(P), card(C), time(T), suit(S), leader(P, T), is_suit(C, S), leader_played_suit(S, T).

% L = 4
can_play(P, C, T):- rule(15), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), is_suit(C, S), in_hand(P, C, T).
can_play(P, C, T):- rule(16), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), is_suit(C, S), not has_suit(P, S, T).
can_play(P, C, T):- rule(17), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), in_hand(P, C, T), not has_suit(P, S, T).
can_play(P, C, T):- rule(18), player(P), card(C), time(T), suit(S), leader_played_suit(S, T), is_suit(C, S), in_hand(P, C, T), not has_suit(P, S, T).

{rule(0..18)}.

goal:-  can_play(p1, c(10, clubs), 1),
        can_play(p1, c(8, clubs), 1),
        can_play(p1, c(7, diamonds), 1),
        can_play(p1, c(5, hearts), 1),
        can_play(p1, c(6, hearts), 1),
        can_play(p2, c(2, clubs), 1),
        can_play(p1, c(7, diamonds), 3),
        can_play(p1, c(6, hearts), 3),
        can_play(p1, c(6, hearts), 4),
        can_play(p1, c(7, diamonds), 4),
        can_play(p1, c(5, hearts), 3),
        not can_play(p2, c(2, diamonds), 1),
        not can_play(p2, c(9, spades), 1),
        not can_play(p2, c(8, clubs), 1),
        not can_play(p2, c(10, clubs), 1),
        not can_play(p1, c(2, diamonds), 1),
        not can_play(p1, c(10, clubs), 3).

:- not goal.


#minimize [
 rule(0)=1,
 rule(1)=2,
 rule(2)=2,
 rule(3)=2,
 rule(4)=3,
 rule(5)=3,
 rule(6)=3,
 rule(7)=3,
 rule(8)=3,
 rule(9)=4,
 rule(10)=4,
 rule(11)=4,
 rule(12)=4,
 rule(13)=4,
 rule(14)=4,
 rule(15)=5,
 rule(16)=5,
 rule(17)=5,
 rule(18)=5].




% L = 0
% can_play(P, C, T):- player(P), card(C), time(T), rule(0).
% L = 1
% WRONG can_play(P, C, T):- rule(1), player(P), card(C), time(T), suit(S), not has_suit(P, S, T).
% can_play(P, C, T):- rule(2), player(P), card(C), time(T), in_hand(P, C, T).
% MISSED can_play(P, C, T):- rule(2), player(P), card(C), time(T), leader_played_suit(S, T).
% can_play(P, C, T):- rule(3), player(P), card(C), time(T), leader(P, T).
% WRONG can_play(P, C, T):- rule(4), player(P), card(C), time(T), is_suit(C, S).
% L = 2
% MISSED can_play(P, C, T):- rule(5), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T).
% WRONG can_play(P, C, T):- rule(5), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), in_hand(P, C, T).
% WRONG can_play(P, C, T):- rule(6), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader(P, T).
% can_play(P, C, T):- rule(7), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader_played_suit(S, T).
% MISSED can_play(P, C, T):- rule(7), player(P), card(C), time(T), suit(S), leader_played_suit(S, T), in_hand(P, C, T).
% WRONG can_play(P, C, T):- rule(8), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), is_suit(C, S).
% can_play(P, C, T):- rule(9), player(P), card(C), time(T), in_hand(P, C, T), leader(P, T).
% WRONG can_play(P, C, T):- rule(10), player(P), card(C), time(T), in_hand(P, C, T), is_suit(C, S).
% MISSED can_play(P, C, T):- rule(10), player(P), card(C), time(T), leader_played_suit(S, T), is_suit(C, S).
% WRONG can_play(P, C, T):- rule(11), player(P), card(C), time(T), leader(P, T), is_suit(C, S).
% L = 3
% WRONG can_play(P, C, T):- rule(12), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), in_hand(P, C, T), leader(P, T).
% can_play(P, C, T):- rule(13), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), in_hand(P, C, T), leader_played_suit(S, T).
% WRONG can_play(P, C, T):- rule(14), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), in_hand(P, C, T), is_suit(C, S).
% MISSED can_play(P, C, T):- rule(17), player(P), card(C), time(T), suit(S), leader_played_suit(S, T), is_suit(C, S), in_hand(P, C, T).
% can_play(P, C, T):- rule(15), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader(P, T), leader_played_suit(S, T).
% WRONG can_play(P, C, T):- rule(16), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader(P, T), is_suit(C, S).
% can_play(P, C, T):- rule(17), player(P), card(C), time(T), suit(S), not has_suit(P, S, T), leader_played_suit(S, T), is_suit(C, S).
% WRONG can_play(P, C, T):- rule(18), player(P), card(C), time(T), suit(S), in_hand(P, C, T), leader(P, T), is_suit(C, S).
% MISSED can_play(P, C, T):- rule(18), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), in_hand(P, C, T).
% can_play(P, C, T):- rule(19), player(P), card(C), time(T), suit(S), leader(P, T), is_suit(C, S), leader_played_suit(S, T).

% L = 4
% MISSED can_play(P, C, T):- rule(13), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), is_suit(C, S), in_hand(P, C, T).
% MISSED can_play(P, C, T):- rule(13), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), is_suit(C, S), not has_suit(P, S, T).
% MISSED can_play(P, C, T):- rule(18), player(P), card(C), time(T), suit(S), leader(P, T), leader_played_suit(S, T), in_hand(P, C, T), not has_suit(P, S, T).
% MISSED can_play(P, C, T):- rule(18), player(P), card(C), time(T), suit(S), leader_played_suit(S, T), is_suit(C, S), in_hand(P, C, T), not has_suit(P, S, T).

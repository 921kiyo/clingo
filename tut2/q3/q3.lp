
% Background Knowledge
time(0..10).
next_time(X,X + 1):- time(X), time(X + 1).
holding(ball,0).
drop(ball,1).
drop(ball,7).
pick_up(apple,0).
pick_up(apple,1).
pick_up(apple,2).
object(apple).
object(ball).
arms_full(T):- holding(O,T).


% Skeleton rules
% L = 0
holding(O, T):- object(O), time(T), rule(1).

% L = 1
holding(O, T):- object(O), time(T), holding(O, T), rule(2).
holding(O, T):- object(O), time(T), not arm_full(T).
holding(O, T):- object(O), time(T),time(T2) next_time(T, T2).
holding(O, T):- object(O), time(T), pick_up(O, T).
holding(O, T):- object(O), time(T), not drop(O, T).


% L = 2
holding(O, T):- object(O), time(T), holding(O, T), not arm_full(T).
holding(O, T):- object(O), time(T), time(T2), holding(O, T), next_time(T, T2).
holding(O, T):- object(O), time(T), holding(O, T), pick_up(O, T).
holding(O, T):- object(O), time(T), holding(O, T), not drop(O, T).

holding(O, T):- object(O), time(T), time(T2), not arm_full(T), next_time(T, T2).
holding(O, T):- object(O), time(T), not arm_full(T), pick_up(O, T).
holding(O, T):- object(O), time(T), not arm_full(T), not drop(O, T).

holding(O, T):- object(O), time(T), time(T2), next_time(T, T2), pick_up(O, T).
holding(O, T):- object(O), time(T), time(T2), next_time(T, T2), not drop(O, T).

holding(O, T):- object(O), time(T), pick_up(O, T), not drop(O, T).

% L = 3
holding(O, T):- object(O), time(T), time(T2), holding(O, T), not arm_full(T), next_time(T, T2).
holding(O, T):- object(O), time(T), holding(O, T), not arm_full(T), pick_up(O, T).
holding(O, T):- object(O), time(T), holding(O, T), not arm_full(T), not drop(O, T).

holding(O, T):- object(O), time(T), time(T2), not arm_full(T), next_time(T, T2), pick_up(O, T).
holding(O, T):- object(O), time(T), time(T2), not arm_full(T), next_time(T, T2), not drop(O, T).

holding(O, T):- object(O), time(T), time(T2), next_time(T, T2), pick_up(O, T), not drop(O, T).

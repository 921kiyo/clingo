p :- not q.
q :- not p.
#pos({q}, {r}).
#pos({q, r}, {}).
#pos({p}, {}).
#neg({}, {p, r}).
#modeh(1, p). #modeh(1, q).
#modeh(1, r). #modeh(1, s).
#modeb(1, p). #modeb(1, q).
#modeb(1, r). #modeb(1, s).

parent(mike, mark).
parent(sue, mark).
parent(howell, sue).
parent(norma, sue).

ancestor(mike, mark).
ancestor(sue, mark).
ancestor(howell, mark).
ancestor(norma, mark).
ancestor(howell, sue).
not ancestor(mark, mike).

modeh(1, ancestor(var(any), var(any))).
modeb(1, ancestor(var(any), var(any))).
modeb(1, parent(var(any), var(any))).

maxv(3).

parent(mike, mark).
parent(sue, mark).
parent(howell, sue).
parent(norma, sue).

#pos(ancestor(mike, mark)).
#pos(ancestor(sue, mark)).
#pos(ancestor(howell, mark)).
#pos(ancestor(norma, mark)).
#pos(ancestor(howell, sue)).
#neg(ancestor(mark, mike)).

#modeh(1, ancestor(var(any), var(any))).
#modeb(1, ancestor(var(any), var(any))).
#modeb(1, parent(var(any), var(any))).

wobblyWheel:- brokenSpokes.
wobblyWheel:- flatTyre.
flatTyre:- leakyValve.
flatTyre:- puncturedTube.

:- puncturedTube, leakyValve.
:- not wobblyWheel.

0{brokenSpokes, puncturedTube, leakyValve}3.

#minimize[brokenSpokes=1, puncturedTube=1, leakyValve=1].

carDoesNotStart(X) :- batteryFlat(X).
carDoesNotStart(X) :- hasNoFuel(X).
lightsGoOn(mycar).
fuelIndicatorEmpty(mycar).

{batteryFlat(mycar), batteryFlat(yourcar), hasNoFuel(mycar), hasNoFuel(yourcar), brokenIndicator(mycar), brokenIndicator(yourcar)}.

:- batteryFlat(X), lightsGoOn(X).
:- hasNoFuel(X), not fuelIndicatorEmpty(X), not brokenIndicator(X).

:- not carDoesNotStart(mycar).
:- not carDoesNotStart(yourcar).

#minimize [batteryFlat(mycar)=1, batteryFlat(yourcar)=1, hasNoFuel(mycar)=1, hasNoFuel(yourcar)=1, brokenIndicator(mycar)=1, brokenIndicator(yourcar)=1].

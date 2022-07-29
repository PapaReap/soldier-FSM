params["_man", "_hidePos", "_enemyVehicle"];
private _battleKey   = [_man, "currentBattle"] call SFSM_fnc_unitData;
private _battleField = SFSM_battles get _battleKey;
private _timer       = time + 60;

private _script = [_man, _battleField, _timer] spawn SFSM_fnc_initHideFromVeh;
waitUntil{sleep 0.1; scriptDone _script};


if(isNil "_battleField")					exitWith{"cannot hide, battle ended" call dbgmsg};
if([_enemyVehicle]call Tcore_fnc_deadCrew)	exitWith{"won't hide, vehicle is not operational" call dbgmsg};
if(!alive _man)					            exitWith{"cannot hide, man died" call dbgmsg};
if(time > _timer)					        exitWith{"cannot hide, timed out" call dbgmsg};


[_man, _hidePos, _enemyVehicle] spawn SFSM_fnc_moveToHidePos; 

true;
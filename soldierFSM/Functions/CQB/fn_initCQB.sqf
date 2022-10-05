params ["_man"];
private _action = [_man, "action"] call SFSM_fnc_unitData;
private _canDodge = [_man, true] call SFSM_fnc_canDodge;
if(_action != "none")exitWith{false;};

if!(_canDodge)exitWith{false;};

private   _target = getAttackTarget _man;
if(!alive _target)then{_target = _man findNearestEnemy _man;};
if(!alive _target)exitWith{false;};

if(_man distance2D _target > SFSM_CQBdistance)exitWith{false;};

private _targetHouse = [_target] call SFSM_fnc_currentBuilding;
if(isNil "_targetHouse")exitWith{false;};

private _houseFull = [_man, _targetHouse] call SFSM_fnc_CQBlimitReached;

if(_houseFull)exitWith{'House is already being cleared' call dbgmsg; false;};

_man doFire _target;
[_man, _targetHouse, _target] spawn SFSM_fnc_ClearBuilding;
true;
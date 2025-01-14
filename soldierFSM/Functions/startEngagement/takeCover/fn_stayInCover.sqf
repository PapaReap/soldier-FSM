params["_man", "_endPos"];
private _timer = time + SFSM_stayCoverPosTime;
private _stayInCover = true;
private _hitByBullet = false;
private _overrun     = false;

//disable some ai, and update state
_man disableAI "PATH";
[_man, "pathEnabeled", false]	call SFSM_fnc_unitData;
[_man, "action", "Holding cover position"]	call SFSM_fnc_unitData;
_man setCombatBehaviour "STEALTH";

while {sleep 0.5; _stayInCover} do {
	private _timedOut         = time > _timer;
	private _timeSinceLastHit = time - ([_man, "Last_Hit"]	call SFSM_fnc_unitData);
	        _hitByBullet      = (_timeSinceLastHit < 1.1 && SFSM_breakCoverOnHit);
	        _overrun          = !isNull ([_man] call SFSM_fnc_manOverrunBy);
	

	if(_timedOut 
	|| _hitByBullet
	|| _overrun)
	then{_stayInCover = false};
};

[_man, _endPos, _hitByBullet, _overrun]call SFSM_fnc_endStayInCover;


true;
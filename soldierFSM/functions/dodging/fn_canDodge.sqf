params ["_man"];
private _dodgeTimer 	= [_man, "dodgeTimer"] 		call SFSM_fnc_unitData;
private _flinching 	 	= [_man, "flinching"] 	 	call SFSM_fnc_unitData;
private _dodging 		= [_man, "dodging"] 		call SFSM_fnc_unitData;
private _rps			= [_man, "roundsPrSecond"] 	call SFSM_fnc_unitData;

private _coolDown		= _dodgeTimer < time;
private _lowSuppression	= getSuppression _man < SFSM_ProneTreshHold;
private _highRPS		= _rps > SFSM_RpsDodgeTrigger;

(_coolDown
&&{(!(_flinching))
&&{(!(_dodging))
&&{_lowSuppression
&&{_highRPS}}}})
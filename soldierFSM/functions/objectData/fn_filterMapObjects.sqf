private __includeAll = false;
params["_terrainObjects", "_includeAll"];
// private _allTypes = [];
private _approvedObjects = [];

//delete mapObjects that are hidden, from the array.
_terrainObjects deleteAt (_terrainObjects findIf {isObjectHidden _x});

{
	private _excluded = [_x] call SFSM_fnc_excludedMapObject;
	
	if!(_excluded)
	then{
			private _nearest  = [_X, _approvedObjects] call Tcore_fnc_nearestPos;
			private _found    = !(typeName _nearest == "SCALAR");
			private _distance = 3;

			if(_found)then{_distance = _nearest distance2D _x};
			
			private _push = (_distance > 1 or _includeAll);

			if(_push)
			then{_approvedObjects pushBackUnique _x};
		};
	
}forEach _terrainObjects;

// copyToClipboard str _allTypes;
// [["objectTypes: ", (count _allTypes)]] call Tcore_fnc_debugMessage;

_approvedObjects
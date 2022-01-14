/*

Another quick and (not so) dirty function to launch a mechanized infantry assault
Place 2 markers in Eden (parameter 0 of the function): 
- First one : area marker in which the infantry group is unloaded.
- Second one : destination WP : group leader is ordered to seek and destroy in the area (SAD Wp type)

Parameters :
0: ARRAY : ["mrkName", "mrkName"]. Cf. supra
1: OBJECT group : infantry group
2: OBJECT vehicle : vehicle for the infantery

Returns :
ARRAY#0 : group
ARRAY#1 : vehicle

*/

params [
	["_tbWP",[]],
	"_grpInf",
	"_veh",
	["_condition", true]
];

/* Test only
_tbWP = [getMarkerpos "mrkSpMeca_1",getMarkerpos "mrkWpMeca_1_1", getMarkerpos "mrkWpMeca_1_2"];
_side = opfor;
_grpInfMeca = ["rhs_vmf_flora_junior_sergeant","rhs_vmf_flora_machinegunner","rhs_vmf_flora_machinegunner_assistant","rhs_vmf_flora_LAT"];
_clsVeh = "rhs_btr80_vdv";
_vehHeading = 230;
*/

_grpInf setVariable ["conditionGo", _condition];

waitUntil {
	sleep 5;
	_condition = _grpInf getVariable "conditionGo";
	systemChat format ["Groupe:%1 | condition:%2", _grpInf, _condition];
	_condition;
};

//On fait embarquer le groupe d'infanterie dans le méca
{[_x] orderGetIn true} forEach (units _grpInf);

//On déplace le groupe sur le marqeur d'unload. 
_unloadPos = getMarkerPos (_tbWP#0);
_wpUnload = _grpInf addWaypoint [_unloadPos, -1];
_wpUnload setWaypointBehaviour "SAFE";
_wpUnload setWaypointType "UNLOAD";
_wpUnload setWaypointStatements ["true","[(group this)] spawn {params['_grp'];while {true} do {assignedVehicle leader _grp doFollow leader _grp;_grp setVariable ['PLUTO_ORDER','QRF'];sleep 20;}}"];

//On envoie le groupe méca sur le dernier WP
_wpDest = _grpInf addWaypoint [getMarkerPos (_tbWP#1), -1];
_wpDest setWaypointBehaviour "AWARE";
_wpDest setWaypointType "SAD";

(_veh) addEventHandler ["FiredNear", {
	params ["_unit"];
	private _group = group _unit;
	_group setBehaviour "COMBAT";
	for "_i" from count waypoints _group - 1 to 0 step -1 do
	{
		deleteWaypoint [_group, _i];
	};
}];

[_grpInf,_veh]
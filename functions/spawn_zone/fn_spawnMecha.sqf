params [
	["_markerSp",[]],
	["_side",opfor],
	["_grpInf",["rhs_vmf_flora_junior_sergeant","rhs_vmf_flora_machinegunner","rhs_vmf_flora_machinegunner_assistant","rhs_vmf_flora_LAT"]],
	["_clsVeh", "rhs_btr80_vdv"]
];

_vehHeading = markerDir _markerSp;
_grp = [getMarkerPos _markerSp, _side, _grpInf] call GDC_fnc_lucySpawnGroupInf; 
_tbVeh = [getMarkerPos _markerSp, _vehHeading, _clsVeh, _grp] call BIS_fnc_spawnVehicle;

[_grp,_tbVeh#0]
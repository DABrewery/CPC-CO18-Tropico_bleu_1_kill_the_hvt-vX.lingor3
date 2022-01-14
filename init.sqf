//Récupère la liste de tous les marqueurs LUCY pour les masquer et les blacklister pour GDC_fnc_chooseSpawnPos
private _tbMrk = allMapMarkers select {["mrk", _x, true] call BIS_fnc_inString};

//Masque les marqueurs
{_x setMarkerAlpha 0.0} forEach _tbMrk;

//LUCY (-> lancé dans l'init.sqf)
[2,"mkr_spawn_static_unit",true,600.0,false,3600.0,true,true,"COLONEL"] call GDC_fnc_lucyInit;

//spawn sur whitelist
/*
private _spawnBlackList = ["marker_1", "marker_2"];
private _spawnWhiteList = ["spawn_ok_1", "spawn_ok_2", "spawn_ok_3", "spawn_ok_4", "spawn_ok_5"];

["marker_spawn", nil, "LIEUTENANT", _spawnBlackList, 0, 5, 1, _spawnWhiteList] call int_fnc_chooseSpawnPos;
*/

//Lance le briefing
execVM "briefing.sqf";

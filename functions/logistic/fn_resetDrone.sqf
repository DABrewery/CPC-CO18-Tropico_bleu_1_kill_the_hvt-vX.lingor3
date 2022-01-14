/* simple drone "replacement" */

params [
	"_drone"
];

//On choppe la position et la direction du drone à reset et son class name
private _pos = getPos _drone;
private _dir = getDir _drone;
private _clsName = typeOf _drone;

//On choppe l'armement en place sur chaque pylone
private _pylones = getPylonMagazines _drone;

//On supprime le drone
deleteVehicle _drone;

//On respawn le même drone
_newDrone = createVehicle [_clsName, _pos, [], 0, "CAN_COLLIDE"];
_newDrone setDir _dir;
createVehicleCrew _newDrone;

//On remet l'armement précédent sur le nouveau drone
for "_i" from 1 to count _pylones do {
	_newdrone setPylonLoadOut [_i, _pylones select _i]
};


//Le nom de la zone qui sera utilisé pour tous les spawns 
private _zn = "10";
private _grpGarn = objNull;
private _nbPat = objNull;
private _probaManedFW = objNull;

switch true do {
		case (nbJoueurs < 15): {
			//
			_grpGarn = GROUPE_ENI_1_PETIT;
			//
			_nbPat = [1,2];
			// 
			_probaManedFW = 0.8;
		};
		case (nbJoueurs > 14): {
			//
			_grpGarn = GROUPE_ENI_1_PETIT;
			//
			_nbPat = [2,3];
			// 
			_probaManedFW = 1;
		};
};

//Spawn des patrouilles
[_zn, _nbPat, GROUPE_ENI_1_PETIT, resistance] spawn int_fnc_spawnRdmPatrols;

//Spawn des garnisons
//[_zn, _grpGarn, opfor, nil, nil, 0.1, 1] spawn int_fnc_spawnGarnisons;

//Spawn des armes fixes
//[_zn, opfor, "O_MU_IS_HMG_02_high", "O_MU_islam_R1_F", 1, _probaManedFW, 0.8] spawn int_fnc_spawnFixedWeapons;
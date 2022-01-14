//Le nom de la zone qui sera utilisé pour tous les spawns 
private _zn = "1";
private _grpGarn = objNull;
private _nbPat = objNull;
private _probaManedFW = objNull;

switch true do {
		case (nbJoueurs < 15): {
			//
			_grpGarn = GROUPE_ENI_1_PETIT;
			//
			_nbPat = [1];
			// 
			_probaManedFW = 0.8;
		};
		case (nbJoueurs > 14): {
			//
			_grpGarn = GROUPE_ENI_1_PETIT;
			//
			_nbPat = [2];
			// 
			_probaManedFW = 1;
		};
};

//Spawn des patrouilles
//[_zn, _nbPat, GROUPE_ENI_1_PETIT, opfor] spawn int_fnc_spawnRdmPatrols;

//Spawn des garnisons
[_zn, _grpGarn, resistance, nil, nil, 0.1, 1] spawn int_fnc_spawnGarnisons;

//Spawn des armes fixes
[_zn, resistance, "CPC_LAT_I_PIC_ZU23", "CPC_LAT_I_PIC_soldier_2", 1, _probaManedFW, 0.8] spawn int_fnc_spawnFixedWeapons;
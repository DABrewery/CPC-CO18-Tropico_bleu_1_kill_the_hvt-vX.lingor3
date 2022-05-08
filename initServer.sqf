//PLUTO Opfor
[
	resistance,		        //0 camp
	[1000,3000,6000],	//1 revealRange [man,land,air]
	[1500,3000,3000],	//2 sensorRange [man,land,air]
	120,			    //3 QRFtimeout
	[2000,2000,6000],	//4 QRFrange [man,land,air]
	[60,90,120],		//5 QRFdelay [min,mid,max]
	240,			    //6 ARTYtimeout
	[20,30,60],		    //7 ARTYdelay [min,mid,max]
	[1,2,4],		    //8 ARTYrounds [min,mid,max]
	[0,40,100]		    //9 ARTYerror [min,mid,max]
] call GDC_fnc_pluto;

gdc_plutoDebug = false;

//Get number of players to allow dynamic ENI units number adaptation
nbJoueurs = count (playableUnits + (switchableUnits select {_x != HC_Slot}));

/*******************************************/
/*         IA GROUP DEF                    */
/*******************************************/
/* Group definition */

	private _fsl_ENI_1    = "CPC_LAT_I_PIC_soldier_2";
	private _fsl_1_ENI_1    = "CPC_LAT_I_PIC_soldier_3";
	private _fsl_2_ENI_1    = "CPC_LAT_I_PIC_soldier_AR";
	private _gl_ENI_1     = "CPC_LAT_I_PIC_soldier_GL";
	private _mg_ENI_1     = "CPC_LAT_I_PIC_soldier_MG";
	private _tl_ENI_1     = "CPC_LAT_I_PIC_soldier_TL";
	private _off_ENI_1     = "CPC_LAT_I_PIC_soldier_Officer";

//2 à 4
GROUPE_ENI_1_PETIT = [
	[_gl_ENI_1, _fsl_ENI_1],
	[_tl_ENI_1, _fsl_ENI_1, _fsl_1_ENI_1],
	[_tl_ENI_1, _fsl_1_ENI_1, _mg_ENI_1],
	[_tl_ENI_1, _mg_ENI_1, _fsl_ENI_1, _fsl_2_ENI_1],
	[_off_ENI_1, _fsl_2_ENI_1, _fsl_ENI_1, _gl_ENI_1]
];
//7 à 9
GROUPE_ENI_1_MOYEN = [
	[_off_ENI_1, _tl_ENI_1, _gl_ENI_1, _fsl_ENI_1, _fsl_2_ENI_1, _fsl_ENI_1, _mg_ENI_1],
	[_tl_ENI_1, _fsl_2_ENI_1, _fsl_1_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _fsl_ENI_1, _gl_ENI_1],
	[_tl_ENI_1, _gl_ENI_1, _fsl_1_ENI_1, _fsl_1_ENI_1, _fsl_ENI_1, _mg_ENI_1, _fsl_2_ENI_1, _fsl_2_ENI_1],
	[_tl_ENI_1, _fsl_2_ENI_1, _fsl_1_ENI_1, _gl_ENI_1, _fsl_ENI_1, _fsl_1_ENI_1, _mg_ENI_1, _fsl_1_ENI_1, _fsl_ENI_1]
];

/*******************************************/
/*        ENI Spawn                        */
/*******************************************/

//Les camps

execVM "spawn_IA\spawnZ0.sqf";
execVM "spawn_IA\spawnZ1.sqf";
execVM "spawn_IA\spawnZ10.sqf";
execVM "spawn_IA\spawnZA.sqf";
execVM "spawn_IA\spawnZB.sqf";


/*******************************************/
/*                WEATHER                  */
/*******************************************/
//[0, [0.7, -0.5, 70]] remoteExecCall ["setFog", 2];

0 setFog [0.7, -0.5, 70];

[]spawn {
	waituntil  {time > 1800};
	300 setFog [0, 0, 0];
};

/*
//Spawn des mécas
private _side = opfor;
private _clsVeh = "CUP_O_BTR80A_CAMO_RU";


//BTR 1 -> Radar
private _mrkSp = "mrkSpMecha_1";
_tbMecha = [_mrkSp, _side, selectRandom GROUPE_ENI_2_MOYEN, _clsVeh] call int_fnc_spawnMecha;
[["mrkUnloadMecha_1", "mrkSAD_1"], _tbMecha#0, (vehicle leader (_tbMecha#0))] execVM "functions\spawn_zone\fn_assaultMecha.sqf";

//BTR 2 et 3 -> Zelenogorsk
_mrkSp = "mrkSpMecha_2";
_tbMecha = [_mrkSp, _side, selectRandom GROUPE_ENI_2_MOYEN, _clsVeh] call int_fnc_spawnMecha;
[["mrkUnloadMecha_2", "mrkSAD_2"], _tbMecha#0, (vehicle leader (_tbMecha#0))] execVM "functions\spawn_zone\fn_assaultMecha.sqf";
_mrkSp = "mrkSpMecha_3";
_tbMecha = [_mrkSp, _side, selectRandom GROUPE_ENI_2_MOYEN, _clsVeh] call int_fnc_spawnMecha;
[["mrkUnloadMecha_3", "mrkSAD_2"], _tbMecha#0, (vehicle leader (_tbMecha#0))] execVM "functions\spawn_zone\fn_assaultMecha.sqf";

//BTR 4 -> Antenne
goAssautAntenne = false;
_mrkSp = "mrkSpMecha_4";
_tbMecha = [_mrkSp, _side, selectRandom GROUPE_ENI_2_MOYEN, _clsVeh] call int_fnc_spawnMecha;
[["mrkUnloadMecha_4", "mrkSAD_3"], _tbMecha#0, (vehicle leader (_tbMecha#0)), goAssautAntenne] execVM "functions\spawn_zone\fn_assaultMecha.sqf";

//["PylonRack_3Rnd_LG_scalpel","PylonRack_12Rnd_PG_missiles","PylonRack_12Rnd_PG_missiles","PylonRack_3Rnd_LG_scalpel"]
*/
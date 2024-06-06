// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description This function is a constructor for the CharacterData object.
/// @param {string}							_NAME				-	The name of the character.
/// @param {string}							_DESCRIPTION		-	The description of the character.
/// @param {string}							_SERIES				-	The series the character belongs to.
/// @param {string}							_TYPE					-	The type or category of the character.
/// @param {array<struct.MovesetData>}	_MOVES				-	An array of moves for the character.
/// @param {struct}							_SPRITES				-	An object containing the character's sprites.
/// @param {struct}							_SEQUENCES				-	An object containing the character's sequences.
/// @param {string}							_VA					-	The voice actor of the character.
/// @param {string}							_RIVAL				-	The rival character.
/// @param {string}							_FIRST_APPEARANCE	-	The first appearance of the character.
/// @param {string}							_ARCHETYPE			-	The archetype of the character.
function CharacterData(_NAME, _DESCRIPTION, _SERIES, _TYPE, _MOVES = [], _SPRITES = {},_SEQUENCES = {}, _VA = "N/A", _RIVAL = "N/A", _FIRST_APPEARANCE = "N/A", _ARCHETYPE = "N/A", _LOCKED = false) constructor{
	NAME					=   _NAME;
	DESCRIPTION			=   _DESCRIPTION;
	SERIES				=   _SERIES;
	TYPE					=	_TYPE;
	MOVES				=   _MOVES;
	SPRITES				=   _SPRITES;
	SEQUENCES				=   _SEQUENCES;
	VA						=	_VA
	RIVAL					=	_RIVAL
	FIRST_APPEARANCE	=	_FIRST_APPEARANCE
	ARCHETYPE			=	_ARCHETYPE
	LOCKED				=	_LOCKED

	static getNAME					=	function()						{	return NAME;										};
	static getDESCRIPTION			=	function()						{	return DESCRIPTION;								};
	static getSERIES				=	function()						{	return SERIES;										};
	static getTYPE					=	function()						{	return TYPE;										};
	static getMOVES				=	function()						{	return MOVES;										};
	static getMOVE					=	function(_i)						{	return MOVES[_i];									};
	static getSPRITES				=	function()						{	return SPRITES;									};
	static getSPRITE				=	function(_NAME)					{	return struct_get(SPRITES, _NAME);			};
	static getSEQUENCES				=	function()						{	return SEQUENCES;									};
	static getSEQUENCE				=	function(_NAME)					{	return struct_get(SEQUENCES, _NAME);			};
	static getVA						=	function()						{	return VA;											};
	static getRIVAL					=	function()						{	return RIVAL;										};
	static getFIRST_APPEARANCE	=	function()						{	return FIRST_APPEARANCE;						};
	static getARCHETYPE			=	function()						{	return ARCHETYPE;									};
	static getLOCKED				=	function()						{	return LOCKED;										};
					
	static getMOVESET_COUNT		=   function()						{	return array_length(MOVES);						};
					
	static setNAME					=	function(_NAME)					{	NAME					= _NAME						};
	static setDESCRIPTION			=	function(_DESCRIPTION)		{	DESCRIPTION			= _DESCRIPTION				};	
	static setSERIES				=	function(_SERIES)				{	SERIES				= _SERIES					};	
	static setMOVES				=	function(_MOVES)				{	MOVES				= _MOVES						};	
	static setMOVE					=	function(_MOVE)					{	MOVE					= _MOVE						};	
	static setSPRITES				=	function(_SPRITES)				{	SPRITES				= _SPRITES					};	
	static setSPRITE				=	function(_NAME,_SPRITE)		{	struct_set(SPRITES,_NAME,_SPRITE)				};	
	static setSEQUENCES				=	function(_SEQUENCES)				{	SPRITES				= _SEQUENCES					};	
	static setSEQUENCE				=	function(_NAME,_SEQUENCE)		{	struct_set(SPRITES,_NAME,_SEQUENCE)				};	
	static setVA						=	function(_VA)					{	VA						=	_VA;						};
	static setRIVAL					=	function(_RIVAL)				{	RIVAL					=	_RIVAL;					};
	static setFIRST_APPEARANCE	=	function(_FIRST_APPEARANCE)	{	FIRST_APPEARANCE	=	_FIRST_APPEARANCE;	};
	static setARCHETYPE			=	function(_ARCHETYPE)			{	ARCHETYPE			=	_ARCHETYPE;				};
	static setLOCKED				=	function(_LOCKED)				{	LOCKED				=	_LOCKED;					};
	
	static addMOVE					=	function(_MOVE)					{	array_push(MOVES, _MOVE);						};
	
	static unlock					=	function()						{	LOCKED				=	false						};
}
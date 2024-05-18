/// @desc This function is a constructor for the StageData object.
/// @param {string}			_NAME			The name of the stage.
/// @param {string}			_DESCRIPTION	The description of the stage.
/// @param {string}			_SERIES			The series the stage belongs to.
/// @param {asset.GMroom}	_ROOM			The game room associated with the stage.
function StageData(_NAME,_DESCRIPTION,_SERIES,_ROOM) constructor{
	NAME			=	_NAME		
	DESCRIPTION	=	_DESCRIPTION
	SERIES		=	_SERIES		
	ROOM			=	_ROOM		
	
	static getNAME			=	function()	{	return NAME			}
	static getDESCRIPTION	=	function()	{	return DESCRIPTION	}
	static getSERIES		=	function()	{	return SERIES			}
	static getROOM			=	function()	{	return ROOM			}
	
	static setNAME			=	function(_NAME)				{	NAME			=	_NAME			}
	static setDESCRIPTION	=	function(_DESCRIPTION)	{	DESCRIPTION	=	_DESCRIPTION	}
	static setSERIES		=	function(_SERIES)			{	SERIES		=	_SERIES			}
	static setROOM			=	function(_ROOM)				{	ROOM			=	_ROOM			}
}
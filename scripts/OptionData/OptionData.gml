/// @description Object that a describes an choice in the menu
/// @param {string}		NAME		
/// @param {string}		DESCRIPTION	
/// @param {function}	FUNCTION	
function OptionData(_NAME, _DESCRIPTION = "", _FUNCTION = function() {}) constructor {
	NAME		= _NAME	
	DESCRIPTION	= _DESCRIPTION
	FUNCTION	= _FUNCTION
	
	static getNAME			=	function()	{	return NAME			}
	static getDESCRIPTION	=	function()	{	return DESCRIPTION	}
	static getFUNCTION		=	function()	{	return FUNCTION		}
	
	static trigger	=	function()	{
		FUNCTION()
	}
}
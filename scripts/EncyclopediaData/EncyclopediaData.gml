// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EncyclopediaData(_TERM,_DEFINITION) constructor {
	TERM			=	_TERM;
	DEFINITION	=	_DEFINITION;
	
	static getTERM			=	function()	{	return TERM		}
	static getDEFINITION	=	function()	{	return DEFINITION	}
	
	static setTERM			=	function(_TERM)			{	TERM			=	_TERM		}
	static setDEFINITION	=	function(_DEFINITION)	{	DEFINITION	=	_DEFINITION	}
}

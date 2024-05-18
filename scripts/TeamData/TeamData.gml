// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function TeamData() constructor{	
	POINT_CHARACTER	=	-1
	MID_CHARACTER		=	-1
	ANCHOR_CHARACTER	=	-1
		
	static getPOINT_CHARACTER	=	function()	{	return POINT_CHARACTER	}
	static getMID_CHARACTER		=	function()	{	return MID_CHARACTER	}
	static getANCHOR_CHARACTER	=	function()	{	return ANCHOR_CHARACTER	}
	
	static setPOINT_CHARACTER	=	function(_POINT_CHARACTER)	{	POINT_CHARACTER	=	_POINT_CHARACTER	}
	static setMID_CHARACTER		=	function(_MID_CHARACTER)		{	MID_CHARACTER		=	_MID_CHARACTER	}
	static setANCHOR_CHARACTER	=	function(_ANCHOR_CHARACTER)	{	ANCHOR_CHARACTER	=	_ANCHOR_CHARACTER	}
}
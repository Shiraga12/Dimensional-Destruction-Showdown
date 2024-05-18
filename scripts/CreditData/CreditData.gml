// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Function Description
/// @param {string}			_OCCUPATION	Description
/// @param {array<string>}	_NAMES		Description
function CreditData(_OCCUPATION,_NAMES){
	OCCUPATION	=	_OCCUPATION	
	NAMES		=	_NAMES		
	
	static getOCCUPATION	=	function()	{	return OCCUPATION	}
	static getNAMES		=	function()	{	return NAMES		}
	
	static setOCCUPATION	=	function()	{	OCCUPATION	=	_OCCUPATION	}
	static setNAMES		=	function()	{	NAMES		=	_NAMES		}
	
	static toString			=	function()	{	
		var MEMBERS;
		for (var i = 0; i < array_length(NAMES); i++) {
			MEMBERS += "${NAMES[i]}\n"
		}
		return string($"{OCCUPATION}\n{MEMBERS}")
	}
}
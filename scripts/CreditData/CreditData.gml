// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Constructor for CreditData, which holds information about an occupation and its associated names.
/// @param {string}			_OCCUPATION	The occupation or role in the credits.
/// @param {array<string>|string}	_NAMES		An array of names associated with the occupation.
function CreditData(_OCCUPATION, _NAMES) constructor {
	OCCUPATION = _OCCUPATION;
	NAMES = _NAMES;
	
	static getOCCUPATION = function() {
		return OCCUPATION;
	};
	static getNAMES = function() {
		return NAMES;
	};

	static setOCCUPATION = function(_OCCUPATION) {
		OCCUPATION = _OCCUPATION;
	};
	static setNAMES = function(_NAMES) {
		NAMES = _NAMES;
	};

	static toString = function() {
		if is_array(NAMES) {
			var MEMBERS = "";
			for (var i = 0; i < array_length(NAMES); i++) {
				MEMBERS += string(NAMES[i]) + "\n";
			}
			return string(OCCUPATION + ":\n" + MEMBERS);
		}
		else {
			return string(OCCUPATION + ":\n" + NAMES);
		}
	};
}

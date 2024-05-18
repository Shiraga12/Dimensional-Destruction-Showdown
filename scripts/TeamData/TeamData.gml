// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @desc Constructor for TeamData, which holds information about a team in a 3v3 2D fighting game.
function TeamData() constructor {
	ORDER = [
		{ CHAR: -1, HP: 100 },
		{ CHAR: -1, HP: 100 },
		{ CHAR: -1, HP: 100 }
	];
	
	WINS = 0;
	LOSSES = 0;
	
	/// @desc Gets the character data at a specific position in the team.
	/// @param {number} index - The index of the character in the ORDER array (0 for POINT, 1 for MID, 2 for ANCHOR).
	static getCharacter = function(index) {
		return ORDER[index];
	};
	
	/// @desc Sets the character data at a specific position in the team.
	/// @param {number} index - The index of the character in the ORDER array (0 for POINT, 1 for MID, 2 for ANCHOR).
	/// @param {number} charIndex - The character index to set.
	/// @param {number} hp - The HP value to set for the character.
	static setCharacter = function(index, charIndex, hp = 100) {
		ORDER[index] = { CHAR: charIndex, HP: hp };
	};
	
	/// @desc Swaps two characters in the team.
	/// @param {number} index1 - The index of the first character in the ORDER array.
	/// @param {number} index2 - The index of the second character in the ORDER array.
	static swapCharacters = function(index1, index2) {
		var temp = ORDER[index1];
		ORDER[index1] = ORDER[index2];
		ORDER[index2] = temp;
	};
	
	/// @desc Gets the number of wins.
	static getWins = function() {
		return WINS;
	};
	
	/// @desc Gets the number of losses.
	static getLosses = function() {
		return LOSSES;
	};
	
	/// @desc Sets the number of wins.
	/// @param {number} wins - The number of wins to set.
	static setWins = function(wins) {
		WINS = wins;
	};
	
	/// @desc Sets the number of losses.
	/// @param {number} losses - The number of losses to set.
	static setLosses = function(losses) {
		LOSSES = losses;
	};
	
	/// @desc Increments the number of wins by 1.
	static addWin = function() {
		WINS += 1;
	};
	
	/// @desc Increments the number of losses by 1.
	static addLoss = function() {
		LOSSES += 1;
	};
	
	/// @desc Returns a string representation of the team's composition and record.
	static toString = function() {
		var teamString = "";
		for (var i = 0; i < array_length(ORDER); i++) {
			teamString += "Slot " + string(i+1) + ": " + string(ORDER[i].CHAR) + " (HP: " + string(ORDER[i].HP) + ")\n";
		}
		teamString += "Wins: " + string(WINS) + "\nLosses: " + string(LOSSES);
		return teamString;
	};
}
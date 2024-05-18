// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// @description This function is used to create a new instance of MovesetData.
/// @param {string} _NAME        -  The name of the move.
/// @param {string} _DESCRIPTION -  A brief description of the move.
/// @param {array}  _CONTROLS    -  An array of strings representing the controls required to perform the move.
function MovesetData(_NAME, _DESCRIPTION, _CONTROLS) constructor {
    NAME        = _NAME;
    DESCRIPTION = _DESCRIPTION;
    CONTROLS    = _CONTROLS;
    
    /// @description Returns the name of the move.
    /// @return {string} The name of the move.
    static getNAME = function() {
        return NAME;
    }
    /// @description Returns a brief description of the move.
    /// @return {string} A brief description of the move.
    static getDESCRIPTION = function() {
        return DESCRIPTION;
    }
    /// @description Returns an array of strings representing the controls required to perform the move.
    /// @return {array} An array of strings representing the controls.
    static getCONTROLS = function() {
        return CONTROLS;
    }
}

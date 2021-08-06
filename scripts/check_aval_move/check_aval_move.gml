/// @description check_aval_move(array, value);
/// @param array
/// @param value
function check_aval_move() {
	// Arguments
	var aval_moves = argument[0];
	var cur_move = argument[1];
	
	// Check for the value's presence in the given array
	for (var i = 0; i < array_length(aval_moves); i++) {
		// Store the i's move coordinates
		var cur_aval_move = aval_moves[i];
		
		// Compare it to the current move
		if (array_equals(cur_aval_move, cur_move)) return true;
	}
	return false;
}
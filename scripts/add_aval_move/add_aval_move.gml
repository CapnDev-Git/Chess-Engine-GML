/// @description add_aval_move(array, move);
/// @param array
/// @param move
function add_aval_move() {
	// Arguments
	var array = argument[0];
	var move = argument[1];
	
	// Return the array containing the newly added move if it is legal
	if (is_legal(move)) return array_insert(array, array_length(array), move);
	return false;
}
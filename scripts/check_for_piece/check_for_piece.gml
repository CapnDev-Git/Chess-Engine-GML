/// @description check_for_piece(xx, yy);
/// @param xx
/// @param yy
function check_for_piece() {
	// Arguments
	var xx = argument[0];
	var yy = argument[1];
	
	// Check for a piece at the given coordinates
	return instance_place(xx, yy, obj_piece_parent);
}
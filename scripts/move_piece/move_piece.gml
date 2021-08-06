/// @description move_piece(x, y, piece);
/// @param x
/// @param y
/// @param piece
function move_piece() {
	// Arguments
	var xx = argument[0];
	var yy = argument[1];
	var piece = argument[2];
	
	// Move the selected piece
	piece.x = xx;
	piece.y = yy;
		
	// Unselect the current selected piece
	unselect_piece();
		
	// Alternate turns
	global.white_to_play = !global.white_to_play;
	return true;
}
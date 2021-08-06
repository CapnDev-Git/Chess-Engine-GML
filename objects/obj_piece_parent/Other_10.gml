/// @description Move the selected piece / Update the current piece / Deselect the piece
// Move coordinates variables
var xx = (cur_square[0][0] - 1) * SQUARE_LENGTH;
var yy = (8 - cur_square[0][1]) * SQUARE_LENGTH;
var piece = instance_place(xx, yy, obj_piece_parent);

// Have we selected a piece already? (OTHERWISE, DO NOTHING)
if (array_length(cur_aval_sq) != 0) {
	// Is it in the available squares list?
	if (check_aval_move(cur_aval_sq, cur_square[0])) {
		// Remove any enemy pieces from the desired square
		if (piece != noone) {
			// Check for it being an enemy / ally piece
			if (piece.image_index != self.image_index) {
				// Since it's an enemy's, destroy the piece
				instance_destroy(piece);
				
				// Move the piece
				move_piece(xx, yy, self);
			} else {
				// Unselect the current piece
				unselect_piece();
			}
		} else {
			// Move the piece
			move_piece(xx, yy, self);
		}
	} else {
		// Unselect the current piece
		unselect_piece();
	}
}
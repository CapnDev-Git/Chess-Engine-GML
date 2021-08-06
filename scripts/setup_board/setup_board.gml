/// @description setup_board();
function setup_board() {
	// Create major pieces
	for (var i = 0; i < 2; i++) {
		create_piece(  0, i * 560, i, obj_rook);
		create_piece( 80, i * 560, i, obj_knight);
		create_piece(160, i * 560, i, obj_bishop);
		create_piece(240, i * 560, i, obj_queen);
		create_piece(320, i * 560, i, obj_king);
		create_piece(400, i * 560, i, obj_bishop);
		create_piece(480, i * 560, i, obj_knight);
		create_piece(560, i * 560, i, obj_rook);
	}

	// Create pawns
	for (var j = 0; j < 9; j++) {
		create_piece(j * 80, 80, 0, obj_pawn);
		create_piece(j * 80, 480, 1, obj_pawn);
	}
	
	return true;
}
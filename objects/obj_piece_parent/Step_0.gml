/// @description Control the pieces
// Check for the click
if (mouse_check_button_pressed(mb_left)) {
	// Refresh & get the (new) clicked square coordinates
	array_clear(cur_square);
	array_set(cur_square, array_length(cur_square), [ceil(mouse_x / 80), 9 - ceil(mouse_y / 80)]);

	// Have we clicked on a piece?
	if (point_in_rectangle(mouse_x, mouse_y, x, y, x + (SQUARE_LENGTH - 1), y + (SQUARE_LENGTH - 1))) {
		// Select the clicked piece
		draw_avsq = true;
		cur_piece_infos = get_piece_infos();
		cur_aval_sq = get_aval_squares(cur_piece_infos);
	} else {
		// Run the rest of the routine in another event to prevent errors
		event_user(0);
	}
}
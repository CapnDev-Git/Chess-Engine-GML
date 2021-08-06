/// @description Show available squares
// Draw all the pieces / inheritance
draw_self();

// Show available squares on the board
for (var i = 0; i < array_length(cur_aval_sq); i++) {
	// Calculate the position of the available squares
	var avsq_color = make_color_rgb(69, 140, 255);
	var xx = (cur_aval_sq[i][0] - 1) * SQUARE_LENGTH;
	var yy = (8 - cur_aval_sq[i][1]) * SQUARE_LENGTH;
		
	// Draw the available squares
	draw_set_alpha(.2);
	draw_set_color(avsq_color);
	if (draw_avsq) draw_rectangle(xx, yy, xx + (SQUARE_LENGTH - 1), yy + (SQUARE_LENGTH - 1), false);
}

/* DEBUG
draw_set_alpha(1);
draw_set_color(c_blue);
draw_set_font(fnt_DEBUG_pos);

draw_text_ext(25, 250, string(cur_square), 30, room_width - 25);
draw_text(25, 380, string(cur_piece_infos));
draw_text_ext(25, 410, string(cur_aval_sq), 30, room_width - 25);
*/
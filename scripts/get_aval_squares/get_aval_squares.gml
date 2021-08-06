/// @description get_aval_squares(piece_infos);
/// @param piece_infos
function get_aval_squares() {
	// Variables
	var infos = argument[0];
	var pos_x = infos[0][0];
	var pos_y = infos[0][1];
	var xx = (pos_x - 1) * SQUARE_LENGTH;
	var yy = (8 - pos_y) * SQUARE_LENGTH;
	var cur_piece = infos[1];
	var color = infos[3];
	var available_moves = [];	
	var saa_dir = [false, false, false, false, false, false, false, false]; // N, NE, E, SE, S, SW, W, NW
	var max_iteration = max(pos_x, 8 - pos_x) + 1;
	
	
	// Determine all the available squares patterns
	switch (cur_piece) {
		case "P": {
			#region  Piece detection array: N, NN, NW, NE
			var check_dir = [
				check_for_piece(xx, yy - (SQUARE_LENGTH * color)),
				check_for_piece(xx, yy - (2 * SQUARE_LENGTH * color)),
				check_for_piece(xx - (SQUARE_LENGTH * color), yy - (SQUARE_LENGTH * color)),
				check_for_piece(xx + (SQUARE_LENGTH * color), yy - (SQUARE_LENGTH * color))
			];
			#endregion

			// Calculate the pawn available squares
			if (((pos_y == 2 && color == 1) || (pos_y == 7 && color == -1))) {
				// Prevent from removing a piece
				if (check_dir[0] == noone && check_dir[1] == noone) {
					// Allow the pawn starting move possibility
					for (var i = 1; i < 3; i++) add_aval_move(available_moves, [pos_x, pos_y + (i * color)]);
				} else if (check_dir[0] == noone && check_dir[1] != noone) {
					// Assign the only available move 
					add_aval_move(available_moves, [pos_x, pos_y + color]);
				}
			} else {
				// Assign the only available move 
				add_aval_move(available_moves, [pos_x, pos_y + color]);
			}
			
			// Add diagonal take only if there's an enemy piece
			if (check_dir[2] != noone) add_aval_move(available_moves, [pos_x - color, pos_y + color]);
			if (check_dir[3] != noone) add_aval_move(available_moves, [pos_x + color, pos_y + color]);
			break;
		}
		case "N": {
			// Calculate the knight's available squares
			add_aval_move(available_moves, [pos_x + 1, pos_y + 2]);
			add_aval_move(available_moves, [pos_x + 1, pos_y - 2]);
			add_aval_move(available_moves, [pos_x - 1, pos_y + 2]);
			add_aval_move(available_moves, [pos_x - 1, pos_y - 2]);
			add_aval_move(available_moves, [pos_x + 2, pos_y + 1]);
			add_aval_move(available_moves, [pos_x + 2, pos_y - 1]);
			add_aval_move(available_moves, [pos_x - 2, pos_y + 1]);
			add_aval_move(available_moves, [pos_x - 2, pos_y - 1]);
			break;
		}
		case "B": {
			// Calculate the bishop's available squares
			for (var i = 1; i < max_iteration; i++) {
				// Vars
				var unit = SQUARE_LENGTH * i;
				#region Piece detection array: NE, NW, SE, SW
				var check_dir = [
					check_for_piece(xx + unit, yy - unit),
					check_for_piece(xx - unit, yy - unit),
					check_for_piece(xx + unit, yy + unit),
					check_for_piece(xx - unit, yy + unit)
				];
				#endregion
				
				// Add only valid available moves
				#region Add only valid available moves
				if (check_dir[0] != noone && !saa_dir[1]) { if (!compare_colors(color, check_dir[0].image_index)) { add_aval_move(available_moves, [pos_x + i, pos_y + i]); } saa_dir[1] = true; }
				if (check_dir[1] != noone && !saa_dir[7]) { if (!compare_colors(color, check_dir[1].image_index)) { add_aval_move(available_moves, [pos_x - i, pos_y + i]); } saa_dir[7] = true; }
				if (check_dir[2] != noone && !saa_dir[3]) { if (!compare_colors(color, check_dir[2].image_index)) { add_aval_move(available_moves, [pos_x + i, pos_y - i]); } saa_dir[3] = true; }
				if (check_dir[3] != noone && !saa_dir[5]) { if (!compare_colors(color, check_dir[3].image_index)) { add_aval_move(available_moves, [pos_x - i, pos_y - i]); } saa_dir[5] = true; }
				if (!saa_dir[1]) add_aval_move(available_moves, [pos_x + i, pos_y + i]); // NE
				if (!saa_dir[7]) add_aval_move(available_moves, [pos_x - i, pos_y + i]); // NW
				if (!saa_dir[3]) add_aval_move(available_moves, [pos_x + i, pos_y - i]); // SE
				if (!saa_dir[5]) add_aval_move(available_moves, [pos_x - i, pos_y - i]); // SW
				#endregion
			}
			break;
		}
		case "R": {
			// Calculate the rook's available squares
			for (var i = 1; i < max_iteration; i++) {
				// Vars
				var unit = SQUARE_LENGTH * i;
				#region Piece detection array: N, S, E, W
				var check_dir = [
					check_for_piece(xx, yy - unit),
					check_for_piece(xx, yy + unit),
					check_for_piece(xx + unit, yy),
					check_for_piece(xx - unit, yy)
				];
				#endregion
				
				// Add only valid available moves
				#region Add only valid available moves
				if (check_dir[0] != noone && !saa_dir[0]) { if (!compare_colors(color, check_dir[0].image_index)) { add_aval_move(available_moves, [pos_x, pos_y + i]); } saa_dir[0] = true; }
				if (check_dir[1] != noone && !saa_dir[2]) { if (!compare_colors(color, check_dir[1].image_index)) { add_aval_move(available_moves, [pos_x, pos_y - i]); } saa_dir[2] = true; }
				if (check_dir[2] != noone && !saa_dir[4]) { if (!compare_colors(color, check_dir[2].image_index)) { add_aval_move(available_moves, [pos_x + i, pos_y]); } saa_dir[4] = true; }
				if (check_dir[3] != noone && !saa_dir[6]) { if (!compare_colors(color, check_dir[3].image_index)) { add_aval_move(available_moves, [pos_x - i, pos_y]); } saa_dir[6] = true; }
				if (!saa_dir[0]) add_aval_move(available_moves, [pos_x, pos_y + i]); // N
				if (!saa_dir[2]) add_aval_move(available_moves, [pos_x, pos_y - i]); // S
				if (!saa_dir[4]) add_aval_move(available_moves, [pos_x + i, pos_y]); // E
				if (!saa_dir[6]) add_aval_move(available_moves, [pos_x - i, pos_y]); // W
				#endregion
			}
			break;
		}
		case "Q": {
			// Calculate the queen's available squares
			for (var i = 1; i < max_iteration; i++) {
				// Vars
				var unit = SQUARE_LENGTH * i;
				#region Piece detection array: N, NE, E, SE, S, SW, W, NW
				var check_dir = [
					check_for_piece(xx, yy - unit),
					check_for_piece(xx + unit, yy - unit),
					check_for_piece(xx + unit, yy),
					check_for_piece(xx + unit, yy + unit),
					check_for_piece(xx, yy + unit),
					check_for_piece(xx - unit, yy + unit),
					check_for_piece(xx - unit, yy),
					check_for_piece(xx - unit, yy - unit)
				];
				#endregion
				
				// Add only valid available moves
				#region Add only valid available moves
				if (check_dir[0] != noone && !saa_dir[0]) { if (!compare_colors(color, check_dir[0].image_index)) { add_aval_move(available_moves, [pos_x, pos_y + i]); } saa_dir[0] = true; }
				if (check_dir[1] != noone && !saa_dir[1]) { if (!compare_colors(color, check_dir[1].image_index)) { add_aval_move(available_moves, [pos_x + i, pos_y + i]); } saa_dir[1] = true; }
				if (check_dir[2] != noone && !saa_dir[2]) { if (!compare_colors(color, check_dir[2].image_index)) { add_aval_move(available_moves, [pos_x + i, pos_y]); } saa_dir[2] = true; }
				if (check_dir[3] != noone && !saa_dir[3]) { if (!compare_colors(color, check_dir[3].image_index)) { add_aval_move(available_moves, [pos_x + i, pos_y - i]); } saa_dir[3] = true; }
				if (check_dir[4] != noone && !saa_dir[4]) { if (!compare_colors(color, check_dir[4].image_index)) { add_aval_move(available_moves, [pos_x, pos_y - i]); } saa_dir[4] = true; }
				if (check_dir[5] != noone && !saa_dir[5]) { if (!compare_colors(color, check_dir[5].image_index)) { add_aval_move(available_moves, [pos_x - i, pos_y - i]); } saa_dir[5] = true; }
				if (check_dir[6] != noone && !saa_dir[6]) { if (!compare_colors(color, check_dir[6].image_index)) { add_aval_move(available_moves, [pos_x - i, pos_y]); } saa_dir[6] = true; }
				if (check_dir[7] != noone && !saa_dir[7]) { if (!compare_colors(color, check_dir[7].image_index)) { add_aval_move(available_moves, [pos_x - i, pos_y + i]); } saa_dir[7] = true; }
				if (!saa_dir[0]) add_aval_move(available_moves, [pos_x, pos_y + i]);		// N
				if (!saa_dir[1]) add_aval_move(available_moves, [pos_x + i, pos_y + i]);	// NE
				if (!saa_dir[2]) add_aval_move(available_moves, [pos_x + i, pos_y]);		// E
				if (!saa_dir[3]) add_aval_move(available_moves, [pos_x + i, pos_y - i]);	// SE
				if (!saa_dir[4]) add_aval_move(available_moves, [pos_x, pos_y - i]);		// S
				if (!saa_dir[5]) add_aval_move(available_moves, [pos_x - i, pos_y - i]);	// SW
				if (!saa_dir[6]) add_aval_move(available_moves, [pos_x - i, pos_y]);		// W
				if (!saa_dir[7]) add_aval_move(available_moves, [pos_x - i, pos_y + i]);	// NW
				#endregion
			}
			break;
		}
		case "K": {
			// Calculate the king's available squares
			add_aval_move(available_moves, [pos_x - 1, pos_y]);
			add_aval_move(available_moves, [pos_x - 1, pos_y - 1]);
			add_aval_move(available_moves, [pos_x - 1, pos_y + 1]);
			add_aval_move(available_moves, [pos_x + 1, pos_y]);
			add_aval_move(available_moves, [pos_x + 1, pos_y - 1]);
			add_aval_move(available_moves, [pos_x + 1, pos_y + 1]);
			add_aval_move(available_moves, [pos_x, pos_y + 1]);
			add_aval_move(available_moves, [pos_x, pos_y - 1]);
			break;
		}
	}
	
	// Return the entire piece available moves' array / list
	return available_moves;
}
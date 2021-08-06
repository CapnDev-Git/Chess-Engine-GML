/// @description Draw the board
// Set the font
draw_set_font(fnt_chessboard);

// Vars
var sqr_color = noone;
var chars = ["a", "b", "c", "d", "e", "f", "g", "h"];
var nums = ["8", "7", "6", "5", "4", "3", "2", "1"];
var light_sqr = make_color_rgb(240, 217, 181);
var dark_sqr = make_color_rgb(181, 136, 99);

// Use nested for loops to draw the board
for (var row = 0; row < 8; row++) {
	for (var column = 0; column < 8; column++) {
		// Determine the square color
		if ((row % 2 == 0 && column % 2 == 0) || (row % 2 == 1 && column % 2 == 1))
			sqr_color = light_sqr; else sqr_color = dark_sqr;
		
		// Draw the squares
		draw_set_alpha(1);
		draw_set_color(sqr_color);
		draw_rectangle(SQUARE_LENGTH * row, SQUARE_LENGTH * column, SQUARE_LENGTH * (row + 1), SQUARE_LENGTH * (column + 1), false);
		
		/*
		// Squares names
		draw_set_alpha(.5);
		draw_set_color(c_black);
		draw_text(SQUARE_LENGTH * row + 5, SQUARE_LENGTH * column + 5, chars[row] + nums[column]);
		*/
		
		// Draw positions indicators
		draw_set_alpha(1);
		if (column % 2 == 0) draw_set_color(light_sqr); else draw_set_color(dark_sqr);
		draw_text(SQUARE_LENGTH * column + 5, 615, chars[column]);
		draw_text(620, SQUARE_LENGTH * column + 5, nums[column]);
	}
}
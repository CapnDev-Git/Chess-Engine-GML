/// @description compare_colors(cur_color, comp_color);
/// @param cur_color
/// @param comp_color
function compare_colors() {
	// Arguments
	var cur_color = argument[0];
	var comp_color = argument[1];
	
	// Compare each pieces' colors
	return (cur_color == -1 && comp_color == 0) || (cur_color == 1 && comp_color == 1);
}
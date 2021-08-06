/// @description get_piece_infos();
function get_piece_infos() {
	// Variables
	//var chars = ["a", "b", "c", "d", "e", "f", "g", "h"];
	//var nums = ["8", "7", "6", "5", "4", "3", "2", "1"];
	var pieces_IDs = ["P", "N", "B", "R", "Q", "K", noone];
	var pieces_prices = [1, 3, 3, 5, 9, infinity, noone];
	var piece_color = 0;
	
	// Get piece's infos
	var piece_position = [(x / SQUARE_LENGTH) + 1, abs((y / SQUARE_LENGTH) - 8)] //[chars[x / 80] + nums[y / 80]];
	if (image_index == 0) piece_color = -1; else piece_color = 1;
	var piece_ID = pieces_IDs[type];
	var piece_price = pieces_prices[type];
	
	// Return the piece's infos
	return [piece_position, piece_ID, piece_price, piece_color];
}
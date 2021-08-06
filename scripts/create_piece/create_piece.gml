/// @description create_piece(x, y, subimg, piece);
/// @param x
/// @param y
/// @param subimg
/// @param piece
function create_piece() {
	// Arguments
	var xx = argument[0];
	var yy = argument[1];
	var subimg = argument[2];
	var piece = argument[3];
	
	// Create the instance using the arguments
	var object = instance_create_layer(xx, yy, "Pieces", piece);
	with (object) image_index = subimg;
	return true;
}
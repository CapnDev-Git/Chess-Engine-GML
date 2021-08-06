/// @description is_legal(move);
/// @param move
function is_legal() {
	// Vars
	var move = argument[0];
	if ((move[0] < 0 && move[0] > 9) && (move[1] < 0 && move[1] > 9)) return false;
	/* faire du cas par cas pour B, R & Q */
	
	return true;
}
/// @description is_in_array(array, value);
/// @param array
/// @param value
function is_in_array() {
	// Arguments
	var array = argument[0];
	var value = argument[1];

	// Check for the value's presence in the given array
	for (var i = 0; i < array_length(array); i++) if (array[i] == value) return true;
	return false;
}
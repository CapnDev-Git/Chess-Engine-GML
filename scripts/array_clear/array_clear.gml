/// @description array_clear(array);
/// @param array
function array_clear() {
	var array = argument[0];
	return array_delete(array, 0, array_length(array));
}
///@arg fname
///@arg string

var filename = argument0
var _string = argument1

_string = json_optimize(_string)

var buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1)
buffer_write(buffer, buffer_string, _string)
buffer_save(buffer, filename)
buffer_delete(buffer)

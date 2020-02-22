///@arg fname

var filename = argument0

var buffer = buffer_load(filename)
var _string = buffer_read(buffer, buffer_string)
buffer_delete(buffer)
return _string
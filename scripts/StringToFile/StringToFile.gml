var filename = argument0
var _string = argument1

_string = string_replace_all(_string,".000000","")
_string = string_replace_all(_string,"00000,",",")
//_string = string_replace_all(_string,"0000,",",")
//_string = string_replace_all(_string,"000,",",")
//_string = string_replace_all(_string,"00,",",")
//_string = string_replace_all(_string,"0,",",")

var buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1)
buffer_write(buffer, buffer_string, _string)
buffer_save(buffer, filename)
buffer_delete(buffer)

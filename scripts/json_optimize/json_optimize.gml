///@arg json
var json = argument0

json = string_replace_all(json,".000000,",",")
json = string_replace_all(json,".00000,",",")
json = string_replace_all(json,".0000,",",")
json = string_replace_all(json,".000,",",")
json = string_replace_all(json,".00,",",")
json = string_replace_all(json,".0,",",")

json = string_replace_all(json,".000000 ]"," ]")
json = string_replace_all(json,".00000 ]"," ]")
json = string_replace_all(json,".0000 ]"," ]")
json = string_replace_all(json,".000 ]"," ]")
json = string_replace_all(json,".00 ]"," ]")
json = string_replace_all(json,".0 ]"," ]")

json = string_replace_all(json,".000000 }"," }")
json = string_replace_all(json,".00000 }"," }")
json = string_replace_all(json,".0000 }"," }")
json = string_replace_all(json,".000 }"," }")
json = string_replace_all(json,".00 }"," }")
json = string_replace_all(json,".0 }"," }")

return json
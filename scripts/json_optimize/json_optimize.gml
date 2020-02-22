///@arg json
var json = argument0

for(var sym = 0; sym < 10; sym++) {
	var str_ = string(sym)
	json = string_replace_all(json,"."+str_+"00000,",	"."+str_+",")
	json = string_replace_all(json,"."+str_+"0000,",	"."+str_+",")
	json = string_replace_all(json,"."+str_+"000,",		"."+str_+",")
	json = string_replace_all(json,"."+str_+"00,",		"."+str_+",")
	json = string_replace_all(json,"."+str_+"0,",		"."+str_+",")

	json = string_replace_all(json,"."+str_+"00000 ]",	"."+str_+" ]")
	json = string_replace_all(json,"."+str_+"0000 ]",	"."+str_+" ]")
	json = string_replace_all(json,"."+str_+"000 ]",	"."+str_+" ]")
	json = string_replace_all(json,"."+str_+"00 ]",		"."+str_+" ]")
	json = string_replace_all(json,"."+str_+"0 ]",		"."+str_+" ]")
	
	json = string_replace_all(json,"."+str_+"00000 }",	"."+str_+" }")
	json = string_replace_all(json,"."+str_+"0000 }",	"."+str_+" }")
	json = string_replace_all(json,"."+str_+"000 }",	"."+str_+" }")
	json = string_replace_all(json,"."+str_+"00 }",		"."+str_+" }")
	json = string_replace_all(json,"."+str_+"0 }",		"."+str_+" }")
}

json = string_replace_all(json,".0,",",")
json = string_replace_all(json,".0 ]"," ]")
json = string_replace_all(json,".0 }"," }")

//show_message(json)

return json
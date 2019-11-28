/// @description 
image_index = hacked

with(oActivateable) {
	if(group == other.group)
		hacked = other.hacked
	else if(group == -other.group)
		hacked = !other.hacked
}
with(oTerminal) {
	if(group == other.group)
		hacked = other.hacked
	else if(group == -other.group)
		hacked = !other.hacked
}
/// @desc
if(active and type == "bind")
{
	//bind_value = keyboard_lastkey
	bind_value = keyboard_key
	oInput.binds[? bind_key] = bind_value
	active = false
}
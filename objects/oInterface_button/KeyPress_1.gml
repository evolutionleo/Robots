/// @desc
if(active and type == "bind")
{
	bind_value = keyboard_lastkey
	oInput.binds[? bind_key] = bind_value
	active = false
}
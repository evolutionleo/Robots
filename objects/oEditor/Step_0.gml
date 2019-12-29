/// @desc
//Deactivate all needed layers
instance_deactivate_layer("Player_var")
instance_deactivate_layer("Group_var")



//Activate selected
if(ds_list_size(selected_object) == 1)
{
	if(object_get_name(selected_object[| 0].obj) == "oHbot") {
		instance_activate_layer("Player_var")
	}
	else if(object_get_name(selected_object[| 0].obj) == "oVbot")
		instance_activate_layer("Player_var")
	else if(object_get_name(selected_object[| 0].obj) == "oBot")
		instance_activate_layer("Player_var")
	else if(object_get_name(selected_object[| 0].obj) == "oTerminal")
		instance_activate_layer("Group_var")
	else if(object_get_name(selected_object[| 0].obj) == "oDoor")
		instance_activate_layer("Group_var")
}

with(oVariable_changer) {
	if(variable_instance_exists(oEditor.selected_object[| 0],variable_name)) {
		var val = variable_instance_get(oEditor.selected_object[| 0],variable_name)
		value = val
	}
}
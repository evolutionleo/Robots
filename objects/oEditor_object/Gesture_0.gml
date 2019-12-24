/// @desc
if(oEditor.instrument == "select") {
	if(ds_list_find_index(oEditor.selected_object,self) == -1)
		ds_list_add(oEditor.selected_object,self)
}
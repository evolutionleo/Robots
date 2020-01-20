for(var i = bbox_left; i < bbox_right; i++) {
	if(position_meeting(i,sticky+1,oWall)) {
		return true
	}
}
return false
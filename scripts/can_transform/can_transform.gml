var prev_index = mask_index
mask_index = sVbot_transformated
if(place_meeting(x,y,oWall)) {
	var flag = false
	alarm[1] = 40
}
else if(!place_meeting(x,y+1,oWall)) {
	var flag = false
}
else
	var flag = true
mask_index = prev_index

flag = flag and meeting()


return flag
var prev_index = mask_index
mask_index = sVbot_transformation
if(place_meeting(x,y,oWall)) {
	var flag = false
	alarm[1] = 40
}
else
	var flag = true
mask_index = prev_index

flag = flag and place_meeting(x,y+1,oWall)

return flag
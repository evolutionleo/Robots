/// @desc
if(abs(add_hsp) > 1) {
	add_hsp *= multiplier
}
else {
	add_hsp = 0
}

hsp = add_hsp

if(affected_by_gravity) {
	vsp += grv1
}

collision(oWall)


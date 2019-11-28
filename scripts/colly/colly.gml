var arg = argument0
var delta = sign(arg)
var obj = argument1
var flag = false
for(var i = 0; i <= abs(arg); i++) {
	if(place_meeting(x,y+i*delta,obj))
		return true
}

return false
//with(obj) {
//	if(!variable_instance_exists(self,"vsp"))
//		vsp = sign(y - yprevious)
//	if(place_meeting(x,y+arg+vsp,other)) {
//		vsp = 0
//		flag = true
//	}
//}
//return flag
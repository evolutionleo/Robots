var arg = argument0
var delta = sign(arg)
var obj = argument1
var flag = false
for(var i = 0; abs(i) <= abs(arg); i++) {
	if(place_meeting(x+i*delta,y,obj))
		return true
}

return false
//with(obj) {
//	if(!variable_instance_exists(self,"hsp"))
//		hsp = sign(x - xprevious)
//	if(place_meeting(x+arg+hsp,y,other)) {
//		hsp = 0
//		flag = true
//	}
//}
//return flag
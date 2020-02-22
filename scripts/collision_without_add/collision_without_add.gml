var obj = argument0

colx = place_meeting(x+hsp,y,obj)
if(colx)
{
	while(!place_meeting(x+sign(hsp),y,obj))
	{
		x += sign(hsp)
	}
	hsp = 0
}

coly = place_meeting(x,y+vsp,obj)
if(coly)
{
	while(!place_meeting(x,y+sign(vsp),obj))
	{
		y += sign(vsp)
	}
	vsp = 0
}
var obj = argument0

var colx = collx(hsp,obj)
//colx = place_meeting(x+hsp,y,obj)
if(colx)
{
	while(!place_meeting(x+sign(hsp),y,obj))
	{
		x += sign(hsp)
	}
	hsp = 0
}

var coly = colly(vsp,obj)
//coly = place_meeting(x,y+vsp,obj)
if(coly)
{
	while(!place_meeting(x,y+sign(vsp),obj))
	{
		y += sign(vsp)
	}
	vsp = 0
}
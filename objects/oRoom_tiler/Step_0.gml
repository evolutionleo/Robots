/// @desc
with(oWall) {
if(object_index == oWall) {
//var tiledata = 46
var tilemap_id = layer_tilemap_get_id("Tile_layer")
#region Stupid code
var up_tile =		  position_meeting(x,bbox_top-1,oWall)				and !position_meeting(x,bbox_top-1,oHbot)
//var up_left_tile =	  position_meeting(bbox_left-1,bbox_top-1,oWall)	and !position_meeting(bbox_left-1,bbox_top-1,oHbot)
//var up_right_tile =	  position_meeting(bbox_right+1,bbox_top-1,oWall)	and !position_meeting(bbox_right+1,bbox_top-1,oHbot)
var left_tile =		  position_meeting(bbox_left-1,y,oWall)				and !position_meeting(bbox_left-1,y,oHbot)
var right_tile =	  position_meeting(bbox_right+1,y,oWall)			and !position_meeting(bbox_right+1,y,oHbot)
//var down_left_tile =  position_meeting(bbox_left-1,bbox_bottom+1,oWall)and !position_meeting(bbox_left-1,bbox_bottom+1,oHbot)
var down_tile =		  position_meeting(x,bbox_bottom+1,oWall)			and !position_meeting(x,bbox_bottom+1,oHbot)
//var down_right_tile = position_meeting(bbox_right+1,bbox_bottom+1,oWall)and !position_meeting(bbox_right+1,bbox_bottom+1,oHbot)
var up_left_tile = false
var up_right_tile = false
var down_right_tile = false
var down_left_tile = false


var tiledata = up_left_tile * 1 + up_tile * 2 + up_right_tile * 4 +
  left_tile * 8 + right_tile * 16 + down_left_tile * 32 +
    down_tile * 64 + down_right_tile * 128
#region The most stupid code EVER
		switch(tiledata) {
			case 0:
				tiledata = 46
				break;
			case 2:
				tiledata = 44
				break;
			case 8:
				tiledata = 45
				break;
			case 10:
				tiledata = 39
				break;
			case 11:
				tiledata = 38
				break;
			case 16:
				tiledata = 43
				break;
			case 18:
				tiledata = 41
				break;
			case 22:
				tiledata = 40
				break;
			case 24:
				tiledata = 33
				break;
			case 26:
				tiledata = 31
				break;
			case 27:
				tiledata = 30
				break;
			case 30:
				tiledata = 29
				break;
			case 31:
				tiledata = 28
				break;
			case 64:
				tiledata = 42
				break;
			case 66:
				tiledata = 32
				break;
			case 72:
				tiledata = 37
				break;
			case 74:
				tiledata = 27
				break;
			case 75:
				tiledata = 25
				break;
			case 80:
				tiledata = 35
				break;
			case 82:
				tiledata = 19
				break;
			case 86:
				tiledata = 18
				break;
			case 88:
				tiledata = 23
				break;
			case 90:
				tiledata = 15
				break;
			case 91:
				tiledata = 14
				break;
			case 94:
				tiledata = 13
				break;
			case 95:
				tiledata = 12
				break;
			case 104:
				tiledata = 36
				break;
			case 106:
				tiledata = 26
				break;
			case 107:
				tiledata = 24
				break;
			case 120:
				tiledata = 21
				break;
			case 122:
				tiledata = 7
				break;
			case 123:
				tiledata = 6
				break;
			case 126:
				tiledata = 5
				break;
			case 127:
				tiledata = 4
				break;
			case 208:
				tiledata = 34
				break;
			case 210:
				tiledata = 17
				break;
			case 214:
				tiledata = 16
				break;
			case 216:
				tiledata = 22
				break;
			case 218:
				tiledata = 11
				break;
			case 219:
				tiledata = 10
				break;
			case 222:
				tiledata = 9
				break;
			case 223:
				tiledata = 8
				break;
			case 248:
				tiledata = 20
				break;
			case 250:
				tiledata = 3
				break;
			case 251:
				tiledata = 2
				break;
			case 254:
				tiledata = 1
				break;
			case 255:
				tiledata = 47
				break;
		}
		#endregion
#endregion
tilemap_set_at_pixel(tilemap_id,tiledata,x,y)
}
}
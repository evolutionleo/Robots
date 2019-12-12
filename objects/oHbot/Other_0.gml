/// @description 
if(room != r18) or (global.red_out and global.yellow_out and global.white_out) {
	room_goto_next()
}
else {
	if(oBot.y > room_height and oVbot.x < 0 and oHbot.x > room_width)
		room_goto_next()
}
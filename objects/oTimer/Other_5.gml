/// @desc
//if(room == rlast and !global.run_invalid) {
if(room == rlast)
{
	ini_open("Leaderboard.ini")
	ini_write_string("All times",global.Player_name,time)
	for(var i = 0; i < 9; i++)
	{
		var cur_time = ini_read_real("Best times int",i,100000000000)
		if(time < cur_time)
		{
			for(var k = 9; k >= i; k--)
			{
				var value = ini_read_real("Best times int",k,100000000000)
				ini_write_real("Best times int",k + 1,value)
				
				var value = ini_read_string("Best times",k,"-")
				ini_write_string("Best times",k + 1,value)
			}
			ini_write_real("Best times int",i,time)
			ini_write_string("Best times",i,global.Player_name+" - "+string(str)+"  (v."+GM_version+")")
			break;
		}
	}
	ini_close()
}

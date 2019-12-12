/// @description 
if(room != rlast) {

if(!variable_instance_exists(id,"timer_reset"))
	timer_reset = 0

time = get_timer() - timer_reset

msecs =	int64(time / 1000		% 1000)
secs =	int64(time / 1000000	% 60)
mins =	int64(time / 1000000	/ 60	% 60)
hours = int64(time / 1000000	/ 3600	% 1000)

if(msecs < 100)
	msecs = "0" + string(msecs)
if(msecs < 10)
	msecs = "0" + string(msecs)
if(secs < 10)
	secs = "0" + string(secs)
if(mins < 10)
	mins = "0" + string(mins)
if(hours < 10)
	hours = "0" + string(hours)

msecs = string(msecs)
secs = string(secs)
mins = string(mins)
hours = string(hours)

//str = string(hours) + ":" + string(mins) + ":" + string(secs) + ":" + string(msecs)
str = hours + ":" + mins + ":" + secs + ":" + msecs

}
else {
//str = hours + ":" + mins + ":" + secs + ":" + msecs
}
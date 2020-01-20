var time = argument0
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

return hours+":"+mins+":"+secs+":"+msecs
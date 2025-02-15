// Auto-generated stubs for each available event.

function sq_transiction_in_Moment()
{
	global.transiction_running = true;
	if(room_next(room) != -1)
		room_goto_next();
	else
		room_goto(rm_level_001);
}
compile:
	xrun  -f flist.f -compile -messages 
elaborate:	
	xrun -elaborate -noupdate -top worklib.top:sv 
snapshot:	
	xmls -snap
execute:	
	xrun -f flist.f -access +rwc 
gui:	
	xrun -f flist.f -access +rwc -gui

clean:	
	rm -r dump.vcd xcelium.d xmls.log xrun.history xrun.log xrun.key
	


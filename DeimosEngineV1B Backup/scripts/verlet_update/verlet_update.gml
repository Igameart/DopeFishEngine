function verlet_update(DT){
	
	var dt = DT;
	
	
	var new_acc = verlet_apply_forces(); // only needed if acceleration is not constant
	
	var new_vel = [ vel[0] + (acc[0]+new_acc[0])*(dt*0.5),vel[1] + (acc[1]+new_acc[1])*(dt*0.5),vel[2] + (acc[2]+new_acc[2])*(dt*0.5) ];
	
	new_vel[0] *= vFriction * vFriction;
	new_vel[1] *= vFriction * vFriction;
	
	var new_pos = [ x + vel[0]*dt + acc[0]*(dt*dt*0.5),y + vel[1]*dt + acc[1]*(dt*dt*0.5),z + vel[2]*dt + acc[2]*(dt*dt*0.5) ];
	
	x = new_pos[0];
	y = new_pos[1];
	z = new_pos[2];
	
	vel = new_vel;
	acc = new_acc;
	
}
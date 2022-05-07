function verlet_apply_forces(){
	
    var __grav_acc = [0.0, 0.0, -9.81 * vGravity ]; // 9.81m/s^2 down in the Z-axisG
	
	var __vS =[vel[0]*abs(vel[0]),vel[1]*abs(vel[1]),vel[2]*abs(vel[2])];
	
    var __drag_force = 0.5 * drag;// D = 0.5 * (rho * C * Area * vel^2)
	
	__drag_force = [__drag_force * __vS[0],__drag_force * __vS[1],__drag_force * __vS[2]];
	
    var __drag_acc = [__drag_force[0] / mass, __drag_force[1] / mass, __drag_force[2] / mass]; // a = F/m
	
	var __result = [__grav_acc[0] - __drag_acc[0],__grav_acc[1] - __drag_acc[1],__grav_acc[2] - __drag_acc[2]];
	
    return __result;
}
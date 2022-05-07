/// @description Insert description here

Subsector = -1;

xx=1;
yy=0;
zz=0;

z=0;

yaw = 0;
direction=yaw;
pitch=0;

cam_x=lengthdir_x(lengthdir_x(1,pitch),yaw);
cam_y=lengthdir_y(lengthdir_x(1,pitch),yaw);
cam_z=lengthdir_y(1,pitch);
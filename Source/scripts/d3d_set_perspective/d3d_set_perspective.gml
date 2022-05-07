/// @description d3d - set perspective
/// @param enable true if enabled, false if disabled
function d3d_set_perspective(argument0) {

	//camera_apply(global.__d3dCamera);

	var __persp = argument0;
	if (global.__d3d == false)
		__persp = false;
	
	// Now find all cameras everywhere - the default camera, all the views in the current room and all the cameras in every other room
	// NOTE: this currently won't handle rooms that are created in code (using room_add())

	// The default camera is automatically updated by the runner so we just need to give it a hint of whether it is ortho or perspective
	var __mat = camera_get_proj_mat(camera_get_default());

	if (__persp)
	{
		__mat[11] = 1.0;
	}
	else
	{
		__mat[11] = 0.0;
	}

	camera_set_proj_mat(camera_get_default(), __mat);


	// Now loop through all the others
	var __numcams = 0;
	var __cams = [];
	var __i;
	for(__i = 0; __i < 8; __i++)
	{
		if (view_camera[__i] != -1)
		{
			__cams[__numcams*3] = view_camera[__i];
			__cams[__numcams*3+1] = view_camera[__i];
			__cams[__numcams*3+2] = view_camera[__i];
			__numcams++;
		}
	}

	var __currroom = room_first;
	while(__currroom != -1)
	{
		for(__i = 0; __i < 8; __i++)
		{
			var __cam = room_get_camera(__currroom, __i);
			if (__cam != -1)
			{
				__cams[__numcams] = __cam;
				__numcams++;
			}
		}
	
		__currroom = room_next(__currroom);
	}

	// Now loop through all the cameras
	for(__i = 0; __i < __numcams; __i++)
	{
		var __cam = __cams[__i];
		var __mat = camera_get_proj_mat(__cam);
		var __ispersp = (__mat[11] != 0.0) ? true : false;
	
		if (__ispersp != __persp)
		{
			// Okay, I'm going to assume that, if this is an imported project, all the cameras that have been set up are view-based
			// This means that they should have valid view parameters
			if (camera_get_view_width(__cam) > 0.0)
			{
				// okay, we'll assume this is a camera that has been previously set up with a view
				var __width = camera_get_view_width(__cam);
				var __height = camera_get_view_height(__cam);			
			
				if (__persp)
				{
					var __projmat = matrix_build_projection_perspective(1.0, -(__height/__width), 1.0, 32000.0);
					camera_set_proj_mat(__cam, __projmat);
				}
				else
				{
					var __projmat = matrix_build_projection_ortho(__width, __height, -16000.0, 16000.0);
					camera_set_proj_mat(__cam, __projmat);
				}
			}
		}
	}

	//camera_apply(camera_get_active());




}

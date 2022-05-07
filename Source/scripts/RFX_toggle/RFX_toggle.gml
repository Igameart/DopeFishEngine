function RFX_toggle_screen_fx() {
	
	if ( argument_count == 0 ){
		RFXenabled=!RFXenabled;
	}else RFXenabled = argument[0];

	if !RFXenabled{
	    application_surface_draw_enable(true);
	    surface_resize(application_surface,window_get_width(),window_get_height());
	}
	else
	{
	    application_surface_draw_enable(false);
	    surface_resize(application_surface,(window_get_width()/RFXscale)/(1+RFX2wide),window_get_height()/RFXscale);
	}

}

	

	//if !RFXenabled{
	//    application_surface_draw_enable(true);
	//    surface_resize(application_surface,display_get_gui_width(),display_get_gui_height());
		
	//	view_wport[0] = display_get_gui_width();
	//	view_hport[0] = display_get_gui_height();
	//}
	//else
	//{
	//    application_surface_draw_enable(false);
	//    surface_resize(application_surface,(display_get_gui_width()/RFXscale)/(1+RFX2wide),display_get_gui_height()/RFXscale);
		
	//	view_wport[0] = display_get_gui_width()/RFXscale;
	//	view_hport[0] = display_get_gui_height()/RFXscale;
	//}



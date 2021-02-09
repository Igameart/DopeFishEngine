function RFX_toggle() {
	RFXenabled=!RFXenabled;

	if !RFXenabled{
	    application_surface_draw_enable(true);
	    surface_resize(application_surface,(__view_get( e__VW.WView, 0 )),__view_get( e__VW.HView, 0 ));
	}
	else
	{
	    application_surface_draw_enable(false);
	    surface_resize(application_surface,(__view_get( e__VW.WView, 0 )/RFXscale)/(1+RFX2wide),__view_get( e__VW.HView, 0 )/RFXscale);
	}



}

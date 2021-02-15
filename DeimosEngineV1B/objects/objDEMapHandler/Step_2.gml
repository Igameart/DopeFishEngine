/*if mouse_check_button(mb_middle){

    vx+=(swipe[0]-display_mouse_get_x())*scale;
    vy+=(swipe[1]-display_mouse_get_y())*scale;
    swipe[0]=display_mouse_get_x();
    swipe[1]=display_mouse_get_y();
    
    view_xview[0]=vx-view_wview[0]/2;
    view_yview[0]=vy-view_hview[0]/2;

}

/* */
/*  */

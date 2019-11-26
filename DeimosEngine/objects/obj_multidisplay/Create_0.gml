/// @description  Initial settings
generator = obj_gen_smoke;

no_frames = generator.no_frames;

/// Destroy billboards and assign data to me
var i = 0;
with(obj_display) {
    other.bb_x[i] = x;
    other.bb_y[i] = y;
    other.bb_z[i] = z;
    other.current[i] = current;
    i++;
    instance_destroy();
}

count = i-1;


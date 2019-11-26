/// @description  Free surfaces
if (surface_exists(sf_billboards))surface_free(sf_billboards);
if (surface_exists(sf)) surface_free(sf);

/// Destroy particle system
part_system_destroy(sys);

/// Delete vertex buffer
vertex_delete_buffer(buffer);


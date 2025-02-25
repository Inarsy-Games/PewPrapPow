instance_destroy(id);

var _xspawn = other.bbox_right;
if hspeed > 0
_xspawn = other.bbox_left;

with instance_create_depth(_xspawn,y,depth,oWallHit)
image_xscale = sign(other.hspeed);
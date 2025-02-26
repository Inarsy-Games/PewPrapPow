image_xscale -= shrink_rate;
image_yscale = image_xscale;

if image_xscale <= 0
instance_destroy(id);
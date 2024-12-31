if zspd != 0
{zspd += grav}

if (z + zspd) > 0
{
	zspd = 0;
	z = 0;
}

x+=hspd;
y+=vspd;
z+=zspd;
x=clamp(x,0,room_width - 16)
y=clamp(y,0,room_height - 16)

//image_xscale = 1
//image_yscale = 1
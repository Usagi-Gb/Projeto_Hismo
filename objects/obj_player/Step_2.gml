 var _velh = sign(velh); 
repeat(abs(velh)){
if(place_meeting(x + _velh, y, obj_block)){
		velh = 0;
	}
else{
		x += _velh;
	}
}
var _velv = sign(velv);
repeat(abs(velv)){
if(place_meeting(x, y + _velv, obj_block)){
		velv = 0;
	}
else{
		y += _velv;
	}
}
usa_arma();
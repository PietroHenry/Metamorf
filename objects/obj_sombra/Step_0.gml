switch(vai)
{
	case true:
		if horas != 2
		{horas = lerp(horas,2,0.06)}else{vai = false}
	break;

	case false:
		if horas != -1
		{horas = lerp(horas,-1,0.06)}else{vai = true}
	break;
}
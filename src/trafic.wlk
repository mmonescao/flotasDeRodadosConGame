object blanco {}

object trafic {
	var interior 
	var motor 
	method setMotor(unMotor){motor = unMotor}
	method setInterior(unInterior){interior = unInterior}
	method capacidad(){return interior.capacidad()}
	method peso(){return 4000 + interior.peso() + motor.peso()}
	method velMax(){return motor.velMax()}
	method color(){return blanco}
}

object interiorComodo {
	 method capacidad(){return 5}
	 method peso(){return 700}
}

object interiorPopular {
	method capacidad(){return 12}
	method peso(){return 1000}
}

object motorPulenta {
	method peso(){return 800}
	method velMax(){return 130}
}

object motorBataton {
	method peso(){return 500}
	method velMax(){return 80}
}
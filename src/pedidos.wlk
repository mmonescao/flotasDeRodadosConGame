import otros_Rodados.*
import trafic.*

class Pedido {
	const coloresIncompatibles = []
	var property distanciaARecorrer
	var property tiempoMaximo
	var property cantidadDePasajeros
	
	method agregarColorIncompatible(unColor){coloresIncompatibles.add(unColor)}
	
	method quitarColorIncompatible(unColor){coloresIncompatibles.remove(unColor)}
	
	method sonColoresIncompatibles(){return coloresIncompatibles}
	
	method acelerar(){tiempoMaximo -= 1}
	
	method relajar(){tiempoMaximo += 1}
	
	method velocidadRequerida(){return distanciaARecorrer/tiempoMaximo}
	
	method autoPuedeSatisfacer(rodado){
		return (rodado.velMax() - self.velocidadRequerida()) >= 10 and rodado.capacidad() >= self.cantidadDePasajeros()
				and coloresIncompatibles.all({unColor => unColor != rodado.color()}) 
	}
}
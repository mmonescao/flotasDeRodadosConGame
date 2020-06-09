import otros_Rodados.*
import colores.*
import pedidos.*
import trafic.*

class Dependencia {
	const flota = []
	var empleados = 0
	const pedidos = []
	
	method agregarAFlota(rodado){flota.add(rodado)}
	
	method quitarDeFlota(rodado){flota.remove(rodado)}
	
	method agregarAPedidos(pedido){pedidos.add(pedido)}
	
	method quitarDePedidos(pedido){pedidos.remove(pedido)}
	
	method pesoTotalFlota(){
		return flota.sum({unRodado => unRodado.peso()})
	}
	method estaBienEquipada(){
		return flota.size() >= 3 and flota.all({unRodado => unRodado.velMax() >= 100})
	}
	method capacidadTotalEnColor(color){
		return flota.filter({unRodado => unRodado.color() == color}).sum({unRodado => unRodado.capacidad()})
	}
	method colorDelRodadoMasRapido(){
		return flota.max({unRodado => unRodado.velMax()}).color()
	}
	method setEmpleados(nroEmpleados){empleados = nroEmpleados}
	
	method esGrande(){
		return empleados >= 40 and flota.size() >= 5
	}  
	method capacidadFaltante(){
		return empleados - flota.sum({unRodado => unRodado.capacidad()})
	}
	
	method totalDePasajerosEnPedidos(){
		if (not pedidos.isEmpty()){
			return pedidos.sum({unPedido=> unPedido.cantidadDePasajeros()})
		}	else {
			return 0
		}
	}
	
	method cualesPedidosNoSatisface(){
		return pedidos.filter({unPedido => not self.flotaSatisface(unPedido)})
	}
	
	method flotaSatisface(unPedido){
		return flota.all({unRodado => unPedido.autoPuedeSatisfacer(unRodado)})
	}
	
	method colorIncompatibleEnPedidos(unColor){
		return pedidos.all({unPedido => unPedido.sonColoresIncompatibles().any({color => color == unColor})})
	}
	
	method coloresIncompatiblesDeLosPedidos(){
		return pedidos.flatMap({pedido=>pedido.sonColoresIncompatibles()})
	}
	
	method relajarPedidos(){
		pedidos.forEach({unPedido => unPedido.relajar()})
	}
}

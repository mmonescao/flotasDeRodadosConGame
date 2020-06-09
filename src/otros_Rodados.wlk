import colores.*
import wollok.game.*
import direcciones.*
import paredes.*

class ChevroletCorsa {
	var color
	var property position
	var property image
	const posiciones = []
	var ultimoMovimiento 
	
	method position(x,y){
		position = game.at(x,y)
		posiciones.add(self.position())	
	}
	method image(){return color.image()}
	method capacidad(){return 4}
	method velMax(){return 150}
	method peso(){return 1300}
	method setColor(nuevoColor){color = nuevoColor}
	method color(){return color}

	method pasoPor(posicion){
		return posiciones.any({unaPosicion => unaPosicion == posicion})
	}
	method pasoPorColumna(columna) {
		return posiciones.any({pos => pos.x() == columna})
	}
	method recorrioColumnas(lista){
		return lista.asSet() == posiciones.map({pos => pos.x()}).asSet()
	}
	
	method moveteArriba(){self.position(self.position().up(1))}	
	method moveteDerecha(){self.position(self.position().right(1))}	
	method moveteIzquierda(){self.position(self.position().left(1))}	
	method moveteAbajo(){self.position(self.position().down(1))}
	
	method moverseAl(direccion){
		position = direccion.moverAl(position)
		ultimoMovimiento = direccion
	}
	
	method permanecer(){position = ultimoMovimiento.opuesto(position)}
	
	method repetirUltimoMovimiento(){self.moverseAl(ultimoMovimiento)}
	
	method chocar(unaPared){
		if(unaPared.resistencia() > 0){
		self.permanecer()
		}
		unaPared.colisionar()
	}
}

class RenaultKwid {
	var tanqueAdicional = false
	method capacidad(){
		if(tanqueAdicional){
			return 3
			} else {
			return 4	
			}
	}
	method velMax(){
		if(tanqueAdicional){
			return 120
			} else {
			return 110	
			}
	}
	method peso(){
		if(tanqueAdicional){
			return 1350
			} else {
			return 1200
			}
	}
	method modificarTanque(){tanqueAdicional = not tanqueAdicional}
	method color(){return azul}
}

class AutosEspeciales {
	var property capacidad
	var property velMax
	var property peso
	var property color
}

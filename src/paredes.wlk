import wollok.game.*

class Pared {
	var tipo
	var property image
	var property position
	var property resistencia
	
	method setTipo(tipoDePared){
		tipo = tipoDePared
		self.resistencia(tipo.resistencia())
	}
	
	method colisionar(){
		if(self.esDeLadrillo() and resistencia == 2){
			self.setTipo(paredLadrilloRota)
		} else if(resistencia == 0) {
			game.removeVisual(self)
		} else {
			resistencia = resistencia - 1
		}
	}
	
	method image(){return tipo.image()}	
	
	method esDeLadrillo(){return tipo == paredLadrillo}
}

object paredLadrillo {
	method image(){return "paredLadrillo.png"}
	method resistencia(){return 3}
}

object paredLadrilloRota {
	method image(){return "paredLadrilloRota.png"}
	method resistencia(){return 1}
}

object paredMadera {
	method image(){return "paredMadera.png"}
	method resistencia(){return 0}
}
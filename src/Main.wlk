import wollok.game.*

class Muro{
	var property position	
	var property image = "cubo-32x32.png"	//muros deben ser 50x50
	var property esAtravesable = false
}

object muros{
	
	method cargarMuros(){
		const ancho = game.width() - 1
		const largo = game.height() - 1
	
		const posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		[4,13,19].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[2,3,4,6,7,8,10,11,13,14,15,16,17,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[6,10,17,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[1,2,3,4,5,6,8,9,10,11,12,13,14,16,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[4,8,14,17,19,23].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[2,4,6,7,8,10,11,12,23].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[2,6,10,14,15,16,17,18,19,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[2,3,4,5,6,8,10,12,13,14,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[2,6,7,8,10,13,17,21,23].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2,4,10,12,13,15,16,17,19,20,21].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[1,2,4,5,6,7,8,9,10,12,17,19,21,22].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[4,6,9,14,15,16,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[1,2,4,6,8,9,11,12,14,19,21,23].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2,4,9,12,13,14,16,17,18,19,21].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2,4,7,12,14,18,21].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[6,7,8,10,12,16].forEach{n => posParedes.add(new Position(x=n, y=1))}
		
		posParedes.forEach { p => self.dibujar(new Muro(position = p)) }	
	}	
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
	method colisionar(){
	}
}

object tanque{	
	var property position = game.at(1,3)
	var property image = "tank-64x64.png"
	var property tieneRosquilla = false
	
	
	method position(nuevaPosicion){
		position = nuevaPosicion
	}
	
	method mover(unaOrientacion){

		
		if (not(movimiento.puedeMoverAl(unaOrientacion))){
			self.position(unaOrientacion.opuesto().posicionEnEsaDireccion())
		}
	}
}


object movimiento{

	 method puedeMoverAl(unaOrientacion){
		return game.getObjectsIn(unaOrientacion.posicionEnEsaDireccion()).all{unObj => unObj.esAtravesable()}
	}
	
	method configurarFlechas(){
		keyboard.up().onPressDo{tanque.mover(arriba)}
		keyboard.down().onPressDo{tanque.mover(abajo)}
		keyboard.left().onPressDo{tanque.mover(izquierda)}
		keyboard.right().onPressDo{tanque.mover(derecha)}
   }
}

object arriba{
	method posicionEnEsaDireccion() = tanque.position().up(1)
	method opuesto() = abajo
}

object abajo{
	method posicionEnEsaDireccion() = tanque.position().down(1)
	method opuesto() = arriba
}

object izquierda{
	method posicionEnEsaDireccion() = tanque.position().left(1)
	method opuesto() = derecha	
}

object derecha{
	method posicionEnEsaDireccion() = tanque.position().right(1)
	method opuesto() = izquierda
}


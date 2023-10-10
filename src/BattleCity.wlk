import wollok.game.*
import visuales.*



object launch{
	method iniciar(){
		game.title("Battle City")
		game.width(30)
		game.height(30)
		game.cellSize(64)
		game.ground("mapavacio.png")		
		paredes.generarParedes()
		game.addVisual(personaje)
		game.addVisual(enemigo0)
		enemigo0.moverse()
		configuraciones.configurarTeclas()
		}
}


class Direccion{
	
	var property nombre

	method orientar(individuo, posicion){
		individuo.orientacion(self)
	}

	method posicion(posicion)

	method puedeIr(individuo) = self.posicion(individuo.position()).allElements().all({elemento => elemento.esAtravesable()})
	
	method objetosEnLaPosicionDelIndividuo(individuo){
		return game.getObjectsIn(game.at(individuo.position().x(), individuo.position().y()))
	}
	
	method objetosFrentreAlIndividuo(individuo){
		return game.getObjectsIn(game.at(self.posicion(individuo.position()).x(), self.posicion(individuo.position())).y())
	}
	
}

object arriba inherits Direccion(nombre="Arriba"){

	override method posicion(posicion) = posicion.up(1)

}
 
 
object abajo inherits Direccion(nombre="Abajo"){

	override method posicion(posicion) = posicion.down(1)

}


object derecha inherits Direccion(nombre="Derecha"){

	override method posicion(posicion) = posicion.right(1)

} 


object izquierda  inherits Direccion(nombre="Izquierda"){

	override method posicion(posicion) = posicion.left(1)

}


class Imagen {
	var property categoria=null
	var property position = game.at(0,0)
	var property imagen 

	method esAtravesable() = true

	method image() = imagen
}

class Individuo inherits Imagen {
	var property orientacion = derecha


	method moverse(direccion) {
		self.moverHaciaSiSePuede(self, direccion)
	}

	method moverHaciaSiSePuede(individuo, direccion) {
		if (direccion.puedeIr(individuo)) {
			self.moverHacia(individuo, direccion)
		}
	}

	method puedeMoverse(posicion) = posicion.allElements().all({ objeto => objeto.esAtravesable() })

	method moverHacia(individuo, direccion) {
		const nuevaPosicion = direccion.posicion(individuo.position())
		if (self.puedeMoverse(nuevaPosicion)) {
			individuo.orientacion(direccion)
			individuo.position(nuevaPosicion)
		}
	}

}

object personaje inherits Individuo (position = game.at(1, 1), imagen = "tank-64x64.png"){
	
	

	override method image(){
		return 'tank' + orientacion.nombre() + '.png'
	}	

	method disparar(){
		
	}
}


//editar no hace falta
class Estado {

	method alPresionarUp() {
	}

	method alPresionarDown() {
	}

	method alPresionarRight() {
	}

	method alPresionarLeft() {
	}

}

object juego inherits Estado {

	override method alPresionarUp() {
		personaje.moverse(arriba)
	}

	override method alPresionarDown() {
		personaje.moverse(abajo)
	}

	override method alPresionarRight() {
		personaje.moverse(derecha)
	}

	override method alPresionarLeft() {
		personaje.moverse(izquierda)
	}
}


object configuraciones {


//	var estadoActual = juego

	method configurarTeclas() {
	
	keyboard.w().onPressDo({juego.alPresionarUp()})
	keyboard.s().onPressDo({juego.alPresionarDown()})
	keyboard.d().onPressDo({juego.alPresionarRight()})
	keyboard.a().onPressDo({juego.alPresionarLeft()})
	}

//	method cambiarEstado(nuevoEstado) {
//			estadoActual = nuevoEstado
//	}
}



class Enemigo inherits Individuo {


	method moverse() {
		game.onTick(250, "perseguir" + self, { self.moverHaciaJugador()})
	}

	method direccionMasConveniente(direcciones) = direcciones.min{ direccion => direccion.posicion(self.position()).distance(personaje.position()) }

	method moverHaciaJugador() {
		var direccionMasConveniente = self.direccionMasConveniente(self.direccionesAtravesables())
		self.moverHaciaSiSePuede(self, direccionMasConveniente)
	}

	method direccionesAtravesables() = [ izquierda, arriba, abajo, derecha ].filter{ direccion => direccion.puedeIr(self) }

	override method image() {
		return "enemy-64x64.png"
	}
//	Override method image(){
//		return 'tankEnemigo' + orientacion.nombre() + '.png'
//	}	
}


const enemigo0 = new Enemigo(position = game.at(5, 6), orientacion = arriba, imagen = "enemy-64x64.png", categoria = 'enemigo')



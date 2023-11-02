import wollok.game.*


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
	method opuesto() = abajo

}
 
 
object abajo inherits Direccion(nombre="Abajo"){

	override method posicion(posicion) = posicion.down(1)
	method opuesto() = arriba
}


object derecha inherits Direccion(nombre="Derecha"){

	override method posicion(posicion) = posicion.right(1)
	method opuesto() = izquierda
} 


object izquierda  inherits Direccion(nombre="Izquierda"){

	override method posicion(posicion) = posicion.left(1)
	method opuesto() = derecha
}


class Imagen {
	var property categoria=null
	var property position = game.at(0,0)
	var property imagen 

	method esAtravesable() = true

	method image() = imagen
}
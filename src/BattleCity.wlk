import wollok.game.*
import visuales.*
import direcciones.*
import personajes.*

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
		enemigo0.tiraCagon()
		configuraciones.configurarTeclas()
		}
}



object juego {

	method alPresionarUp() {
		personaje.moverse(arriba)
	}

	method alPresionarDown() {
		personaje.moverse(abajo)
	}

	method alPresionarRight() {
		personaje.moverse(derecha)
	}

	method alPresionarLeft() {
		personaje.moverse(izquierda)
	}
	method alPresionarSpace(){
		personaje.disparar()
	}
}


object configuraciones {


//	var estadoActual = juego

	method configurarTeclas() {
	
	keyboard.w().onPressDo({juego.alPresionarUp()})
	keyboard.s().onPressDo({juego.alPresionarDown()})
	keyboard.d().onPressDo({juego.alPresionarRight()})
	keyboard.a().onPressDo({juego.alPresionarLeft()})
	keyboard.space().onPressDo({juego.alPresionarSpace()})
	}

//	method cambiarEstado(nuevoEstado) {
//			estadoActual = nuevoEstado
//	}
}



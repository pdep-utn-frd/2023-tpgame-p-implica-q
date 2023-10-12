import wollok.game.*
import visuales.*
import direcciones.*
import personajes.*

object launch{
	method iniciar(){
		game.clear()
		game.ground("mapavacio.png")		
		paredes.generarParedesLevel1()
		paredes.generarParedHierroLevel1()
		game.addVisual(personaje)
		game.addVisual(enemigo0)
		enemigo0.moverse()
		enemigo0.tiraCagon()
		configuraciones.configurarTeclas()
		}
	method gameOver(){
		game.clear()
		game.boardGround("GameOver.png")
		juego.alPresionarQ()
	}
}


object pantalla {
	method iniciar(){
		game.title("Battle City")
		game.width(12)
		game.height(12)
		game.cellSize(64)
		game.ground("mapavacio.png")
		game.addVisual(inicio)
		juego.alPresionarEnter()
		juego.alPresionarQ()	
	}
}

object inicio {
	
var property position = game.at(0, 0)
	method image() = "Inicio.png"
	method enter() {
		keyboard.enter().onPressDo{launch.iniciar()}
	}	
	method q() {
		keyboard.q().onPressDo{game.stop()}
	}

}


object juego {
	
	method alPresionarEnter() {
		inicio.enter()
	}
	
	method alPresionarQ() {
		inicio.q()
	}

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



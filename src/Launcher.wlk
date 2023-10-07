import wollok.game.*
import Main.*

object juego{
	method iniciar(){
		game.title("Battle City")
		game.width(25)
		game.height(18)
		game.cellSize(64)
		game.ground("mapavacio.png")		
		muros.cargarMuros()
		movimiento.configurarFlechas()
		game.addVisualCharacter(tanque)
		game.whenCollideDo(tanque, {elemento => elemento.colisionar()})
		tanque.controles()


	}
}



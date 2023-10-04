import wollok.game.*


object juego{
	
	method iniciar(){
		game.title("Battle City")
		game.width(20)
		game.height(20)
		game.ground("ground.png")
		game.addVisualCharacter(tank)
		game.addVisual(enemigo)
		game.addVisual(pared)
	}
	
	method teclas() {
	keyboard.up().onPressDo{ tank.subir()}
	keyboard.down().onPressDo{ tank.bajar()}
	keyboard.left().onPressDo{ tank.izquierda()}
	keyboard.right().onPressDo{ tank.derecha()}
	}
}
object pared{
	method image() = "cubo-64x64.png"
	method position() = game.center().left(5).up(-5)
	//hay que cambiar tamaños, agregar mas y agregar colision 
}

object tank{
	var property position = game.origin()
	method image() = "character-64x64.png"
	
	method subir() {
		position = position.up(1)
	}
	method bajar() {
		position = position.down(1)
	}
	method derecha() {
		position = position.right(1)
	}
	
	method izquierda() {
		position = position.left(1)	
	}
	//hay que agregar imagenes de tanque cuando mira para otros lados 
	//cuando apretas izquierda debe cambiar a una foto con el tanque mirando a izq pero no se como hacerlo
}

object enemigo{
	var property position = game.center()
	method image() = "enemy-64x64.png"
}
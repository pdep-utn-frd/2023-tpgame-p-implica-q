import wollok.game.*


object juego{
	
	method iniciar(){
		game.title("Battle City")
		game.width(10)
		game.height(10)
		game.ground("ground.png")
		game.addVisualCharacter(tank)
		game.addVisual(enemigo)
		game.addVisual(pared)
		
		
		keyboard.w().onPressDo{ tank.subir()}
		keyboard.s().onPressDo{ tank.bajar()}
		keyboard.a().onPressDo{ tank.izquierda()}
		keyboard.d().onPressDo{ tank.derecha()}
		keyboard.l().onPressDo({ tank.disparaDer() })
		keyboard.j().onPressDo({tank.disparaIzq()})
		keyboard.i().onPressDo({tank.disparaUp()})
		keyboard.k().onPressDo({tank.disparaDo()})
		game.whenCollideDo(tank,{algo => algo.muerto()})
	}
}

object pared{
	method image() = "cubo-64x64.png"
	method position() = game.center().left(5).up(5)
	method muerto(){
		game.removeVisual(self)
	}
	//hay que agregar mas y agregar colision 
}

object tank{
	//el tanque se va fuera de los margenes, no se como arreglarlo
	var property position = game.origin()
	method image() = "character-64x64.png"
	
	method subir() { position = position.up(1) }

	method bajar() { position = position.down(1) }

	method derecha() { position = position.right(1) }

	method izquierda() { position = position.left(1) }
	
	method disparaDer(){
		const bala = new bala(position = position.right(1))
		game.addVisual(bala)
		bala.desplazarseDer()
	}
	method disparaIzq(){
		const bala = new bala(position = position.left(1))
		game.addVisual(bala)
		bala.desplazarseIzq()
	}
	method disparaUp(){
		const bala = new bala(position = position.up(1))
		game.addVisual(bala)
		bala.desplazarseUp()
	}
	method disparaDo(){
		const bala = new bala(position = position.down(1))
		game.addVisual(bala)
		bala.desplazarseDo()
	}

}
class bala{
	var position
	method image() = "cubo-32x32.png" //busca una imagen de bala
	method position()= position
	
	method desplazarseDer(){
		game.onCollideDo(self,{algo=>algo.muerto()})
		game.onTick(500,"balad",{self.moverseDerecha()})
	}
	method moverseDerecha() {
		position = position.right(1)
		if(position.x() > game.width()){
			game.removeTickEvent("balad")
			game.removeVisual(self)
		}
	}
	
	method desplazarseIzq(){
	game.onCollideDo(self,{algo=>algo.muerto()})
	game.onTick(500,"balai",{self.moverseIzq()})
	}
	method moverseIzq() {
		position = position.left(1)
		if(position.x() > game.width()){
			game.removeTickEvent("balai")
			game.removeVisual(self)
		}
	}
	
	method desplazarseUp(){
	game.onCollideDo(self,{algo=>algo.muerto()})
	game.onTick(500,"balau",{self.moverseUp()})
	}
	method moverseUp() {
		position = position.up(1)
		if(position.x() > game.height()){
			game.removeTickEvent("balau")
			game.removeVisual(self)
		}
	}
	
	method desplazarseDo(){
	game.onCollideDo(self,{algo=>algo.muerto()})
	game.onTick(500,"balaDo",{self.moverseDo()})
	}
	method moverseDo() {
		position = position.down(1)
		if(position.x() > game.height()){
			game.removeTickEvent("balaDo")
			game.removeVisual(self)
		}
	}
}

object enemigo{//falta animarlo para que te persiga
	var property position = game.center()
	method image() = "enemy-64x64.png"
	method muerto(){
		game.removeVisual(self)
	}
}
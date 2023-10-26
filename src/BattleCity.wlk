import wollok.game.*
import visuales.*
import direcciones.*
import personajes.*

object launch{
	var property position
	var property enemigosSimples = 1
	var property enemigosDificiles = 1
	var property kills = 0
	
//	const enemigo0 = new Enemigo(vida = 1,position = self.randomPos(), orientacion = arriba, imagen = "EnemigoArriba.png", categoria = 'enemigo')
//
//	const granenemigo0 = new GranEnemigo(vida = 4, position = self.randomPos() , orientacion = abajo, imagen = "GranEnemigoAbajo.png", categoria = 'granenemigo'  )
//	
	
	method level1(){
		game.clear()
		game.ground("mapavacio.png")		
		paredes.generarParedesLevel1()
		paredes.generarParedHierroLevel1()
		game.addVisual(personaje)
		personaje.reiniciar()
		game.addVisual(corazon)
		game.addVisual(contadorVidas)
		game.addVisual(testKills)
//		enemigo0.reiniciar()
//		granenemigo0.reiniciar()
//		game.addVisual(enemigo0)
//		game.addVisual(granenemigo0)
		game.onTick(5000, 'generarEnemigo', { self.cambiaLvl() self.spawnear() 
		})
		self.spawnear()
//		enemigo0.moverse()
//		enemigo0.tiraCagon()
//		granenemigo0.moverse()
//		granenemigo0.tiraCagon()
		configuraciones.configurarTeclas()
		self.cambiaLvl()
		}
	
	method level2(){
		game.clear()
		kills =0
		game.ground("mapavacio.png")
		paredes.generarParedesLevel2()
		paredes.generarParedHierroLevel2()
		paredes.generarAguaLevel2()
		game.addVisual(personaje)
		personaje.reiniciar()
		game.addVisual(corazon)
		game.addVisual(contadorVidas)
		game.addVisual(testKills)
		game.onTick(5000, 'generarEnemigo', { self.spawnear() self.win()
		})
		self.spawnear()	
		configuraciones.configurarTeclas()		
	}
	
	method cambiaLvl(){
		if (kills == 4 ){
		self.level2()
		}
	}
	method win(){
		if (kills == 4){
		game.clear()
		game.addVisual(win)
		juego.alPresionarQ()
		juego.alPresionarEnter()
		enemigosSimples = 1
		enemigosDificiles = 1
		kills = 0
		}
	}
	method gameOver(){
		game.clear()
		game.addVisual(gameover)
		juego.alPresionarQ()
		juego.alPresionarEnter()
		enemigosSimples = 1
		enemigosDificiles = 1
		kills = 0
	}
	
	method randomPos(){
		const x = (0 .. game.width() - 2).anyOne()
		const y = game.height() - 1
		position = game.at(x, y)
		
		return position
	}
	
	method spawnear(){
		if (enemigosSimples <= 1 and enemigosDificiles <=1){
			new Enemigo(vida =1 ,imagen="EnemigoAbajo.png").config() 
			new GranEnemigo(vida =4 ,imagen="GranEnemigoAbajo.png").config() 
			enemigosSimples += 1
			enemigosDificiles +=1
		}
	}
	
	method MuereEnemigosSimples(){
		enemigosSimples -= 1
	}
	
	method MuereEnemigosDificles(){
		enemigosDificiles -= 1
	}
	method contarKills(){
		kills = kills + 1
		testKills.cambiarImagen()
	}
}


object pantalla {
	method iniciar(){
		game.title("Battle City")
		game.width(26)
		game.height(26)
		game.cellSize(32)
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
		keyboard.enter().onPressDo{launch.level1()}
	}	
	method q() {
		keyboard.q().onPressDo{game.stop()}
	}

}
object win{
	var property position = game.at(0, 0)
	method image() = "logo.png"
}
object gameover {
var property position = game.at(0, 0)
	method image() = "Gameover.png"
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



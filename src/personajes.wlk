import wollok.game.*
import direcciones.*
import visuales.*
import BattleCity.*

class Individuo inherits Imagen {
	var property orientacion = derecha
	
	var property vida
	
	override method esAtravesable() = false	

	method moverse(direccion) {
		self.moverHaciaSiSePuede(self, direccion)
	}

	method moverHaciaSiSePuede(individuo, direccion) {
		if (direccion.puedeIr(individuo)) {
			self.moverHacia(individuo, direccion)
		}
	}
	
	method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
			game.removeTickEvent("disparar")
		}
	}

	method bajarVida(){
		vida -= 1
		if (self.vida() == 0){
			self.desaparecer()
		}
	}
	
	method impactoConBala(){
		self.bajarVida()
	}

	method puedeMoverse(posicion) = posicion.allElements().all({ objeto => objeto.esAtravesable() })

	method moverHacia(individuo, direccion) {
		const nuevaPosicion = direccion.posicion(individuo.position())
		if (self.puedeMoverse(nuevaPosicion)) {
			individuo.orientacion(direccion)
			individuo.position(nuevaPosicion)
		}
		else{
			individuo.orientacion(direccion)
		}

	}
	
	method disparar(){
		const bala = new Bala(position = self.position(), imagen ="bala.png")
		game.addVisual(bala)
		bala.desplazarse(orientacion.nombre())	
		game.whenCollideDo(bala, {elemento => elemento.impactoConBala() 
												bala.impacto()
												//game.addVisual(explosion)
												//borra la explosion despues pero hace que se vea un poco
										})	
	}
	//metodo impacto con bala que baja la vida, mismo para el enemigo

}

object personaje inherits Individuo (vida = 5, position = game.at(1, 1), imagen = "tank-64x64.png"){
	
	override method bajarVida(){
		vida -= 1
		if (self.vida() == 0){
			launch.gameOver()
		}
	}
	
	method reiniciar(){
		vida = 5
	}

	override method image(){
		return 'tank' + orientacion.nombre() + '.png'
	}	

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

	override method image(){
		var colores = ["gris","rojo","verde"]//agregar fotos de colores 
		return 'Enemigo' + orientacion.nombre()  + '.png' 
	}
	//+ colores.AnyOne()
	method tiraCagon(){
		game.onTick(1800, "disparar",{self.disparar()})
	}
	
}


const enemigo0 = new Enemigo(vida = 1, position = game.at(5, 6), orientacion = arriba, imagen = "EnemigoArriba.jpg", categoria = 'enemigo')







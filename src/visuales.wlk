import wollok.game.*
import BattleCity.*
import direcciones.*
import personajes.*

class Pared{
	var property image ='cubo-64x64.png'
	var property position
	method esAtravesable() = false	
	
	method desaparecer() {
		if(game.hasVisual(self)){
			game.removeVisual(self)
		}
	}

	method impactoConBala(){
		self.desaparecer()
	}

}

class Hierro inherits Pared{
		override method impactoConBala(){
			
		}
	
}

//crear un bloque que no se puede romper, con otra textura
//object paredes{
//	method generarParedes(){
//		game.addVisual(new Pared(position = game.at(2,0)))
//		game.addVisual(new Pared(position = game.at(2,1)))
//		game.addVisual(new Pared(position = game.at(2,2)))
//		game.addVisual(new Pared(position = game.at(2,3)))
//		game.addVisual(new Pared(position = game.at(2,4)))
//		game.addVisual(new Pared(position = game.at(2,5)))
//		game.addVisual(new Pared(position = game.at(2,6)))
//	}
//}


//idea de lo que hay que hacer

object paredes{
	
	method generarParedesLevel1(){

	
		const posParedes = []
//		[2,6,10,14,15,16,17,18,19,21,22,23].forEach{n => posParedes.add(new Position(x=n, y=25))}
//		[2,3,4,5,6,8,10,12,13,14,17,19,21].forEach{n => posParedes.add(new Position(x=n, y=24))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=23))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=22))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=21))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=20))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=19))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=18))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=17))}
		[2, 3, 6, 7, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=16))}		
		[2, 3, 6, 7, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[10, 11, 14, 15].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[10, 11, 14, 15].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[0, 1, 4, 5, 6, 7, 18, 19, 20, 21, 24, 25].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[4, 5, 6, 7, 18, 19, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[10, 11, 14, 15].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[10, 11, 12, 13, 14, 15].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[2, 3, 6, 7, 10, 11, 12, 13, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[2, 3, 6, 7, 10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[2, 3, 6, 7, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2, 3, 6, 7, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2, 3, 6, 7, 11, 12, 13, 14, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[11, 14].forEach{n => posParedes.add(new Position(x=n, y=1))}
		[11, 14].forEach{n => posParedes.add(new Position(x=n, y=0))}
		
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }	
	}	
	method generarParedHierroLevel1(){
		const posParedes = []
		[12, 13].forEach{n => posParedes.add(new Position(x=n, y=18))}// bloque de metal
		[0, 1, 24, 25].forEach{n => posParedes.add(new Position(x=n, y=11))}// bloque de metal
		posParedes.forEach { p => self.dibujar(new Hierro(position = p,image ="SteelBlock-64x64.png" )) }
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
	}
	
}

class Bala inherits Imagen{
	
	override method position() = position
	
	method desplazarse(direccion){
		if (direccion  == "Arriba"){
			position = position.up(1)
			game.onTick(100,"bala",{self.moverseArriba()})
		}
		else if (direccion == "Abajo"){
			position = position.down(1)
			game.onTick(100,"bala",{self.moverseAbajo()})
		}
		else if (direccion =="Izquierda"){
			position = position.left(1)
			game.onTick(100,"bala",{self.moverseIzq()})
		}
		else{
			position = position.right(1)
			game.onTick(100,"bala",{self.moverseDerecha()})
		}
			
	}
	method moverseDerecha() {
		position = position.right(1)
		if(position.x() > game.width()){
			game.removeTickEvent("bala")
			game.removeVisual(self)
		}
	
	}
	method moverseIzq() {
		position = position.left(1)
		if(position.x() > game.width()){
			game.removeTickEvent("bala")
			game.removeVisual(self)
		}
		
	}
	method moverseArriba() {
		position = position.up(1)
		if(position.y() > game.height()){
			game.removeTickEvent("bala")
			game.removeVisual(self)
		}
	
	}
	method moverseAbajo() {
		position = position.down(1)
		if(position.x() > game.height()){
			game.removeTickEvent("bala")
			game.removeVisual(self)
		}
		
	}	
	
	method impacto(){
		if(game.hasVisual(self)){
			game.removeTickEvent("bala")
			game.removeVisual(self)
		}
	
	}
	method ImpactoConBala(){
		
	}
	
}
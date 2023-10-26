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

	method impactoConBala(bala){
		self.desaparecer()
		bala.impacto()
	}

}

class Hierro inherits Pared{
	override method impactoConBala(bala){
		bala.impacto()
	}
}

class Agua inherits Pared{
	override method impactoConBala(bala){
		
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
	
	method generarParedesLevel2(){
		
		const posParedes = []
		[2, 3, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=23))}
		[2, 3, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=22))}
		[2, 3, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=21))}
		[2, 3, 12, 13, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=20))}
		[6, 7].forEach{n => posParedes.add(new Position(x=n, y=19))}
		[6, 7].forEach{n => posParedes.add(new Position(x=n, y=18))}
		[6, 7, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=17))}
		[6, 7, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[10, 11].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[10, 11].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[2, 3, 4, 5, 6, 7, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[2, 3, 4, 5, 6, 7, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[10, 11, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[2, 3, 10, 11, 14, 15, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[2, 3, 10, 11, 14, 15, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=8))}
		[2, 3, 6, 7, 10, 11, 12, 13, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=7))}
		[2, 3, 6, 7, 10, 11, 12, 13, 14, 15, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=6))}
		[2, 3, 6, 7, 10, 11, 12, 13, 14, 15].forEach{n => posParedes.add(new Position(x=n, y=5))}
		[2, 3, 6, 7].forEach{n => posParedes.add(new Position(x=n, y=4))}
		[2, 3, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=3))}
		[2, 3, 11, 12, 13, 14, 18, 19, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=2))}
		[2, 3, 6, 7, 11, 14, 18, 19, 20, 21, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=1))}
		[2, 3, 6, 7, 11, 14, 18, 19, 20, 21, 22, 23].forEach{n => posParedes.add(new Position(x=n, y=0))}
		
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }
	}
	method generarParedHierroLevel2(){
		const posParedes = []
		[6, 7].forEach{n => posParedes.add(new Position(x=n, y=23))}
		[6, 7].forEach{n => posParedes.add(new Position(x=n, y=22))}
		[20, 21].forEach{n => posParedes.add(new Position(x=n, y=21))}
		[20, 21].forEach{n => posParedes.add(new Position(x=n, y=20))}
		[18, 19].forEach{n => posParedes.add(new Position(x=n, y=19))}
		[18, 19].forEach{n => posParedes.add(new Position(x=n, y=18))}
		[12, 13, 24, 25].forEach{n => posParedes.add(new Position(x=n, y=17))}
		[12, 13, 24, 25].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[16, 17].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[16, 17].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[14, 15].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[14, 15].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[6, 7].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[6, 7].forEach{n => posParedes.add(new Position(x=n, y=10))}
		[0, 1, 6, 7].forEach{n => posParedes.add(new Position(x=n, y=9))}
		[0, 1, 6, 7].forEach{n => posParedes.add(new Position(x=n, y=8))}
		posParedes.forEach { p => self.dibujar(new Hierro(position = p,image ="SteelBlock-64x64.png" )) }
	}
	method generarAguaLevel2(){
		const posParedes = []
		[0, 1, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=17))}
		[0, 1, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=16))}
		[0, 1, 2, 3, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=15))}
		[0, 1, 2, 3, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=14))}
		[8, 9, 10, 11, 12, 13, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=13))}
		[8, 9, 10, 11, 12, 13, 20, 21].forEach{n => posParedes.add(new Position(x=n, y=12))}
		[8, 9].forEach{n => posParedes.add(new Position(x=n, y=11))}
		[8, 9].forEach{n => posParedes.add(new Position(x=n, y=10))}
		posParedes.forEach { p => self.dibujar(new Agua(position = p,image ="Agua.png" )) }
	}
}

class Bala inherits Imagen{
	
	var property material= "bala"
	
	override method position() = position
	
	method desplazarse(direccion){
		if (direccion  == "Arriba"){
			position = position.up(1)
			game.onTick(50,"bala",{self.moverseArriba()})
		}
		else if (direccion == "Abajo"){
			position = position.down(1)
			game.onTick(50,"bala",{self.moverseAbajo()})
		}
		else if (direccion =="Izquierda"){
			position = position.left(1)
			game.onTick(50,"bala",{self.moverseIzq()})
		}
		else{
			position = position.right(1)
			game.onTick(50,"bala",{self.moverseDerecha()})
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
	method impactoConBala(bala){
		bala.impacto()
		if(game.hasVisual(self)){
			game.removeTickEvent("bala")
			game.removeVisual(self)
		}
	}
	
}

object contadorVidas inherits Imagen(imagen = "5.png", position = game.at(24,25)){
	method cambiarImagen(){
		if (personaje.vida() == 5){
			imagen = "5.png"
		}
		else if (personaje.vida() == 4){
			imagen = "4.png"
		}
		else if (personaje.vida() == 3){
			imagen = "3.png"
		}
		else if (personaje.vida() == 2){
			imagen = "2.png"
		}
		else{
			imagen = "1.png"
		}
	}
	method impactoConBala(bala){
		
	}
}

object testKills inherits Imagen(imagen = "1.png", position = game.at(23,25)){
	method cambiarImagen(){
		if (launch.kills() == 0){
			imagen = "SteelBlock-64x64.png"
		}
		else if (launch.kills() == 1){
			imagen = "1.png"
		}
		else if (launch.kills() == 2){
			imagen = "2.png"
		}
		else if (launch.kills() == 3){
			imagen = "3.png"
		}
		else imagen = "4.png"
	}
}

object corazon inherits Imagen(imagen = "corazon.png", position = game.at(25,25)){
	method impactoConBala(bala){
		
	}
}
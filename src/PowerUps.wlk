import wollok.game.*
import rugby.*
import personajes.*

class PowerUps{
	var property position = game.at(1,9)
	
	method generar() {
		if (!game.hasVisual(self))
		game.addVisual(self)
	}
	
	method chocar() {
		game.removeVisual(self)
	}
		 
}

class Reloj inherits PowerUps {
	var property image = "Imagenes/Reloj.png"
	
	override method chocar() {
		super()
		reloj.sumarTiempo()
	}
}

class Ralentizar inherits PowerUps {
	var property image = "Imagenes/moco2.png"
 	override method chocar() {
		super()
		juego.reducirVelocidadEnemigos()
	}

}

class Dash inherits PowerUps {
	var property image = "Imagenes/dash.png"
	
	override method chocar() {
		super()
	    player.dash()	
	}
}

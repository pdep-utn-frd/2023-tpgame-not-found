import wollok.game.*
import rugby.*
import personajes.*

class PowerUps{
	var property position = game.at(1.randomUpTo(8),3.randomUpTo(11))
	
	method generar() {
		if (!game.hasVisual(self))
		game.addVisual(self)
		position = game.at(1.randomUpTo(8),3.randomUpTo(11))
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
		game.sound("Sonidos/Tiempo.mp3").play()
	}
}

class Ralentizar inherits PowerUps {
	var property image = "Imagenes/moco2.png"
 	override method chocar() {
		super()
		juego.reducirVelocidadEnemigos()
		game.sound("Sonidos/Ralentizo.mp3").play()
	}

}

class Dash inherits PowerUps {
	var property image = "Imagenes/dash.png"
	
	override method chocar() {
		super()
	    player.dash()
	    game.sound("Sonidos/Dash.mp3").play()
	}
}

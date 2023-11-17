import wollok.game.*
import rugby.*

object player {
	const posicionInicial = game.at(4,12)
	var position = posicionInicial
	var property image = "Imagenes/Jugador2.png"
	
	method iniciar() {
		position = posicionInicial
		self.image()
	}
	
	
	method image() = image

	method position()= position
	
	method bajar(){
		position = position.down(1)
	}
	
	method subir(){
		position = position.up(1)
	}
	
	method izquierda(){
		position = position.left(1)
	}
	
	method derecha(){
		position = position.right(1)
	}

}

//PANTALLA DE INICIO
object inicio {
	method position() = game.at(0,0)
	method image() = "Imagenes/Inicio.jpg"
}

// PANTALLA DEL JUEGO
object pjuego {
	method position() = game.at(0,0)
	method image() = "Imagenes/pantaa1.png"
}

class Final {
	const property position 
	method image() = "Imagenes/barrera.png"
	
	method chocar() {
		juego.terminar()
	}
}

object win {
	method position() = game.at(1,3)
	method image() = "Imagenes/Win.png"
}

class Enemigo {
	var property positionInicial
	var property position = positionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method position() = position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
		position = position.right((-1).randomUpTo(2))
	}
	
	method reiniciar() {
		position = positionInicial
	}
}

object gameOver {
	method position() = game.at(1,4)
	method image() = "Imagenes/Game Over.png"
} 

class Limite {
	var property position
	
	method position() = position
	
	method chocar() {
		if (player.position().x() < 3) {
		player.derecha()
		} else {
			player.izquierda()
		}
	}
	
}

object reloj {
	
	var property tiempo = 100
	
	method text() = tiempo.toString()
	method position() = game.at(1, game.height()-1)
	method textColor() = "ffffff"
	
	method pasarTiempo() {
		if (tiempo > 0) {
		tiempo = tiempo -1
	} else {
		juego.gameOver()
		}
	}
	
	method iniciar(){
		tiempo = 100
		game.onTick(70,"tiempo",{self.pasarTiempo()})
	}
	
	method detener(){
		game.removeTickEvent("tiempo")
	}
	
	method sumarTiempo() {
		tiempo += 25
	}	
}
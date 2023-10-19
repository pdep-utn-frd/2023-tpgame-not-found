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
	method image() = "Imagenes/Inicio2.jpg"
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
	method position() = game.at(1,5)
	method image() = "Imagenes/Win2.png"
}


object enemigo1 {
	const posicionInicial = game.at(0,1)
	var property position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
			position = position.up(1)	
	}
	
	method iniciar() {
		position = posicionInicial
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo2 {
	const posicionInicial = game.at(1,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
		position = position.right(1)
	}
	
	method iniciar() {
		const y = 0.randomUpTo(7)
		position = game.at(0,y)
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo3 {
	const posicionInicial = game.at(2,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
	}
	
	method iniciar() {
		position = posicionInicial
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo4 {
	const posicionInicial = game.at(3,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
	}
	
	method iniciar() {
		position = posicionInicial
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo5 {
	const posicionInicial = game.at(4,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
	}
	
	method iniciar() {
		position = posicionInicial
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo6 {
	const posicionInicial = game.at(5,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
	}
	
	method iniciar() {
		position = posicionInicial
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo7 {
	const posicionInicial = game.at(6,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
		
	}
	
	method iniciar() {
		position = posicionInicial
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

object enemigo8 {
	const posicionInicial = game.at(7,2)
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
		position = position.left(1)
	}
	
	method iniciar() {
		const y = 0.randomUpTo(7)
		position = game.at(8,y)
		
	}
	
	method reiniciar() {
		position = posicionInicial
	}
}

class Enemigo {
	var property position
	var property image
	
	method image() = image
	
	method position()= position
	
	method chocar() {
		juego.gameOver()
	}
	
	method moverse() {
		position = position.up(1)
		position = position.left(1)
	}
}

object gameOver {
	method position() = game.at(1,5)
	method image() = "Imagenes/Game Over2.png"
} 

class Limite {
	var property position
	
	method position() = position
	
	method chocar() {
		game.say(player,"jujuu")
	}
	
}
import wollok.game.*

object juego{
	method configurar(){
		game.height(14)
		game.width(9)
		game.addVisual(inicio)
		game.title("Rugby Game")	
		
		keyboard.enter().onPressDo{self.jugar()}
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method jugar() {
		game.removeVisual(inicio)
		self.iniciar()
	}
	
	method iniciar() {
		var final = [new Position(x=0,y=1),new Position(x=1,y=1),new Position(x=2,y=1),new Position(x=3,y=1),new Position(x=4,y=1),new Position(x=5,y=1)].map{p=> self.dibujar(new Final(position = p))}
		game.addVisual(pjuego)
		game.addVisual(player)
		game.schedule(1000,{game.addVisual(enemigo1)})
		/*game.onTick(10000,"",{enemigo1.iniciar()})
		game.onTick(5000,"",{game.addVisual(enemigo2)})
		game.onTick(7100,"",{game.addVisual(enemigo3)})
		game.onTick(1800,"",{game.addVisual(enemigo4)})
		game.onTick(9000,"",{game.addVisual(enemigo5)})
		game.onTick(15000,"",{game.addVisual(enemigo6)})
		game.onTick(20000,"",{game.addVisual(enemigo7)})
		game.onTick(5000,"",{game.addVisual(enemigo8)})*/
		game.onCollideDo(player,{ obstaculo => obstaculo.chocar()})
		game.onTick(2000, "movimiento", { enemigo1.moverse() })
		/*game.onTick(1000, "movimiento", { enemigo2.moverse() })
		game.onTick(1500, "movimiento", { enemigo3.moverse() })
		game.onTick(2500, "movimiento", { enemigo4.moverse() })
		game.onTick(2500, "movimiento", { enemigo5.moverse() })
		game.onTick(2500, "movimiento", { enemigo6.moverse() })	
		game.onTick(2500, "movimiento", { enemigo7.moverse() })
		game.onTick(2500, "movimiento", { enemigo8.moverse() })*/
		self.ejecutarPJ()

		player.iniciar()

//TECLADO
		keyboard.up().onPressDo{player.subir()}
		keyboard.left().onPressDo{player.izquierda()}
		keyboard.down().onPressDo{player.bajar()}
		keyboard.right().onPressDo{player.derecha()}
		keyboard.r().onPressDo{self.reiniciar()}
	}
	
	method ejecutarPJ() {
		//game.onTick(23000,"",{game.removeVisual(enemigo1)})
		game.onTick(24000,"",{enemigo1.iniciar()})
//		game.onTick(2000, "movimiento", { enemigo1.moverse() })
	}
	
	method terminar() {
		game.addVisual(win)
		game.removeVisual(player)
	}
	
	method reiniciar() {
		game.removeVisual(win)
		game.removeVisual(gameOver)
		game.clear()
		self.iniciar()
	}
	
	method gameOver() {
		game.addVisual(gameOver)
		game.removeVisual(player)
	}
}

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
	var position = posicionInicial
	var property image = "Imagenes/Jugador3a.png"
	var property vivo = false
	
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
		/*if (!vivo) {
			game.addVisual(self)
			vivo = true
		}*/
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
	}
}

object gameOver {
	method position() = game.at(1,5)
	method image() = "Imagenes/Game Over2.png"
} 

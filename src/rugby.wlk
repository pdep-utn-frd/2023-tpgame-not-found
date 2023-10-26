import wollok.game.*
import personajes.*

object juego{
	var enemigos = []

	method configurar(){
		game.height(14)
		game.width(9)
		game.addVisual(inicio)
		game.title("Rugby Game")	
		
		keyboard.enter().onPressDo{self.removerInicio()}
	}
	
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	
	method removerInicio() {
		game.removeVisual(inicio)
		self.iniciar()
	}
	
	method iniciar() {
		var final = [new Position(x=0,y=1),new Position(x=1,y=1),new Position(x=2,y=1),new Position(x=3,y=1),new Position(x=4,y=1),new Position(x=5,y=1),new Position(x=6,y=1),new Position(x=7,y=1),new Position(x=8,y=1)].map{p=> self.dibujar(new Final(position = p))}
		game.addVisual(pjuego)
		game.addVisual(player)
		game.addVisual(reloj)
		reloj.iniciar()
		// Realizar metodo que inicialize todos los enemigos de una
		// Realizar un onTick o funcion cada vez que choquen volver a iniciarlo
		self.iniciarEnemigos()
		enemigos.forEach{enemigo=>game.addVisual(enemigo)}
		//var enemigos = [new Position(x=2,y=2),new Position(x=3,y=2),new Position(x=4,y=2),new Position(x=5,y=2),new Position(x=6,y=2),new Position(x=7,y=2),new Position(x=8,y=2),new Position(x=9,y=2)].map{p=> self.dibujar(new Enemigo(position = p))}
		const limites = [new Position(x=-1,y=0),new Position(x=-1,y=1),new Position(x=-1,y=2),new Position(x=-1,y=3),new Position(x=-1,y=4),new Position(x=-1,y=5),new Position(x=-1,y=6),new Position(x=-1,y=7),new Position(x=-1,y=8),new Position(x=-1,y=9),new Position(x=-1,y=10),new Position(x=-1,y=11),new Position(x=-1,y=12),new Position(x=-1,y=13),new Position(x=-1,y=14),
						new Position(x=9,y=0),new Position(x=9,y=1),new Position(x=9,y=2),new Position(x=9,y=3),new Position(x=9,y=4),new Position(x=9,y=5),new Position(x=9,y=6),new Position(x=9,y=7),new Position(x=9,y=8),new Position(x=9,y=9),new Position(x=9,y=10),new Position(x=9,y=11),new Position(x=9,y=12),new Position(x=9,y=13),new Position(x=9,y=14)
						].map{p=> self.dibujar(new Limite(position = p))}
		game.onCollideDo(player,{ obstaculo => obstaculo.chocar()})
		game.onTick(400, "movimiento", { enemigos.forEach{enemigo=>enemigo.moverse()}})
		//self.ejecutarPJ()
		self.configurarControles()

		player.iniciar()
	}
//TECLADO
	method configurarControles(){
		keyboard.up().onPressDo{player.subir()}
		keyboard.left().onPressDo{player.izquierda()}
		keyboard.down().onPressDo{player.bajar()}
		keyboard.right().onPressDo{player.derecha()}
		keyboard.r().onPressDo{self.reiniciar()}
	}
	
	/*method ejecutarPJ() {
		game.onTick(24000,"",{enemigo1.iniciar()})
		game.onTick(4000,"",{enemigo2.iniciar()})
		game.onTick(14000,"",{enemigo3.iniciar()})
		game.onTick(14000,"",{enemigo4.iniciar()})
		game.onTick(14000,"",{enemigo5.iniciar()})
		game.onTick(14000,"",{enemigo6.iniciar()})
		game.onTick(15000,"",{enemigo7.iniciar()})
		game.onTick(4800,"",{enemigo8.iniciar()})
	}*/
	
	method terminar() {
		game.addVisual(win)
		game.removeVisual(player)
		reloj.detener()
	}
	
	method reiniciar() {
		game.clear()
		enemigo1.reiniciar()
		enemigo2.reiniciar()
		enemigo3.reiniciar()
		enemigo4.reiniciar()
		enemigo5.reiniciar()
		enemigo6.reiniciar()
		enemigo7.reiniciar()
		enemigo8.reiniciar()
		self.iniciar()
	}
	
	method gameOver() {
		reloj.detener()
		game.addVisual(gameOver)
		game.removeVisual(player)
	}
	
	method iniciarEnemigos() {
		enemigos.add(new Enemigo(position = game.at(2,2)))
		enemigos.add(new Enemigo(position = game.at(3,2)))
		enemigos.add(new Enemigo(position = game.at(4,2)))
		enemigos.add(new Enemigo(position = game.at(5,2)))
		enemigos.add(new Enemigo(position = game.at(6,2)))
		enemigos.add(new Enemigo(position = game.at(7,2)))
		enemigos.add(new Enemigo(position = game.at(8,2)))
	}
}



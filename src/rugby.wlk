import wollok.game.*
import personajes.*

object juego{

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
		var final = [new Position(x=0,y=1),new Position(x=1,y=1),new Position(x=2,y=1),new Position(x=3,y=1),new Position(x=4,y=1),new Position(x=5,y=1)].map{p=> self.dibujar(new Final(position = p))}
		game.addVisual(pjuego)
		game.addVisual(player)
		game.schedule(1000,{game.addVisual(enemigo1)})
		game.schedule(1500,{game.addVisual(enemigo2)})
		game.schedule(1250,{game.addVisual(enemigo3)})
		game.schedule(1700,{game.addVisual(enemigo4)})
		game.schedule(3000,{game.addVisual(enemigo5)})
		game.schedule(2200,{game.addVisual(enemigo6)})
		game.schedule(2500,{game.addVisual(enemigo7)})
		game.schedule(500,{game.addVisual(enemigo8)})
		/*game.onTick(10000,"",{enemigo1.iniciar()})
		game.onTick(5000,"",{game.addVisual(enemigo2)})
		game.onTick(7100,"",{game.addVisual(enemigo3)})
		game.onTick(1800,"",{game.addVisual(enemigo4)})
		game.onTick(9000,"",{game.addVisual(enemigo5)})
		game.onTick(15000,"",{game.addVisual(enemigo6)})
		game.onTick(20000,"",{game.addVisual(enemigo7)})
		game.onTick(5000,"",{game.addVisual(enemigo8)})*/
		game.onCollideDo(player,{ obstaculo => obstaculo.chocar()})
		game.onTick(1500, "movimiento", { enemigo1.moverse() })
		game.onTick(500, "movimiento", { enemigo2.moverse() })
		game.onTick(1500, "movimiento", { enemigo3.moverse() })
		game.onTick(2500, "movimiento", { enemigo4.moverse() })
		game.onTick(2500, "movimiento", { enemigo5.moverse() })
		game.onTick(2500, "movimiento", { enemigo6.moverse() })	
		game.onTick(2500, "movimiento", { enemigo7.moverse() })
		game.onTick(2500, "movimiento", { enemigo8.moverse() })
		self.ejecutarPJ()
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
	
	method ejecutarPJ() {
		//game.onTick(23000,"",{game.removeVisual(enemigo1)})
		game.onTick(24000,"",{enemigo1.iniciar()})
		game.onTick(4000,"",{enemigo2.iniciar()})
		game.onTick(24000,"",{enemigo3.iniciar()})
		game.onTick(24000,"",{enemigo4.iniciar()})
		game.onTick(24000,"",{enemigo5.iniciar()})
		game.onTick(24000,"",{enemigo6.iniciar()})
		game.onTick(24000,"",{enemigo7.iniciar()})
		game.onTick(24000,"",{enemigo8.iniciar()})
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



import wollok.game.*
import personajes.*
import PowerUps.*

object juego{
	var property velocidadEnemigos
	var enemigos = []
	var property powerups = []
	const powerupsPosibles = [new Reloj(),new Ralentizar(),new Dash()]

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
		self.iniciarEnemigos()
		self.iniciar()
	}
	
	method iniciar() {
		velocidadEnemigos = 300
		var final = [new Position(x=0,y=1),new Position(x=1,y=1),new Position(x=2,y=1),new Position(x=3,y=1),new Position(x=4,y=1),new Position(x=5,y=1),new Position(x=6,y=1),new Position(x=7,y=1),new Position(x=8,y=1)].map{p=> self.dibujar(new Final(position = p))}
		game.addVisual(pjuego)
		game.addVisual(player)
		game.addVisual(reloj)
		reloj.iniciar()
		enemigos.forEach{enemigo=>game.addVisual(enemigo)}
		const limites = [new Position(x=-1,y=0),new Position(x=-1,y=1),new Position(x=-1,y=2),new Position(x=-1,y=3),new Position(x=-1,y=4),new Position(x=-1,y=5),new Position(x=-1,y=6),new Position(x=-1,y=7),new Position(x=-1,y=8),new Position(x=-1,y=9),new Position(x=-1,y=10),new Position(x=-1,y=11),new Position(x=-1,y=12),new Position(x=-1,y=13),new Position(x=-1,y=14),
						new Position(x=9,y=0),new Position(x=9,y=1),new Position(x=9,y=2),new Position(x=9,y=3),new Position(x=9,y=4),new Position(x=9,y=5),new Position(x=9,y=6),new Position(x=9,y=7),new Position(x=9,y=8),new Position(x=9,y=9),new Position(x=9,y=10),new Position(x=9,y=11),new Position(x=9,y=12),new Position(x=9,y=13),new Position(x=9,y=14)
						].map{p=> self.dibujar(new Limite(position = p))}
		game.onCollideDo(player,{ obstaculo => obstaculo.chocar()})
		game.onTick(velocidadEnemigos, "movimiento", { enemigos.forEach{enemigo=>enemigo.moverse()}})
		game.onTick(5000, "Regeneracion", { enemigos.forEach{enemigo=>enemigo.reiniciar()}})
		game.onTick(2000,"GenPowerup",{powerupsPosibles.anyOne().generar()})
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
		keyboard.p().onPressDo{self.pausa()}
	}
	
	
	method terminar() {
		game.addVisual(win)
		game.removeVisual(player)
		reloj.detener()
	}
	
	method pausa() {
		
	}
	
	method reiniciar() {
		game.clear()
		enemigos.forEach{enemigo=>enemigo.reiniciar()}
		self.iniciar()
	}
	
	method gameOver() {
		reloj.detener()
		game.addVisual(gameOver)
		game.removeVisual(player)
		enemigos.forEach{enemigo=>game.removeVisual(enemigo)}
	}
	
	method iniciarEnemigos() {
		enemigos.add(new Enemigo(positionInicial = game.at(1,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(2,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(3,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(4,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(5,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(6,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(7,2)))
		enemigos.add(new Enemigo(positionInicial = game.at(8,2)))
	}
	
	method reducirVelocidadEnemigos(){
		velocidadEnemigos += 400
	}
}



import wollok.game.*
import personajes.*


object nivel1 {

	method iniciar() {
		game.addVisual(hector)
		config.configurarTeclas()
    
	}
}

object config {
    method configurarTeclas(){
        keyboard.left().onPressDo({ hector.mover(hector.position().left(1)) })
		keyboard.right().onPressDo({ hector.mover(hector.position().right(1))})
		keyboard.up().onPressDo({ hector.mover(hector.position().up(1))})
		keyboard.down().onPressDo({ hector.mover(hector.position().down(1))})
    }

}
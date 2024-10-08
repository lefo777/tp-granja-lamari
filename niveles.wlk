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
        keyboard.left().onPressDo({ (hector.position().left(1)) })
		keyboard.right().onPressDo({ (hector.position().right(1))})
		keyboard.up().onPressDo({ (hector.position().up(1))})
		keyboard.down().onPressDo({ (hector.position().down(1))})
    }

}
import wollok.game.*
import personajes.*


object nivel1 {

	method iniciar() {
		game.addVisual(hector)
		config.configurarTeclas()
    
	}
}

object config {
    const height = 10
    const width = 10
    
    method configurarTeclas(){
        keyboard.left().onPressDo({ (hector.position().left(1)) })
		keyboard.right().onPressDo({ (hector.position().right(1))})
		keyboard.up().onPressDo({ (hector.position().up(1))})
		keyboard.down().onPressDo({ (hector.position().down(1))})
    }

    method height() = height
    method width() = width
}
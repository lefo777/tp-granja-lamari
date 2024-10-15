import wollok.game.*
import personajes.*


object nivel1 {

	method iniciar() {
		game.addVisual(hector)
        game.addVisual(textoDinero)
		config.configurarTeclas()
        const regador = new Regador()
		game.addVisual(regador)
		game.onTick(1000, "REGADOR", { regador.regarCultivosAlrededor()})
    
	}
}

object config {
    const height = 10
    const width = 10
    
    method configurarTeclas(){
        keyboard.left().onPressDo({ hector.mover(hector.position().left(1)) })
		keyboard.right().onPressDo({ hector.mover(hector.position().right(1))})
		keyboard.up().onPressDo({ hector.mover(hector.position().up(1))})
		keyboard.down().onPressDo({ hector.mover(hector.position().down(1))})
        keyboard.m().onPressDo{ hector.sembrarMaiz()}
		keyboard.t().onPressDo{ hector.sembrarTrigo()}
		keyboard.o().onPressDo{ hector.sembrarTomaco()}
        keyboard.r().onPressDo{ hector.regar()}
        keyboard.c().onPressDo{ hector.cosechar()}
    }

    method height() = height
    method width() = width
}
object textoDinero{
    method text() = "$" //+ (hector.dinero).toString()
    method position()= game.at(0,9)
    method textColor() = paleta.blanco()
}

object paleta {
  const property verde = "00FF00FF"
  const property rojo = "FF0000FF"
  const property blanco = "#FFFFFF00"
}
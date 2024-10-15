import wollok.game.*
import niveles.*
import plantas.*


object hector {
    var property position = game.origin()
	const property cosechadas = []
    var dinero = 0

    method image() = "player.png"

    method mover(nuevaPosicion){
        if (nuevaPosicion.x() < config.width() && nuevaPosicion.x() >= 0 && nuevaPosicion.y() < config.height() && nuevaPosicion.y() >= 0){
            position = nuevaPosicion
        }

    }

    method regada(){game.say(self, "Me moje")}

    method validacion() = game.colliders(self).isEmpty()

	method sembrar(planta) {
		if(self.validacion()){
			game.addVisual(planta)
		}
	}
	method sembrarMaiz() {
		if(self.validacion()){
			game.addVisual(new Maiz(position = position))}
	}

	method sembrarTrigo() {
		if(self.validacion()){	
			game.addVisual(new Trigo(position = position))
		}
	}

	method sembrarTomaco() {
		if(self.validacion()){
			game.addVisual(new Tomaco(position = position))
		}
	}

    method regar() {
		if (game.colliders(self).isEmpty()) {
			game.say(self, "No hay que regar")
		} else game.uniqueCollider(self).regada()
	}

	method cosechar(){
       if(self.validacion()){
            game.say(self, "No hay nada para cosechar")
		} 
        if (game.uniqueCollider(self).esAdulto()) {
            game.removeVisual(game.uniqueCollider(self))
            cosechadas.add(game.uniqueCollider(self))
        }
    }

    method vender(){
        dinero = dinero + cosechadas.map({cosechada => cosechada.precio()}).sum()
        cosechadas.clear()
    }
}

object mercadoOrigen {
	const property position = game.origin()
	const property image = "market.png"
}

object mercadoArriba {
	const property position = game.at(9,9)
	const property image = "market.png" 
}


class Regador {
	const property position = game.center()
	const property image = "aspersor.png"

    method esAdulto(){return false}

	method regada() {
	// No pasa na'
	}

	method regarCultivosAlrededor() {
		self.cultivosAlrededor().forEach({ cultivo => cultivo.regada()})
	}

	//method cultivosAlrededor() = self.posicionesAlrededor().flatMap({ posicion => posicion.allElements() })
	method cultivosAlrededor() = self.posicionesAlrededor().flatMap({ posicion => game.getObjectsIn(posicion)})
	method laterales() = [ position.up(1), position.left(1), position.down(1), position.right(1) ]
	method esquinas() = [ position.up(1).left(1), position.up(1).right(1), position.down(1).left(1), position.down(1).right(1) ]

	method posicionesAlrededor() = self.laterales() + self.esquinas()
}
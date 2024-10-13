import wollok.game.*
import niveles.*
import personajes.*

class Maiz {
	const property position
	var property esAdulto = false
	var sufijo = "baby"
	const property precio = 150

	method image() = "corn_" + sufijo + ".png"
	method estaListo() = self.esAdulto()

	method regada() {
		esAdulto = true
		sufijo = "adult"
	}
}

object trigo{
    var property evolucion = 0

    method image(){
        return "wheat_" + evolucion + ".png"
    }

    method regar(){
        return if(evolucion < 3){
            evolucion = evolucion + 1
        } else {
            evolucion = 0
        }
    }
}

object tomasco{
    var property position = game.at(-1,0)
    method image() = "assets/tomasco.png"
    method regar(){
        if(position.y() > config.height()){
            position = game.at(position.x(), 0)
        }
    }
}
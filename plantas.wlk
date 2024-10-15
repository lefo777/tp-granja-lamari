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

class Trigo {
	const property position
	var nivel = 0

//	const property precio

	method image() = "wheat_" + nivel.toString() + ".png"
	method estaListo() = nivel >= 2
    method esAdulto() = nivel >= 2
	method precio() = (nivel.min(3) - 1) * 100

	method regada() {
		// sufijo = (sufijo + 1)
		nivel = (nivel + 1) % 4 //resto de la division
	}
}

class Tomaco {
	var property position
	var property esAdulto = false
	var sufijo = "_baby"
	const property precio = 80

	method image() = "tomaco" + sufijo + ".png"
	method estaListo() = true

	method regada() {
		esAdulto = true
		sufijo = ""
		position = if (position.y() < 9) position.up(1) else game.at(position.x(),0)
		self.colisiono()
	}

	method colisiono(){
		if (game.colliders(self).isEmpty()){
			return false
		}
		else self.regada()
	}
}
import wollok.game.*
import niveles.*
object maiz{
    var property regada = false
    method image(){
        return if(self.regada()){
            "assets/corn_adult.png"
        } else{
            "assets/corn_baby.png"
        }
    }

    method regar(){
        regada = true
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
    var property position = null
    method image() = "assets/tomasco.png"
    method regar(){
        if(position.y() > config.height()){
            position = game.at(position.x(), 0)
        }
    }
}
object knightRider {
	method peso() = 500
	method nivelPeligrosidad() = 10
}

object bumblebee {
	var modoRobot = false
	
	method peso() = 800
	method nivelPeligrosidad() = 10
	
	method cambiarModo(){
		modoRobot = !modoRobot
	}
}

object paqueteLadrillos{
	var property cantLadrillos = 1
	
	method peso()= 2 * cantLadrillos
}


object arena {
	var property peso 
	method nivelPeligrosidad() = 1
}

object bateriaAntiarea {
	var estaCargado = true
	
	method cambiarEstado(){
		estaCargado = !estaCargado
	}
	method peso(){
		if (estaCargado){
			return 300
		}else {
			return 200
		}
	}
	
	method nivelPeligrosidad(){
		if (estaCargado){
			return 100
		}else {
			return 0
		}
	}
}

object contenedor {
	const elementos = []

	
	method peso(){
		return 100 + elementos.sum({e => e.peso()})
	}
	
	method estaVacio(){
		return elementos.isEmpty()
	}
	
	method nivelPeligrosidad(){
		if (not self.estaVacio()){
			return elementos.max({e => e.nivelPeligrosidad()})
		} else{
			return 0
		}
	}
}

object residuosRadioactivos {
	var property peso 
	
	method nivelPeligrosidad(){
		return 200
	}
}

object embalajeSeguridad {
	var objetoEmbalado
	
	method peso(){
		return objetoEmbalado.peso()
	}
	
	method embalarObjeto(objeto){
		objetoEmbalado = objeto
	}
	method nivelPeligrosidad(){
		return objetoEmbalado.nivelPeligrosidad() / 2
	}
	
}





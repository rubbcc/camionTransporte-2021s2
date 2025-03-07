object knightRider {
	method peso() { return 500 }
	
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	
	method peso() { return 800 }
	
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var cantidadLadrillos
	
	
	method peso() = cantidadLadrillos * 2
	
	method nivelPeligrosidad() = 2
	
	method cantidadLadrillos(cantidad) { cantidadLadrillos = cantidad }
}

object arenaAGranel {
	var peso
	
	
	method peso() = peso
	
	method setPeso(nuevoPeso) { peso = nuevoPeso }
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var conMisiles = false
	
	
	method peso() = if (conMisiles) 300 else 200
	
	method nivelPeligrosidad() = if (conMisiles) 100 else 0
	
	method ponerMisiles() { conMisiles = true }
	
	method sacarMisiles() { conMisiles = false }
}

object contenedorPortuario {
	const property cosasContenidas = []
	
	
	method peso() = 100 + cosasContenidas.sum({cosa => cosa.peso()})
	
	method nivelPeligrosidad() = cosasContenidas.sum({cosa => cosa.nivelPeligrosidad()})
	
	method agregarCosa(nuevaCosa) { cosasContenidas.add(nuevaCosa) }
	
	method quitarCosa(cosa) { cosasContenidas.remove(cosa) }
}

object residuosRadioactivos {
	var peso
	
	
	method peso() = peso
	
	method setPeso(nuevoPeso) { peso = nuevoPeso }
	
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {
	var cosaAdentro
	
	
	method peso() = cosaAdentro.peso()
	
	method nivelPeligrosidad() = cosaAdentro.nivelPeligrosidad() / 2
	
	method ponerCosa(cosa) { cosaAdentro = cosa }
}
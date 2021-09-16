object knightRider {
	method peso() { return 500 }
	
	method nivelPeligrosidad() { return 10 }
	
	method bulto() = 1
	
	method sufrirCambios() {}
}

object bumblebee {
	var transformadoEnAuto = true
	
	
	method peso() { return 800 }
	
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
	
	method bulto() = 2

	method sufrirCambios() { transformadoEnAuto = false }
}

object paqueteDeLadrillos {
	var cantidadLadrillos
	
	
	method peso() = cantidadLadrillos * 2
	
	method nivelPeligrosidad() = 2
	
	method cantidadLadrillos(cantidad) { cantidadLadrillos = cantidad }
	
	method bulto() = if (cantidadLadrillos > 300) 3 else
					 if (cantidadLadrillos > 100) 2 else
					 if (cantidadLadrillos > 0)   1 else 0

	method sufrirCambios() { cantidadLadrillos += 12 }
}

object arenaAGranel {
	var peso
	
	
	method peso() = peso
	
	method setPeso(nuevoPeso) { peso = nuevoPeso }
	
	method nivelPeligrosidad() = 1
	
	method bulto() = 1
	
	method sufrirCambios() { peso += 20 }
}

object bateriaAntiaerea {
	var conMisiles = false
	
	
	method peso() = if (conMisiles) 300 else 200
	
	method nivelPeligrosidad() = if (conMisiles) 100 else 0
	
	method ponerMisiles() { conMisiles = true }
	
	method sacarMisiles() { conMisiles = false }
	
	method bulto() = if (conMisiles) 2 else 1
	
	method sufrirCambios() { conMisiles = true }
}

object contenedorPortuario {
	const property cosasContenidas = []
	
	
	method peso() = 100 + cosasContenidas.sum({cosa => cosa.peso()})
	
	method nivelPeligrosidad() = cosasContenidas.sum({cosa => cosa.nivelPeligrosidad()})
	
	method agregarCosa(nuevaCosa) { cosasContenidas.add(nuevaCosa) }
	
	method quitarCosa(cosa) { cosasContenidas.remove(cosa) }
	
	method bulto() = 1 + cosasContenidas.sum({cosa => cosa.bulto()})
	
	method sufrirCambios() {
		const numeroCosas = cosasContenidas.size()
		if (numeroCosas > 0) cosasContenidas.forEach({cosa => cosa.sufrirCambios()})
	}
}

object residuosRadioactivos {
	var peso
	
	
	method peso() = peso
	
	method setPeso(nuevoPeso) { peso = nuevoPeso }
	
	method nivelPeligrosidad() = 200
	
	method bulto() = 1
	
	method sufrirCambios() { peso += 15 }
}

object embalajeDeSeguridad {
	var cosaAdentro
	
	
	method peso() = cosaAdentro.peso()
	
	method nivelPeligrosidad() = cosaAdentro.nivelPeligrosidad() / 2
	
	method ponerCosa(cosa) { cosaAdentro = cosa }
	
	method bulto() = 2
	
	method sufrirCambios() {}
}
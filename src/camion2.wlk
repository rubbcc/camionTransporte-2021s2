import cosas2.*

object camion {
	const property cosas = []
	const tara = 1000
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
		if (cosas.anyOne() == unaCosa and cosas.size() > 1)	unaCosa.sufrirCambios()
	}
	
	method descargar(cosa) {
		cosas.remove(cosa)
	}
	
	method todoPesoPar() = cosas.all({cosa => cosa.peso().even()})
	
	method hayAlgunoQuePesa(peso) = cosas.any({cosa => cosa.peso() == peso})
	
	method elDeNivel(nivel) = cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	
	method pesoTotal() = tara + cosas.sum({cosa => cosa.peso()})
	
	method excedidoDePeso() = self.pesoTotal() > 2500
	
	method objetosQueSuperanPeligrosidad(nivel) = cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	
	method objetosMasPeligrososQue(cosaAVer) = cosas.filter({cosa => cosa.nivelPeligrosidad() > cosaAVer.nivelPeligrosidad()})
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return !self.excedidoDePeso() and cosas.all({cosa => cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad}) 
	}
	
	method totalBultos() = cosas.sum({cosa => cosa.bulto()})
	
	method tieneAlgoQuePesaEntre(min, max) = cosas.any({cosa => cosa.peso().between(min,max)})
	
	method cosaMasPesada() = cosas.max({cosa => cosa.peso()})
	
	method pesos() = cosas.map({cosa => cosa.peso()})
}

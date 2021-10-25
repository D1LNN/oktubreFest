import Carpas.*

class Persona {

	var property peso = 0
	var property jarrasCompradas = []
	var property leGustaMusicaTradicional = false
	var property nivelDeAguante = 0
	var property nacionalidad = null

	method alcoholIngerido() = jarrasCompradas.sum{ j => j.contenidoDeAlcohol() }

	method estaEbrio() {
		return self.alcoholIngerido() * peso > nivelDeAguante
	}

	method leGustaMarca(marca)

	method quiereEntrar(carpa) = self.leGustaMarca(carpa.marcaQueVende()) and (self.leGustaMusicaTradicional() == carpa.tieneBandaDeMusica())

	method tomarJarra(jarra) {
		jarrasCompradas.add(jarra)
	}

	method esEmpedernido() = self.estaEbrio() and self.jarrasCompradas().all({ jarra => jarra.capacidadEnLitros() >= 1 })

	method esPatriota() = self.jarrasCompradas().all({ jarra => jarra.marca().paisDeOrigen() == self.nacionalidad() })

	method sonCompatibles(otraPersona) = self.jarrasCompatibles(otraPersona).size() > self.jarrasNoCompatibles(otraPersona).size()

	method jarrasCompatibles(otraPersona) = self.jarrasCompradas().asSet().intersection(otraPersona.jarrasCompradas().asSet())

	method jarrasNoCompatibles(otraPersona) = self.jarrasCompradas().asSet().difference(otraPersona.jarrasCompradas().asSet())

	method carpasDondeComproCerveza() = jarrasCompradas.map({ jarra => jarra.carpaDondeSeSirvio() }).asSet()
	
	method gastoTotal() = jarrasCompradas.sum({ jarra =>  jarra.carpaDondeSeSirvio().precioDeVentaPorJarra(jarra) })
	
	method posiciones() = (1..jarrasCompradas.size() - 1)	// (1..3)
	
	method estaEntrandoEnVicio() = self.posiciones().all({ pos => jarrasCompradas.get(pos).capacidadEnLitros() >= jarrasCompradas.get(pos - 1).capacidadEnLitros() })

}

class PersonaBelga inherits Persona {
	
	override method leGustaMarca(marca) {
		return marca.contenidoDeLupulo() > 4
	}

	override method nacionalidad() = "Belga"

}

class PersonaCheca inherits Persona {

	override method leGustaMarca(marca) = marca.graduacion() > 8

	override method nacionalidad() = "Checa"

}

class PersonaAlemana inherits Persona {

	override method leGustaMarca(marca) = true

	override method quiereEntrar(carpa) = super(carpa) and carpa.cantidadDePersonas().even()

	override method nacionalidad() = "Alemana"

}


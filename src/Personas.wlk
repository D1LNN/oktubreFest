class Persona {

	var property peso = 0
	var property jarrasCompradas = []
	var property leGustaMusicaTradicional = false
	var property nivelDeAguante = 0

	method alcoholIngerido() = jarrasCompradas.sum{ j => j.contenidoDeAlcohol() }

	method estaEbrio() {
		return self.alcoholIngerido() * peso > nivelDeAguante
	}
	
	method leGustaMarca(marca)

}

class PersonaBelga inherits Persona {
	
	override method leGustaMarca(marca) {
		return marca.contenidoDeLupulo() > 4
	}

}

class PesonaCheca inherits Persona {

	override method leGustaMarca(marca) = marca.graduacion() > 8

}

class PersonaAlemana inherits Persona {
	
	override method leGustaMarca(marca) = true
}


import Marcas.*

class CarpaCervecera {

	var property limiteDeAdmicion = 0
	var property tieneBandaDeMusica = false
	const property marcaQueVende = null
	var property personasDentro = []

	method cantidadDePersona() = personasDentro.size()

	method dejaEntrar(persona) = (limiteDeAdmicion > self.cantidadDePersona()) and not persona.estaEbrio()

	method puedeEntrar(persona) = self.dejaEntrar(persona) and persona.quiereEntrar(self)

	method ingresarPersona(persona) {
		if (persona.quiereEntrar(self) and self.puedeEntrar(persona)) { 
			personasDentro.add(persona) }
		else { 
			self.error("Error") }
	}

	method servirJarra(capacidad, persona) {
		const jarra = new Jarra(capacidadEnLitros = capacidad, marca = marcaQueVende)
		if (not personasDentro.contains(persona)) {
			self.error("Error")
		} else {
			persona.tomarJarra(jarra)
		}
	}
	
	method ebriosEmpedernidos() = personasDentro.count({ per => per.esEmpedernido() })
	
	method esHomogenea() = personasDentro.map({ per => per.nacionalidad() }).asSet().size() == 1
	
	
}


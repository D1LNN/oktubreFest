import Marcas.*

class CarpaCervecera {

	var property limiteDeAdmicion = 0
	var property tieneBandaDeMusica = false
	const property marcaQueVende = null
	var property personasDentro = []
	var property tipoDeRecargo = null

	method cantidadDePersonas() = personasDentro.size()

	method dejaEntrar(persona) = (limiteDeAdmicion > self.cantidadDePersonas()) and not persona.estaEbrio()

	method puedeEntrar(persona) = self.dejaEntrar(persona) and persona.quiereEntrar(self)

	method ingresarPersona(persona) {
		if (persona.quiereEntrar(self) and self.puedeEntrar(persona)) {
			personasDentro.add(persona)
		} else {
			self.error("Error")
		}
	}

	method servirJarra(capacidad, persona) {
		const jarra = new Jarra(capacidadEnLitros = capacidad, carpaDondeSeSirvio = self)
		if (not personasDentro.contains(persona)) {
			self.error("Error")
		} else {
			persona.tomarJarra(jarra)
		}
	}

	method ebriosEmpedernidos() = personasDentro.count({ per => per.esEmpedernido() })

	method esHomogenea() = personasDentro.map({ per => per.nacionalidad() }).asSet().size() == 1
	
	method asistentesALosQueNoSeLesSirvio() = personasDentro.filter({ per => per.carpasDondeComproCerveza().countains(self).negate() })
	
	method precioDeVenta() = marcaQueVende.precioPorLitro() * tipoDeRecargo.recargo()
	
	method cantidadDePersonasEbrias() = personasDentro.filter({ per => per.estaEbrio() }).size()
	
	method precioDeVentaPorJarra(jarra) = self.precioDeVenta() * jarra.capacidadEnLitros()

}

class Recargo {
	method recargo(carpa)
}

class RecargoFijo inherits Recargo {
	override method recargo(carpa) = 1.3
}

class RecargoPorCantidad inherits Recargo {
	override method recargo(carpa) = if (carpa.cantidadDePersona() >= carpa.limiteDeAdmicion() / 2) 1.4 else 1.25
}

class RecargoPorEbriedad inherits Recargo {
	override method recargo(carpa) = if (carpa.cantidadDePersonasEbrias() >= carpa.cantidadDePersonas() * 0.75) 1.5 else 1.2
}




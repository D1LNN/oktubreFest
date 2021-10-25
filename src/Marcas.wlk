object graduacionReglamentaria {
	var property graduacion = 5 
}

class Marca {
	var property contenidoDeLupulo = 0
	const property paisDeOrigen = null
	var property graduacion = 0
	var property precioPorLitro = 0
	
}

class CervezaRubia inherits Marca {
	
	
}

class CervezaNegra inherits Marca {
	
	override method graduacion() = graduacionReglamentaria.graduacion().min(self.contenidoDeLupulo() * 2)
}

class CervezaRoja inherits CervezaNegra {
	
	override method graduacion() = super() * 1.25
}

class Jarra {
	const property capacidadEnLitros = 0
	const property carpaDondeSeSirvio = null
	
	method marca() = carpaDondeSeSirvio.marcaQueVende()
	
	method contenidoDeAlcohol() = capacidadEnLitros * (self.marca().graduacion() / 100)
	
	method precioDeCosto() = self.marca().precioPorLitro() * capacidadEnLitros
}


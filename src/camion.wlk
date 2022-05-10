import cosas.*

object camion {
	const elementos = []

	method cargar(cosa){
		elementos.add(cosa)
	}
	
	method descargar(cosa){
		elementos.remove(cosa)
	}
	
	method todoPesoPar(){
		return elementos.all( {e => e.peso().even()} ) 
	}
	method hayAlgunoQuePesa(peso){
		return elementos.any( {e => e.peso()== peso} )
	}
	method elDeNivel(nivel){
		return elementos.find({ e => e.nivelPeligrosidad() == nivel})
	}
	method pesoTotal(){
		return elementos.sum({e => e.peso()}) + 1000
	}
	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}
	method objetosQueSuperanPeligrosidad(nivel){
		return elementos.filter( {e => e.nivelPeligrosidad() > nivel} )
	}
	
	method objetosMasPeligrososQue(cosa){
		return elementos.filter( {e => e.nivelPeligrosidad() > cosa.nivelPeligrosidad()} )
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return (not self.excedidoDePeso()) and self.ningunObjetoSuperaPeligrosidad(nivelMaximoPeligrosidad)
	}
	method ningunObjetoSuperaPeligrosidad(nivel){
		return elementos.all({e=> e.nivelPeligrosidad()< nivel})
	}
	
	//agregados camión
	
	method cosaMasPesada(){
		return elementos.max({e=> e.peso()})
	}
	method pesos(){
		return elementos.map({e=> e.peso()})
	}
	
	method tieneAlgoQuePesaEntre(min, max){
		return elementos.peso().between(min, max)
	}
}

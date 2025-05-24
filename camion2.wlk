import cosas.*

object camion {
    var property carga = []
    method cargarCosas(unaCosa){
        carga.add(unaCosa)
        unaCosa.esCargado()
    }
    method descargarCosas(unaCosa){
        carga.remove(unaCosa)
    }
    method pesoTotal(){
        return 1000 + carga.sum({c => c.peso()})
    }

    method pesosPares(){
        return carga.all({c => c.peso()%2==0})
    }

    method cosaQuePesa(unValor){
        return carga.any({c => c.peso()==unValor})
    }

    method primerCosaConPeligrosidad(unaPeligrosidad){
        return carga.find({c => c.peligrosidad()==unaPeligrosidad})
    }

    method cosasQueSuperanPeligrosidad(unaPeligrosidad){
        return carga.filter({c => c.peligrosidad()>unaPeligrosidad})
    }

    method superanPeligrosidadDe(unaCosa){
        return carga.filter({c => c.peligrosidad()>unaCosa.peligrosidad()})
    }

    method estaExcedido(){
        return self.pesoTotal()>2500
    }

    method puedeCircular(unaPeligrosidad){
        return !self.estaExcedido() 
        && self.cosasQueSuperanPeligrosidad(unaPeligrosidad).isEmpty()
    }

    method tieneAlgunoConPesoEntre(min,max){
        return carga.any({c => c.peso().between(min, max)})
    }

    method cosaMasPesada(){
        return carga.max({c => c.peso() })
    }
}
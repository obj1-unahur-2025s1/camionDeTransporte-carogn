object knightRider {
    method peso()=500
    method peligrosidad()=10
}

object bumblebee {
    var property estado=auto
    method peso()=800
    method peligrosidad()=estado.peligrosidad()
}

object auto{
    method peligrosidad()=15
}

object robot{
    method peligrosidad()=30
}

object paqueteLadrillos{
    var property cantidad = 0
    method peso()=cantidad*2
    method peligrosidad()=2 
}

object arena{
    var property peso = 0
    method peligrosidad()=1
}

object bateria{
    var property estaCargado = true
    method peso(){
        return if(estaCargado) 300 else 200
    }
    method peligrosidad(){
        return if(estaCargado) 100 else 0
    }
}

object contenedor{
    var property carga = []
    method peso(){
        return 100 + carga.sum({c => c.peso()})
    }
    method peligrosidad(){
        return 
        if(!(carga.isEmpty())) carga.map({c => c.peligrosidad()}).max() else 0
    }
}

object residuos{
    var property peso = 30
    method peligrosidad()=200
}

object embalaje{
    var property envuelveA=residuos
    method peso()= envuelveA.peso()
    method peligrosidad()=envuelveA.peligrosidad()/2

}
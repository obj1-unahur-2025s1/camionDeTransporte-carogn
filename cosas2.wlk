
object knightRider {
    method peso()=500
    method peligrosidad()=10
    method ocupaBultos()=1
    method esCargado(){}
}

object bumblebee {
    var property estado=auto
    method peso()=800
    method peligrosidad()=estado.peligrosidad()
    method ocupaBultos()=2
    method esCargado(){
        estado=robot
    }
    
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
    method ocupaBultos(){
        if(cantidad<100){
            return 1
        }
        else if (cantidad.between(101, 301)){
            return 2
        }
        else return 3
    }
    method esCargado(){
        cantidad = cantidad +12
    }
}

object arena{
    var property peso = 0
    method peligrosidad()=1
    method ocupaBultos()=1
    method esCargado(){
        peso=peso-10
    }
}

object bateria{
    var property estaCargado = true
    method peso(){
        return if(estaCargado) 300 else 200
    }
    method peligrosidad(){
        return if(estaCargado) 100 else 0
    }
    method ocupaBultos(){
       return if(estaCargado) 2 else 1
    }
    method esCargado(){
        estaCargado=true
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
    method ocupaBultos(){
        return 1 + carga.sum({c => c.ocupaBultos()})
    }
    method esCargado(){
        carga.forEach({c => c.esCargado()})
    }
}

object residuos{
    var property peso = 30
    method peligrosidad()=200
    method ocupaBultos()=1
    method esCargado(){
        peso=peso+15
    }
}

object embalaje{
    var property envuelveA=residuos
    method peso()= envuelveA.peso()
    method peligrosidad()=envuelveA.peligrosidad()/2
    method ocupaBultos()=1
    method esCargado(){}
}
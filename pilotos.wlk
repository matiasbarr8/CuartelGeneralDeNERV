import evas.*
object asuka {
    var entrenamientos = 5
    var satisfecho = false
    const eva =  []

    method puntosDeEntrenamiento() = entrenamientos

    method entrenar(unValor) {
        entrenamientos = entrenamientos + unValor
    }

    method estaSatisfecho() = satisfecho
    method puedeSincronizarConUnEva(unEva) = true
    method sincronizarConUnEva(unEva) {
        eva.add(unEva)
    }
    method cambiarEstado() {
        if(self.ultimoEvaSincronizado().fuerzaAt() > 2115){
            satisfecho = true
        }
    }
    method ultimoEvaSincronizado() = eva.last()
}
object shinji {
    var entrenamientos = 2
    var satisfecho = false
    var estaDescansado = false
    const eva = []

    method puntosDeEntrenamiento() = entrenamientos

    method entrenar(unValor) {
        entrenamientos = entrenamientos + unValor
    }

    method estaSatisfecho() = satisfecho
    method puedeSincronizarConUnEva(unEva) {
        return estaDescansado
    }

    method sincronizarConUnEva(unEva) {
        if(self.estaDescansado()){
            eva.add(unEva)
            estaDescansado = false
        }
        else{
            self.descansar()
            eva.add(unEva)
        }
    }
    method estaDescansado() = estaDescansado
    method descansar() {
        estaDescansado = true
    }

    method cambiarEstado() {
        if(self.sincronizoConTodosLosEvas()){
            satisfecho = true
        }
    }

    method sincronizoConTodosLosEvas() {
        return eva.contains(eva01) and eva.contains(eva02) and eva.contains(eva00)
    }
}
object rei {
    var entrenamientos = 0
    var satisfecho = false
    const eva = []

    method puntosDeEntrenamiento() = entrenamientos
    method entrenar(unValor) {
        entrenamientos = entrenamientos + unValor
    }
    method puedeSincronizarConUnEva(unEva) {
        return unEva.fuerzaAt() >= 2110
    }
    method sincronizarConUnEva(unEva) {
        if(unEva.fuerzaAt() >= 2110 and eva.size() <= 5){
            eva.add(unEva)
        }
        else if(unEva.fuerzaAt() >= 2110){
            eva.remove(eva.first())
            eva.add(unEva)
        }
    }
    method estaSatisfecho() = satisfecho
    method cambiarEstado() {
        if(eva.size() >= 1){
            satisfecho = true
        }
    }
}
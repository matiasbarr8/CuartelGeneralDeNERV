object eva01 {
    var fuerza = 2110
    var energia = 100

    method fuerzaAt() = fuerza

    method energia() = energia

    method puedeSincronizarConUnPiloto(unPiloto) = unPiloto.puntosDeEntrenamiento() >= 4 && self.energia() > 30

    method sincronizarConUnPiloto(unPiloto) {
        self.consumirEnergia(25)
        self.aumentarFuerza(1)
        unPiloto.entrenar(2)
    }
    method aumentarFuerza(unValor) {
        fuerza = 2150.min(fuerza + unValor)
    }

    method recargarEnergia(cantidadDeHoras) {
        energia = 100.min(30 * cantidadDeHoras)
    }
    method consumirEnergia(unValor){
        energia = 0.max(energia - unValor)
    }
}
object eva02 {
    var energia = 100
    var combate = estandar

    method fuerzaAt() = 2114
    method energia() = energia

    method sincronizarConUnPiloto(unPiloto) {
        self.modoCombate().consumir(self, unPiloto)
    }

    method puedeSincronizarConUnPiloto(unPiloto) = unPiloto.puntosDeEntrenamiento() >= 2 && self.energia() > 20

    method modoCombate() = combate

    method cambiarModoCombate(nuevoModo) {
        combate = nuevoModo
    }

    method recargarEnergia(cantidadDeHoras) {
        energia = 100.min(25 * cantidadDeHoras)
    }
    method consumirEnergia(unValor){
        energia = 0.max(energia - unValor)
    }
}

object eva00 {
    var fuerza = 2100

    method fuerzaAt() = fuerza

    method aumentarFuerza(unValor) {
        if(unValor.between(2100, 2150)){
            fuerza = fuerza + unValor
        }
    }
    method energia() {}
    method recargarEnergia() {}
    method consumirEnergia() {}
    method puedeSincronizarConUnPiloto(unPiloto) = true

    method sincronizarConUnPiloto(unPiloto) {
        unPiloto.entrenar(1)
    }
}

object estandar {
    method consumir(unEva,unPiloto) {
        unPiloto.entrenar(1)
        unEva.consumirEnergia(10)
    }
}
object ataque {
    method consumir(unEva,unPiloto) {
        unPiloto.entrenar(3)
        unEva.consumirEnergia(20)
    }
}
object berserk {
    method consumir(unEva,unPiloto) {
        unPiloto.entrenar(6)
        unEva.consumirEnergia(35)
    }
}
import evas.*
import pilotos.*
object nerv {
    const pilotos = []
    const evas = []

    method agregarUnPiloto(unPiloto) {
        pilotos.add(unPiloto)
    }
    method agregarUnEva(unEva) {
        evas.add(unEva)
    }
    method sincronizarUnEvaConUnPiloto(unEva, unPiloto) {
        if(unEva.puedeSincronizarConUnPiloto(unPiloto) && unPiloto.puedeSincronizarConUnEva(unEva)){
            unEva.sincronizarConUnPiloto(unPiloto)
            unPiloto.sincronizarConUnEva(unEva)
        }      
    }
    method sincronizarUnPilotoConTodosLosEvas(unPiloto) {
        evas.forEach({e => self.sincronizarUnEvaConUnPiloto(e, unPiloto)})
    }
    method promedioDePuntosDeEntrenamiento() {
        return pilotos.sum({p => p.puntosDeEntrenamiento()}) / pilotos.size()
    }
    method pilotoConMayorPuntosDeEntrenamiento() {
        return pilotos.max({p => p.puntosDeEntrenamiento()})
    }
    method listaDeValoresAtDeLosEvasDelCuartel() {
        return evas.map({e => e.fuerzaAt()})
    }
    method listaDeLosEvasQuePuedenUsarsePorUnPiloto(unPiloto) {
        return evas.filter({e => e.puedeSincronizarConUnPiloto(unPiloto)})
    }
    method todosLosPilotosPuedenUsarAlMenosUnEvaRegistrado() {
        return pilotos.all({p => p.puedeSincronizarConUnEva(evas.anyOne())})
    }
    method seConsideraSatisfecho(unPiloto) {
        return unPiloto.estaSatisfecho()
    }
}
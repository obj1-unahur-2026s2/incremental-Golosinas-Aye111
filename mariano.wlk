import golosinas.*

object mariano {
    const golosinas = []
    const desechadas=[]
  
  method golosinas()=golosinas
  method comprar(unaGolosina){
    golosinas.add(unaGolosina)
  }
  method desechar(unaGolosina){
    golosinas.remove(unaGolosina)
    desechadas.add(unaGolosina)
  }
  method cantidadDeGolosinas()= golosinas.size()
  method tieneLaGolosina(unaGolosina)= golosinas.contains(unaGolosina)
  method probarGolosinas(){golosinas.forEach({ golosina => golosina.recibirMordisco() })}
  method hayGolosinaSinTACC() = golosinas.any({ g => g.esLibreDeGluten() })
  method preciosCuidados()=golosinas.all({ g => g.precio() <= 10 })
  method golosinaDeSabor(unSabor) = golosinas.find({ g => g.sabor() == unSabor })
  method golosinasDeSabor(unSabor) = golosinas.filter({ g => g.sabor() == unSabor })
  method sabores() = golosinas.map({ g => g.sabor() }).asSet()
  method golosinaMasCara() = golosinas.max({ g => g.precio() })
  method pesoGolosinas() = golosinas.sum({ g => g.peso() })
  method golosinasFaltantes(golosinasDeseadas) = 
      golosinasDeseadas.asSet().difference(golosinas.asSet())
 method gustosFaltantes(gustosDeseados) = 
      gustosDeseados.asSet().difference(self.sabores())
    // Adicionales 
 method gastoEn(sabor) = 
      self.golosinasDeSabor(sabor).sum({ g => g.precio() })

// Auxiliar para saber cuántas golosinas tiene de un sabor
method cantidadDeGolosinasDeSabor(sabor) = 
      self.golosinasDeSabor(sabor).size()

method saborMasPopular() = 
      self.sabores().max({ sabor => self.cantidadDeGolosinasDeSabor(sabor) })

method saborMasPesado() = 
      self.sabores().max({ sabor => self.golosinasDeSabor(sabor).sum({ g => g.peso() }) })

method comproYDesecho(golosina) = desechadas.contains(golosina)

//Parte 3
method baniar(unaGolosina) {
    const baniada = new GolosinaBañada(golosinaBase = unaGolosina)
    golosinas.add(baniada)
  }
}
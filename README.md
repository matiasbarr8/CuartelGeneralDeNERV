![alt text](./Evas_Pilotos.jpg)

## Contexto
En el cuartel general de NERV, la organización responsable de proteger a la humanidad, se gestionan los EVA Units (gigantes biomecánicos similares a robots tipo mecha) y sus pilotos elegidos. Cada EVA tiene características únicas, y nos va a interesar de cada uno: campo de fuerza AT (usaremos un número), energía, requisitos de sincronización y efectos sobre los puntos de entrenamiento del piloto que lo use. En este modelo solo representaremos 3 EVA y 3 pilotos para simplificar, pero existen otros y pueden surgir nuevos en el futuro que quedan fuera de alcance de esta simulación.  

Los pilotos se entrenan y deben lograr sincronizarse con los Evas siguiendo reglas específicas. **Quién se encarga de orquestar y gestionar las sincronizaciones siempre es el cuartel**, y los pilotos no deben hacerlo por sí mismos. Los EVA no poseen la capacidad de forzar a los pilotos a usarlos sin que intervenga el cuartel.  

Cuando los pilotos se sincronizan, aumentan sus puntos de entrenamiento, aunque también enfrentan restricciones.  

El sistema del cuartel debe permitir:  
- Llevar registro de los Evas y pilotos del cuartel.  
- Intentar sincronizar un EVA con un piloto (si las condiciones se cumplen).  
- Ordenar a un piloto que intente sincronizar con todos los Evas disponibles en el cuartel.  
- Consultar estadísticas generales del cuartel.  

---

## Evas disponibles

### ⚙️ EVA-01 (Proto)
- Valor de campo de fuerza AT: inicialmente es **2110** (aumenta en 1 con cada sincronización hasta un límite de 2150).  
- Energía inicial: **100** (batería interna).  
- Para poder sincronizarse requiere:  
  - que el piloto tenga al menos 4 puntos de entrenamiento.  
  - que la energía sea mayor a 30.  
- Cada sincronización consume **25 de energía**.  
- Otorga **2 puntos de entrenamiento** al piloto.  
- Se recarga a razón de **30 por hora** (máximo 100).  

---

### 🌌 EVA-02 (Production Model)
- Valor de campo de fuerza AT: siempre es **2114**.  
- Energía inicial: **100** (batería interna).  
- Para poder sincronizarse requiere:  
  - puntos de entrenamiento mínimo de 2.  
  - energía mayor a 20.  
- Posee modos de combate configurables que determinarán los puntos que otorga y el consumo de energia al sincronizarse:  
  - **estándar:** +1 entrenamiento, consumo 10.  
  - **ataque:** +3 entrenamiento, consumo 20.  
  - **berserk:** +6 entrenamiento, consumo 35.  
- Se recarga a razón de **25 por hora** (máximo 100).  

---

### 🔐 EVA-00 (Prototype)
- Valor de campo de fuerza AT: arranca en **2100** y se lo puede mejorar agregándole más fuerza (un valor) siempre que aumente (nunca disminuye) entre su valor actual y 2150.  
- No consume energía (fuente de energía experimental de origen desconocido).  
- No exige condiciones para permitir sincronizarse con él.  
- Otorga **1 punto de entrenamiento** cada vez que se sincroniza.  

---

## Pilotos disponibles

### 👩 Asuka Langley Sohryu
- Comienza con **5 puntos de entrenamiento**.  
- Puede sincronizar con cualquier EVA para el que cumpla los requisitos todas las veces que quiera.  
- Se considera satisfecha si el **último EVA** con el que se sincronizó posee un valor de **AT superior a 2115**.  

---

### 🧑 Shinji Ikari
- Comienza con **2 puntos de entrenamiento**.  
- Tras cada sincronización (además del requisito del EVA si lo tuviese), **Shinji debe descansar antes de poder realizar otra**.  
- Se considera satisfecho si logró sincronizar al menos una vez con **todos los Evas** que hay en el cuartel.  

---

### 🦾 Rei Ayanami
- Comienza con **0 puntos de entrenamiento**.  
- Para sincronizarse, además del requisito que pide cada EVA (si lo hubiese), puede hacerlo si el valor de AT del EVA es como mínimo **2110**.  
- Puede realizar un máximo de **5 sincronizaciones**.  
- Se considera satisfecha si pudo sincronizar al menos una vez con **cualquier EVA**.  

---

## Base NERV
La base (cuartel) registra los Evas y los pilotos.  

### Operaciones requeridas
- Registrar pilotos y Evas en la base.  
- Intentar sincronizar un EVA con un piloto (si cumple condiciones).  
- Ordenar a un piloto que intente sincronizar con todos los Evas disponibles en la base.  
- Obtener:  
  1) Promedio de puntos de entrenamiento de los pilotos que hay en el cuartel.  
  2) El piloto con mayor puntos de entrenamiento acumulados.  
  3) La lista de los valores de AT de los Evas que hay en el cuartel.  
  4) La lista de los Evas que están en condiciones de usarse por un determinado piloto.  
  5) Verificar si todos los pilotos del cuartel pueden usar al menos un EVA de los registrados.  
  6) Si un determinado piloto se considera satisfecho.  

---

## Tests mínimos a realizar
- El EVA-01 no puede usarse más de 3 veces seguidas sin recargarse.  
- En modo ataque, el EVA-02 otorga 3 de entrenamiento y consume 20 de energía.  
- Shinji puede al inicio sincronizar con el EVA-00.  
- Probar que Rei no puede realizar más de 5 sincronizaciones en total.  
- El cálculo del promedio de puntos de entrenamiento de los pilotos es correcto.  
- Verificar que cada EVA puede ser usado por al menos un piloto registrado en el cuartel.  
- Que un piloto se considera satisfecho según su definición personal.  

---

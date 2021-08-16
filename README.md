# Bienvenido al repositorio oficial de Api-finance! :chart_with_downwards_trend: :chart_with_upwards_trend:

## I. Información del repositorio

**Nombre oficial del repo:** api-finance-alpha

**Descripción**: Financial api about stocks price. Pyhton, flask, yfinance.

## II. Requisitos

1. Tener instalado docker en tu máquina.
2. Tener alguna herramienta para hacer get al servidor enviando data. En mi caso uso Postman, pero puedes usar la herramienta que quieras.

## III. Instalación
1. Clona el repositorio en tu local, en el directorio que estimes conveniente. Te recomiendo crear un nuevo directorio con el nombre del proyecto,
dentro de él iniciar git (git init) y luego clonar este repositorio https://github.com/ariffo/api-finance-alpha.git.

2. Levanta el contenedor con: 

      `docker-compose up`
      
      si quieres que se levante en el background de modo que al matar la terminal no termine la ejecución del contenedor, utiliza el detach mode:
      
      `docker-compose up -d`

## IV. Cómo utilizar la api

### a) Obtener toda la información de una acción

1. Haz una consulta con el método **get** enviando el ticker de la acción en la url. El ticker de una acción es un código alfanumérico, que de forma abreviada, representa los valores de una empresa que cotiza en un determinado mercado bursátil. Por ejemplo: Visa = V; 3M = MMM; Caterpillar = CAT; Apple = AAPL; Coca-Cola = KO; etc. 

      Por ejemplo la url en mi local con el puerto 6787 quedaría así:

      `http://localhost:6787/aapl`

      (*) puedes pasar el ticker de la acción en mayúscula, minúscula o cualquier combinación de ellas, da igual.
      
      (*2) por defecto el puerto que utiliza la api es el 6787
      
2. En la consulta anterior debes enviarle en formato **JSON** la fecha de inicio y la fecha final del periodo del cual quieres obtener información acerca de la acción. El formato de la fecha es AA-MM-DD. Para indicar la fecha de inicio utiliza la key 'start', y para la fecha de fin utiliza la key 'end'. 

      En Postman lo hago colocando en el **Header** un par clave valor de Key: Content-Type y Value: application/json; y en el **Body** un raw con formato JSON.

      Ejemplo, traer la data de la acción de Apple entre el 1 enero del 2010 y el 5 de enero del 2010, enviamos en el body:
      
      `{
            "start": "2010-01-01",
            "end": "2010-01-05"
       }`
       
      Esto nos devolverá un JSON con toda la información disponible para esa acción
      (*) Todos los tickers disponibles para usar se encuentran en el archivo /src/stocks_available.py
      

### b) Obtener información específica de una acción

Si quieres obtener solo un precio de la acción o el volumen, agrega al get anterior en la url alguno de las siguientes rutas al nombre de la acción:

- /open: Precio de apertura de la acción
- /close: Precio de cierre de la acción
- /high: Precio más alto de la acción ese día
- /low: Precio más bajo de la acción ese día
- /adj_close: Precio de cierre ajustado de la acción
- /volume: Volumen transado de la acción ese día

Ejemplo, para obtener el precio más alto de la acción de 3M para un período dado utilizaríamos la siguiente url

`http://localhost:6787/mmm/high`

(*) El body de la consulta mantiene el formato de fecha de inicio y final que vimos en el punto a) anteriormente


### c) Obtener el precio en vivo de una acción

Si deseas obtener el precio actual de una acción solo debes utilizar la url en formato /name/today

Ejemplo, obtener el precio actual de la acción de Coca-Cola:

`http://localhost:6787/ko/today`

Cabe mencionar que esto muestra el precio actual de la acción, por lo cual si el mercado está abierto el precio de la acción fluctuará segundo a segundo. En caso de que el mercado esté cerrado, obtendrás el último precio de cierre de la acción ya que es el precio actual.

La bolsa de Nueva York está abierta durante las 9:30 y las 16:00 hrs (UTC-4). Permanece cerrada los fines de semana y días festivos.

(*) Esto devuelve el precio de la acción con un delay de 5-10 segundos en relación a Yahoo Finance. Desconozco cuanto es el desfase en segundos entre Yahoo Finance y el Dow Jones o el S&P 500.

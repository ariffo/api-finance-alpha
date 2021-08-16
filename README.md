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

      Ejemplo, traer la data de la acción de Apple entre el 1 enero del 2000 y el 5 de enero del 2000, enviamos en el body:
      
      `{
            "start": "2000-01-01",
            "end": "2000-01-05"
       }`
       
      Esto nos devolverá un JSON con los precios de Apertura (Open), Cierre (Close), Máximo precio del día (High), Menor precio del día (Low), Precio de cierre ajustado (Adj Close) y el volumen transado de la acción (Volume) para la fecha indicada.
      
      (*) Todos los tickers disponibles para usar se encuentran en el archivo /src/stocks_available.py
      

### b) Obtener información específica de una acción

Si quieres obtener solo un precio de la acción

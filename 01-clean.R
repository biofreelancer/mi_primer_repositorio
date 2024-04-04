# cargar paquetes
pacman::p_load( "vroom", "dplyr" )

# leer data
la_data <- vroom( file = "data/data_original.csv" )

# nos quedamos solo con la data para DR. y DRA.
data_filtrada <- la_data %>% 
  filter( nobilis == "DR." | nobilis == "DRA." )

# creamos un directorio de resultados
dir.create( path = "results" )

# Guardamos esta data
write.csv( x = data_filtrada, file = "results/limpia.csv" )

##### Calculamos la proporcion de DRAs y DRs que pierden SNI
data_resumen <- data_filtrada %>% 
  filter( cambio == "perdio SNI" ) %>% 
  group_by( nobilis ) %>% 
  summarise( totales = sum( miembros ) )

# Guardamos esta data
write.csv( x = data_resumen, file = "results/resumen.csv" )

# TO-DOs
# iaguilar: calcular los % de DR y DRA que pierden SNI
#           como TOTAL INGRESOS / TOTAL PERDIDA SNI

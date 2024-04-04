# cargar paquetes
pacman::p_load( "ggplot2" )

# Grafica de cambios por anio

# leer data
limpia <- read.csv( file = "results/limpia.csv" )

# graficamos
barras.p <- ggplot( data = limpia,
                    mapping = aes( x = year,
                                   y = miembros,
                                   fill = cambio ) ) +
  geom_col( position = "dodge" ) +
  ggtitle( "Cambios en el SNI" ) +
  theme_classic( ) +
  facet_wrap( ~ nobilis )

# Visualizamos
barras.p

# guardamos el plot
ggsave( filename = "results/barras.png", plot = barras.p,
        width = 7, height = 5 )

# Graficamos la proporcion de DR y DRA

# leer data
resumen <- read.csv( file = "results/resumen.csv" )

pay.p <- ggplot( data = resumen,
                 mapping = aes( x = "",
                                y = totales,
                                fill = nobilis ) ) +
  geom_col( color = "black" ) +
  coord_polar( "y", start = 0 ) +
  theme_void( ) +
  ggtitle( "Miembros que han perdido el SNI" )

# Visualizamos
pay.p

# guardamos el plot
ggsave( filename = "results/pay.png", plot = pay.p,
        width = 7, height = 5, bg = "white" )

# TO-DOs
# iaguilar: Agregar el numero de DRs y DRAs en el pay chart.

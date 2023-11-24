## Script para correr el reporte dailytrack automáticamente dependiendo del día que se corra
## Nota:
## - El directorio donde se quiere colocar el reporte (mi.output.dir) no debe llevar acentos o caracteres especiales

# Variables a modificar ####
# Directorio donde se encuentra el .Rmd para generar el reporte
mi.rmd.dir <- 'C:/Users/lenovo/Documents/Monica/Televisa/Dailytrack/'
# Ubicación donde se desea colocar el reporte (archivo .html)
mi.output.dir <- 'C:/Users/lenovo/Documents/Monica/Televisa/Dailytrack/Reportes'

# Paquetes ####
require(rmarkdown)


# Para correr los reportes ####
#run_date <- as.Date("2023-11-8")#EL 24 octubre
run_date <- Sys.Date() #HOY
dia <- tolower(weekdays(run_date))

if(dia =="lunes" | dia == "monday"){
  
  print("Generando reporte del domingo..............................................................")
  Sys.setlocale("LC_TIME", "Spanish_Mexico.1252")
  render(paste0(mi.rmd.dir,'/Flexample_2023FINALMON.Rmd'),
         output_file =  paste("DASHBOARD_", run_date-1,".html", sep=''),
         output_dir = mi.output.dir,
         params = list(date=run_date-1),)
  
  print("Generando reporte del sábado..............................................................")
  Sys.setlocale("LC_TIME", "Spanish_Mexico.1252")
  render(paste0(mi.rmd.dir,'/Flexample_2023FINALMON.Rmd'),
         output_file =  paste("DASHBOARD_", run_date-2, ".html", sep=''),
         output_dir = mi.output.dir,
         params = list(date=run_date-2))

  print("Generando reporte del viernes..............................................................")
  Sys.setlocale("LC_TIME", "Spanish_Mexico.1252")
  render(paste0(mi.rmd.dir,'/Flexample_2023FINALMON.Rmd'),
         output_file =  paste("DASHBOARD_", run_date-3, ".html", sep=''),
         output_dir = mi.output.dir,
         params = list(date=run_date-3))
  
}else{
  
  render(paste0(mi.rmd.dir,'/Flexample_2023vFinal.Rmd'),  
         output_file =  paste("DASHBOARD_", run_date-1, ".html", sep=''), 
         output_dir = mi.output.dir,
         params = list(date=run_date-1))
}


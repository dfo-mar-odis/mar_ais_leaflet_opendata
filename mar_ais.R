require(arcpullr)
require(htmlwidgets)
require(leaflet)
require(leaflet.minicharts)
require(dplyr)

url <- "https://gisp.dfo-mpo.gc.ca/arcgis/rest/services/FGP/Aquatic_Invasive_Species/MapServer/154"
AIS <- get_spatial_layer(url)

m <- leaflet() %>% 
  addTiles() %>%
  addMinicharts(
    AIS$Longitude, AIS$Latitude,
    chartdata = AIS %>% 
      as.data.frame() %>% 
      select(-OBJECTID,-Year_Observed,-StnLocation,-Latitude,-Longitude,-FCName,-Prov,-sampler,-StnNum,-geoms,-StnDescription,-StructureType,-Codium_fragile,-geoms))

saveWidget(m,"mar_ais.html")

## Move into the inst/gadget folder before you run this script!

Motion=gvisMotionChart(Fruits, idvar="Fruit", timevar="Year",
  options=list(height=350, width=400)) 
cat(createGoogleGadget(Motion), file="motionchart.xml")

## Geo Map with coloured regions
Geo=gvisGeoMap(Exports, locationvar="Country", numvar="Profit",
                       options=list(dataMode='regions'))

cat(createGoogleGadget(Geo), file="geomap.xml")#

## Show Hurricane Andrew (1992) storm track with Geo Map
AndrewGeo <- gvisGeoMap(Andrew, locationvar="LatLong", numvar="Speed_kt", 
      			 hovervar="Category", 
      		         options=list(height=250, width=400, region="US"))

cat(createGoogleGadget(AndrewGeo), file="andrewgeomap.xml")

## Hurricane Andrew (1992) storm track with Google Maps
AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip", 
      	      options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
		      mapType='terrain', useMapTypeControl=TRUE))

cat(createGoogleGadget(AndrewMap), file="andrewmap.xml")

## Geo Chart
GeoChart <- gvisGeoChart(Exports, "Country", "Profit",
                         options=list(region="150"))
cat(createGoogleGadget(GeoChart), file="geochart.xml")


## Table. Click on the column header to sort the rows 
Table <- gvisTable(Exports, options=list(width=400, height=270))
cat(createGoogleGadget(Table), file="table.xml")

## Table with embedded links
PopTable <- gvisTable(Population, options=list(width=600, height=300, page='enable'))

cat(createGoogleGadget(PopTable), file="poptable.xml")

## Tree Map. Left mouse-click to drill down, right mouse-click to move up a hierarchy
Tree <- gvisTreeMap(Regions,  "Region", "Parent", "Val", "Fac",
                    options=list(fontSize=16, width=400, height=300)) 

cat(createGoogleGadget(Tree), file="treemap.xml")

require(datasets)
states <- data.frame(state.name, state.area)

states3 <- data.frame(state.region, state.division, state.name, state.area)

regions <- aggregate(list(region.area=states3$state.area),
                     list(region=state.region), sum)

divisions <- aggregate(list(division.area=states3$state.area),
                     list(division=state.division, region=state.region),
                     sum)

my.states3 <- data.frame(regionid=c("USA",
                                    as.character(regions$region),
                                    as.character(divisions$division),
                                    as.character(states3$state.name)),
                         parentid=c(NA, rep("USA", 4), 
                                   as.character(divisions$region),
                                   as.character(states3$state.division)),
                         state.area=c(sum(states3$state.area),
                                      regions$region.area,
                                      divisions$division.area,
                                      states3$state.area))

my.states3$state.area.log=log(my.states3$state.area)

statesTree3 <- gvisTreeMap(my.states3, "regionid", "parentid",
                           "state.area", "state.area.log", options=list(showScale=TRUE, width=400, height=300))

cat(createGoogleGadget(statesTree3), file="statestreemap.xml")


## Annotated Time Line Chart
AnnoTimeLine  <- gvisAnnotatedTimeLine(Stock, datevar="Date",
                           numvar="Value", idvar="Device",
                           titlevar="Title", annotationvar="Annotation",
                           options=list(displayAnnotations=TRUE,
                             legendPosition='newRow',
                             width=400, height=250)
                           )
cat(createGoogleGadget(AnnoTimeLine), file="annotimeline.xml")

## Sample data
df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))

## Line chart
Line <- gvisLineChart(df,
                options=list(legend='none', width=300, height=200))
cat(createGoogleGadget(Line), file="linechart.xml")


## Bar chart
Bar <- gvisBarChart(df,
                    options=list(legend='none', width=300, height=200))
cat(createGoogleGadget(Bar), file="barchart.xml")

## Column chart
Column <- gvisColumnChart(df,
                          options=list(legend='none', width=300, height=200))
cat(createGoogleGadget(Column), file="columnchart.xml")

## Area chart
Area <- gvisAreaChart(df,
                      options=list(legend='none', width=300, height=300))
cat(createGoogleGadget(Area), file="areachart.xml")

## Stepped Area Chart
SteppedArea <- gvisSteppedAreaChart(df, xvar="country", yvar=c("val1", "val2"),
      options=list(isStacked=TRUE, width=300, height=290))
plot(SteppedArea)
cat(createGoogleGadget(Area), file="steppedareachart.xml")

## Scatter chart
Scatter <- gvisScatterChart(women, options=list(legend="none",
                 lineWidth=2, pointSize=0, 
                 title="Women", vAxis="{title:'weight (lbs)'}",
                 hAxis="{title:'height (in)'}", width=300, height=300))
                 
cat(createGoogleGadget(Scatter), file="scatterchart.xml")

## Bubble chart
Bubble <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", yvar="Expenses",
                           colorvar="Year", sizevar="Profit",
                           options=list(hAxis='{minValue:75, maxValue:125}',
                             width=500, height=300))

cat(createGoogleGadget(Bubble), file="bubblechart.xml")


## Pie chart
Pie <- gvisPieChart(CityPopularity,
                    options=list(width=400, height=200))
cat(createGoogleGadget(Pie), file="piechart.xml")

## Gauge
Gauge <-  gvisGauge(CityPopularity, options=list(min=0, max=800, greenFrom=500,
                                      greenTo=800, yellowFrom=300, yellowTo=500,
                                      redFrom=0, redTo=300, width=300, height=220))
cat(createGoogleGadget(Gauge), file="gauge.xml")

## Intensity Map
Intensity <- gvisIntensityMap(df)

cat(createGoogleGadget(Intensity), file="intensitymap.xml")

## Org chart
Org <- gvisOrgChart(Regions, options=list(width=600, height=210,
                               size='large', allowCollapse=TRUE))
cat(createGoogleGadget(Org), file="orgchart.xml")

## Candlestick chart
Candle <- gvisCandlestickChart(OpenClose, xvar="Weekday", low="Low",
                                      open="Open", close="Close",
                                      high="High",
                                      options=list(legend='none',
                                        width=300, height=250))

cat(createGoogleGadget(Candle), file="candlestickchart.xml")

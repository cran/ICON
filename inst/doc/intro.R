## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup, message=FALSE-----------------------------------------------------
# load R packages (both on CRAN)
library(ICON)
library(network)   # for network analysis
library(ggplot2)   # for network visualization
library(ggnetwork) # for network visualization

# load ICON dataset
data(ICON_data)

## ----peek---------------------------------------------------------------------
head(ICON_data)

## ----small_peek---------------------------------------------------------------
head(ICON_data[, c("Var_name",
                   "Edges",
                   "Directed",
                   "Name")],
     n = 5)

## ----aishihik-----------------------------------------------------------------
get_data("aishihik_intensity")

head(aishihik_intensity)

## ----dl_mult------------------------------------------------------------------
get_data(c("coldlake_intensity", "fullerene_c60"))

head(coldlake_intensity)

head(fullerene_c60)

## ----dl_all, eval=FALSE-------------------------------------------------------
#  # download all available complex networks
#  get_data(ICON_data$Var_name)

## ----network_obj--------------------------------------------------------------
# make sure that the downloaded network has class `ICON`
class(aishihik_intensity)

# coerce to class `network` (`as.network.ICON` is called)
coerced_network <- as.network(aishihik_intensity)

# check if the coerced network has the correct class
class(coerced_network)

# peek at the coerced network (pay attention to number of edges)
coerced_network

# check number of vertices in initial ICON object
length(unique(c(aishihik_intensity[, 1], aishihik_intensity[, 2])))

# check number of edges in initial ICON object
nrow(aishihik_intensity)

## ----network_viz, fig.width = 4-----------------------------------------------
# ggnetwork fortifies objects of class `network` without additional code
# the aes parameters should be used as-is
ggplot(coerced_network, aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_edges() +
  geom_nodes() +
  theme_blank()

## ----col_edges, fig.width = 5-------------------------------------------------
ggplot(coerced_network, aes(x = x, y = y, xend = xend, yend = yend)) +
  geom_edges(aes(color = Intensity)) + # this line changed
  geom_nodes() +
  theme_blank()


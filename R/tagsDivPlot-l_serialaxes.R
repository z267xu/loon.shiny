tagsDivPlot.l_serialaxes <- function(loon.grob, tabPanelName,
                                     loonWidgetsInfo, linkingGroup,
                                     displayedPanel) {

  do.call(
    tags$div,
    remove_null(
      list(
        id = paste0(tabPanelName, 'Plot'),
        class=if(any(grepl("plot", displayedPanel, ignore.case = TRUE))) {NULL} else {"collapse"},
        h6(""),
        checkboxGroupInput(
          inputId = paste0(tabPanelName, "plot"),
          label = NULL,
          choices = c("showGuides", "showAxes", "showAxesLabels", "showLabels",
                      "showItemLabels", "showArea", "andrews"),
          selected = c(
            if(loonWidgetsInfo$showGuides) "showGuides",
            if(loonWidgetsInfo$showAxes) "showAxes",
            if(loonWidgetsInfo$showAxesLabels) "showAxesLabels",
            if(loonWidgetsInfo$showLabels) "showLabels",
            if(loonWidgetsInfo$showItemLabels) "showItemLabels",
            if(loonWidgetsInfo$showArea) "showArea",
            if(loonWidgetsInfo$andrews) "andrews"
          )
        ),
        radioButtons(
          inputId = paste0(tabPanelName, "axesLayout"),
          label = "axes layout",
          choices = c("radial", "parallel"),
          inline = TRUE,
          selected = loonWidgetsInfo$axesLayout
        ),
        radioButtons(
          inputId = paste0(tabPanelName, "scaling"),
          label = "scaling",
          choices = c("variable", "observation", "data", "none"),
          selected = loonWidgetsInfo$scaling
        )
      ),
      as_list = FALSE)
  )
}

week <- 1
library(googlesheets4)
library(magrittr)
x <- gs4_auth(email = readLines("~/mail"))
wk <- read_sheet(readLines("~/sheet"))

current <- wk[wk$week == week,  ]

lapply(
  c(
    "cervangirard", 
    "dianebeldame",
    "eknackstedt",
    "emmavestesson",
    "MaelaKloareg",
    "joelgombin",
    "pacoramon",
    "BenjaminLouis",
    "felixmil",
    "fazepher", 
    "RobWHickman", 
    "clementviolet",
    "einian85"
  ), function(x){
    for (i in 1:nrow(current)){
      if ( current[i, "code"] == "Rest"){
        next
      } else {
        cli::cat_rule(
          sprintf(
            "%s - %s -%s", 
            x,
            as.character(current[i, "code"])
          )
        )
        gh::gh(
          "POST /repos/:owner/:repo/issues",
          owner = "ColinFay",
          repo = "testrun",
          title = sprintf(
            "%s - %s", 
            x,
            as.character(current[i, "code"])
          ), 
          assignee = "ColinFay", 
          body = as.character(current[i, "workout"])
        )
      }
    }
  }
)



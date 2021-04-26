week <- readline("week : ")
library(googlesheets4)
library(magrittr)
x <- googlesheets4::gs4_auth(email = readLines("~/mail"))
wk <- googlesheets4::read_sheet(readLines("~/sheet"))

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
    "einian85", 
    "cderv",
    "lewishounkpevi", 
    "jdtrat"
  ), function(x){
    for (i in 1:nrow(current)){
      if ( current[i, "code"] == "Rest"){
        next
      } else {
        cli::cat_rule(
          sprintf(
            "%s - %s", 
            x,
            as.character(current[i, "code"])
          )
        )
        gh::gh(
          "POST /repos/:owner/:repo/issues",
          owner = "ColinFay",
          repo = "ur-first-5k",
          title = sprintf(
            "%s - %s", 
            x,
            as.character(current[i, "code"])
          ), 
          assignee = x, 
          body = sprintf(
            "Hey @%s, here is %s:\n\n%s\n\n", 
            x, 
            as.character(current[i, "code"]),
            as.character(current[i, "workout"])
          )
        )
      }
    }
  }
)



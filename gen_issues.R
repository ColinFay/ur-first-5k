week <- readline("Enter the current week of the program ")
wk <- readr::read_csv("ur-first-5k.csv")

current <- wk[wk$week == week,  ]
for (i in 1:nrow(current)){
      if ( current[i, "code"] == "Rest"){
        next
      } else {
        cli::cat_rule(
          sprintf(
            "%s - %s",
            "MurielleDelmotte",
            as.character(current[i, "code"])
          )
        )
        gh::gh(
          "POST /repos/:owner/:repo/issues",
          owner = "ColinFay",
          repo = "ur-first-5k",
          title = sprintf(
            "%s - %s",
            "MurielleDelmotte",
            as.character(current[i, "code"])
          ),
          # assignee = "MurielleDelmotte",
          body = sprintf(
            "Hey @%s, here is %s:\n\n%s\n\n",
            "MurielleDelmotte",
            as.character(current[i, "code"]),
            as.character(current[i, "workout"])
          )
        )
      }
    }



box::use(
  str = stringr,
)

readLines('.root') |> setwd()
getwd() -> root

root |>
  file.path("env") |>
  list.files(
    full.names = T,
    pattern = '.env$',
    all.files = T
  ) |>
  lapply(
    read.table,
    comment.char = '#'
  ) -> vars

do.call(rbind, vars) -> vars
c('var', 'set', 'path') -> names(vars)

root |>
  file.path(
    vars$path |>
      str$str_trim() |>
      str$str_remove_all('^\\.\\/')
  ) -> vars$path

vars$var |>
  paste0('=', vars$path) |>
  lapply(
    function(x) {
      system(paste('conda env config vars set', x))
    }
  )

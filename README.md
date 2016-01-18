
<!-- README.md is generated from README.Rmd. Please edit that file -->



ropencoesione
=============

`ropencoesione` - Get data from http://www.opencoesione.gov.it/

### News

- Version 0.1.0 released

### Installation


```r
devtools::install_github("patperu/ropencoesione")
```



### Usage


```r
library("ropencoesione")

# current version
packageVersion("ropencoesione")
#> [1] '0.0.1.1000'
```

### Test Results


```r
library(ropencoesione)
library(testthat)

date()
#> [1] "Mon Jan 18 15:45:37 2016"

test_dir("tests/")
#> testthat results ========================================================================================================
#> OK: 0 SKIPPED: 0 FAILED: 0
```

### Query the projects


```r
res1 <- records_by_progetti(territorio = "palermo-comune")
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
str(res1, 1)
#> List of 3
#>  $ :List of 8
#>   ..- attr(*, "class")= chr [1:2] "ropencoesione_srs" "list"
#>  $ :List of 8
#>   ..- attr(*, "class")= chr [1:2] "ropencoesione_srs" "list"
#>  $ :List of 8
#>   ..- attr(*, "class")= chr [1:2] "ropencoesione_srs" "list"

str(res1[[1]], 1)
#> List of 8
#>  $ count       : int 8997
#>  $ next        : chr "http://www.opencoesione.gov.it/api/progetti?territorio=palermo-comune&page=2"
#>  $ previous    : NULL
#>  $ page_size   : int 25
#>  $ current_page: int 1
#>  $ last_page   : int 360
#>  $ facet_counts:List of 2
#>  $ results     :'data.frame':	25 obs. of  15 variables:
#>  - attr(*, "class")= chr [1:2] "ropencoesione_srs" "list"

res1[[1]]$results[,c(1,2,3,6:9)]
#>                 slug                                                           url      codice_locale
#> 1            1si3580           http://www.opencoesione.gov.it/api/progetti/1si3580            1SI3580
#> 2             1si243            http://www.opencoesione.gov.it/api/progetti/1si243             1SI243
#> 3             1si133            http://www.opencoesione.gov.it/api/progetti/1si133             1SI133
#> 4             1si630            http://www.opencoesione.gov.it/api/progetti/1si630             1SI630
#> 5         1mtra11119        http://www.opencoesione.gov.it/api/progetti/1mtra11119         1MTRA11119
#> 6             1si268            http://www.opencoesione.gov.it/api/progetti/1si268             1SI268
#> 7             1si942            http://www.opencoesione.gov.it/api/progetti/1si942             1SI942
#> 8         1mtra12211        http://www.opencoesione.gov.it/api/progetti/1mtra12211         1MTRA12211
#> 9  1misepac01_000031 http://www.opencoesione.gov.it/api/progetti/1misepac01_000031 1MISEPAC01_00003/1
#> 10        1mtra12116        http://www.opencoesione.gov.it/api/progetti/1mtra12116         1MTRA12116
#> 11           5si1744           http://www.opencoesione.gov.it/api/progetti/5si1744            5SI1744
#> 12      1mtra11119_2      http://www.opencoesione.gov.it/api/progetti/1mtra11119_2       1MTRA11119_2
#> 13        5si1100000        http://www.opencoesione.gov.it/api/progetti/5si1100000         5SI1100000
#> 14           1si9629           http://www.opencoesione.gov.it/api/progetti/1si9629            1SI9629
#> 15 1misepona3_002731 http://www.opencoesione.gov.it/api/progetti/1misepona3_002731 1MISEPONA3_00273/1
#> 16       1mtra121115       http://www.opencoesione.gov.it/api/progetti/1mtra121115        1MTRA121115
#> 17            1si306            http://www.opencoesione.gov.it/api/progetti/1si306             1SI306
#> 18        1mtra12117        http://www.opencoesione.gov.it/api/progetti/1mtra12117         1MTRA12117
#> 19          1si12885          http://www.opencoesione.gov.it/api/progetti/1si12885           1SI12885
#> 20            1si269            http://www.opencoesione.gov.it/api/progetti/1si269             1SI269
#> 21            1si301            http://www.opencoesione.gov.it/api/progetti/1si301             1SI301
#> 22     1misepa01amat     http://www.opencoesione.gov.it/api/progetti/1misepa01amat      1MISEPA01AMAT
#> 23           5si1728           http://www.opencoesione.gov.it/api/progetti/5si1728            5SI1728
#> 24            1si308            http://www.opencoesione.gov.it/api/progetti/1si308             1SI308
#> 25           1si9630           http://www.opencoesione.gov.it/api/progetti/1si9630            1SI9630
#>    classificazione_cup fin_totale_pubblico   pagamento perc_pagamento
#> 1            01.03.031          1077252610 258126848.0       23.96159
#> 2            01.05.032           304548128 172075840.0       56.50202
#> 3            01.03.031           167500000  44895488.0       26.80328
#> 4            01.03.031           152095264         0.0        0.00000
#> 5            01.03.031            90000000  90000000.0      100.00000
#> 6            09.23.001            50000000  50000000.0      100.00000
#> 7            02.10.113            47313796         0.0        0.00000
#> 8            01.03.999            47000000  44608776.0       94.91229
#> 9            06.40.999            44626192  35700952.0       80.00000
#> 10           01.03.031            42000000  42000000.0      100.00000
#> 11           11.80.899            40000000  40057720.0      100.14430
#> 12           01.03.031            39247176         0.0        0.00000
#> 13           11.71.020            33238080         0.0        0.00000
#> 14           02.10.109            26407692         0.0        0.00000
#> 15           06.40.156            22103970  17683176.0       80.00000
#> 16           01.03.999            21938472   3267596.0       14.89437
#> 17           03.06.998            20711984  20711984.0      100.00000
#> 18           01.03.031            20000000    326385.9        1.63193
#> 19           11.72.005            20000000  20000000.0      100.00000
#> 20           05.99.999            20000000  20000000.0      100.00000
#> 21           01.04.045            20000000  20000000.0      100.00000
#> 22           01.05.999            20000000  18592504.0       92.96252
#> 23           11.80.800            19833540  13213235.0       66.62066
#> 24           03.06.998            19649420  19649420.0      100.00000
#> 25           02.10.109            18473730         0.0        0.00000

# Filter by 'tema' and / or 'natura'
res2 <- records_by_progetti(territorio = "roma-comune", tema = "occupazione") 
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
#> No encoding supplied: defaulting to UTF-8.
```

### Meta

* Please [report any issues or bugs](https://github.com/patperu/ropencoesione/issues).
* License: MIT

### Code of Conduct

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). 
By participating in this project you agree to abide by its terms.

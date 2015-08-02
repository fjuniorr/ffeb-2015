# ffeb-2015

Este repositório visa armazenar as análises desempenhadas no âmbito do programa de pesquisa 2015 do FFEB.

Antes de iniciar confira se os pacotes `xlsx`,`readxl`, `forecast` e `reshape2` estão instalados. Caso contrário execute 

```r
install.packages(c("xlsx", "readxl", "forecast", "reshape2"))
```

O pacote `tsDyn` deve ser instalado por meio do comando

```r
devtools::install_github("fjuniorr/tsDyn", subdir = "tsDyn")
```

Para ter acesso ao conteúdo das estimações execute todo o conteúdo do arquivo `main.R`. Para que não haja problemas com o *working directory* abra o arquivo `ffeb-2015.Rproj` no RStudio como um projeto.

A execução do arquivo `main.R` chama oito scripts (todos armazenados em ./src/) e gera diversas variáveis. Segue abaixo uma breve descrição de cada um dos scripts e variáveis criadas.

- `01_read_data.R`

Esse script lê a base de dados armazenada em ./data-raw e realiza um breve tramento nos dados armazenando as séries temporais em uma lista `rcl` onde cada posição está identificada pela sigla do estado (em caixa ALTA). Portanto com `rcl[["MG"]]` é possível acessar a RCL do estado de Minas Gerais. 

`01_read_data.R` também cria as variáveis `in_sample_rcl` e `out_sample_rcl` que possuem a mesma estrutura da lista `rcl` mas compreendem respectivamente o período jan/2003-abril/2013 e maio/2013-dez/2014. Alguns estados não possuem a série completa da RCL e portanto suas amostras de estimação e validação são diferentes (AP, RR e PI).

Por fim, o vetor `states` armazena a sigla de todos os estados.

- `02_adjust_series.R`

Esse script define a função `adjust_series()` que será utilizada para aplicar as transformações nas séries originais. Essa função recebe como paramêtros uma série temporal e uma variável binária que indica se deve ser aplicada uma diferenciação de ordem 1 na série. Além disso, ela também efetua uma transformação logaritmica e uma dessazonalização por médias móveis para sazonalidade aditiva.

A função retorna uma lista com 4 itens, quais sejam, a série original (`original_ts`), a série com as transformações pertinentes (`seas_adj_ts`) (logaritmo, diferenciação e dessazonalização aplicados nesta ordem), os índices mensais gerados na dessazonalização (`figure`) e uma variável binária que indica se a série original foi diferenciada (`is_dif`).

O script também usa a função previamente definida para definir as variáveis `seas_adj_dif_ln_rcl` e `seas_adj_ln_rcl`. O acesso a cada posição da lista é realizado da mesma forma que a variável rcl (ie. `seas_adj_dif_ln_rcl[["MG"]]`), a diferença nesse caso é que existem quatro séries que podem ser acessadas com o operador `$`. Ou seja, para acesso aos índices mensais de dessazonalização, o comando `seas_adj_dif_ln_rcl[["MG"]]$figure` é utilizado.


- `03_01_naive.R`, `03_02_rw.R`, `03_03_ets.R`, `03_04_arima.R` e `03_05_star.R`

Cada um desses scripts realiza as previsões para os modelos indicados no nome do proprio script. Cada script gera dois data.frames para armazenamento dos resultados, um com as previsões (`modelo_forecast`) e um com as medidas de acurácia calculadas mensalmente para todo o período (`modelo_accuracy`).

- `04_export_data`

Esse script gera os data.frames consolidados com as informação de todos os estados (`dt_forecast` e `dt_accuracy`). Além disso, ele exporta as informações para planilhas excel localizadas em /data/.

- `main.R`

O scrit main efetua um `source` em todos os scripts descritos acima para gerar os resultados da análise.

- `05_results`

Esse script, ainda em construção, será utilizado para exploração dos resultados. A única função já definida (`forecas_plot`) permite a construção de um gráfico da execução e previsão da rcl para um determinado estado com a sintaxe `forecast_plot("MG")`.
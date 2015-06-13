# ffeb-2015

Este repositório visa armazenar as análises desempenhadas no âmbito do programa de pesquisa 2015 do FFEB.

Antes de iniciar confira se os pacotes `xlsx`,`readxl`, `forecast` e `tsDyn` estão instalados. Caso contrário execute 

```r
install.packages(c("xlsx", "readxl", "forecast", "tsDyn"))
```

Para ter acesso ao conteúdo das estimações execute todo o conteúdo do arquivo `main.R`. Dois problemas de caminho podem ocorrer nessa execução.

Em primeiro lugar seu *working directory* pode não estar configurado corretamente. Para corrigir isso você pode ou abrir o arquivo `ffeb-2015.Rproj` no RStudio como um projeto ou utilizar `setwd()`.

Além disso, essa análise foi realizada em um iOS, portando é possível que no Windows seja necessário alterar os paths para um caminho válido (o jeito mais fácil é usar `file.choose()` que retorna o path de um arquivo qualquer).

A execução do arquivo `main.R` chama quatro scripts (todos armazenados em ./src/) e gera 15 variáveis. Segue abaixo uma breve descrição de cada um dos scripts e variáveis criadas.

- `read-data.R`

Esse script lê a base de dados armazenada em ./data-raw e realiza um breve tramento nos dados armazenando as séries temporais em uma lista `rcl` onde cada posição está identificada pela sigla do estado (em caixa ALTA). Portanto com `rcl[["MG"]]` é possível acessar a RCL do estado de Minas Gerais. `read-data.R` também cria as variáveis `in_sample_rcl` e `out_sample_rcl` que possuem a mesma estrutura da lista `rcl` mas compreendem respectivamente o período jan/2003-dez/2012 e jan/2013-dez/2014.

Por fim o vetor `states` armazena a sigla de todos os estados e o vetor `missing` armazena as siglas do estados que possuem dados faltantes para os quais não foram ajustadas previsões.

- `adjustments.R`

Esse script define a função `adjust_series.R` que será utilizada para aplicar as transformações nas séries originais. Essa função recebe como paramêtros uma série temporal e uma variável binária que indica se deve ser aplicada uma diferenciação de ordem 1 na série. Além disso, ela também efetua uma transformação logaritmica e uma dessazonalização por médias móveis para sazonalidade aditiva.

A função retorna uma lista com 4 itens, quais sejam, a série original (`original_ts`), a série com as transformações pertinentes (`seas_adj_ts`) (logaritmo, diferenciação e dessazonalização aplicados nesta ordem), os índices mensais gerados na dessazonalização (`figure`) e uma variável binária que indica se a série original foi diferenciada (`is_dif`).  
- `forecasts.R`

Esse script define duas funções que serão utilizadas para gerar as previsões das séries transformadas. Ambas recebem como paramêtro uma série temporal já com as transformações efetuadas e retornam previsões 24 passos a frente no nível da série original, efetuando as operações inversas da função `adjust_series`. Atualmente foram definidas a função `forecast_rw` que ajusta um Passeio Aleatório, a função `forecast_ets` que ajusta um modelo de Alisamento Exponencial, a função `forecast_arima` que ajusta um modelo ARIMA e a função `forecast_star` que ajusta um modelo STAR.

- `forecast-plot.R`

Esse script define a função `forecast_plot.R` que recebe como parâmetros a sigla de um estado, e duas listas com as previsões do Passeio Aleatório, do Alisamento Exponencial, do ARIMA e do STAR e plota essas séries no mesmo gráfico. Seu uso é portanto

```r
forecast_plot("MG", 
            rw_forecast = rw_forecast,
            ets_forecast = ets_forecast,
            arima_forecast = arima_forecast,
            star_forecast = star_forecast)
```

- `main.R`

O scrit main efetua um `source` em todos os scripts, utiliza as funções que foram definidas previamente e calcula medidas de acurácia para todos os modelos. 

As medidas de acurácia podem ser acessadas nas tabelas `accuracy_rw`, `accuracy_ets`,  `accuracy_arima` e `accuracy_star`.

As previsões para cada modelo estão armazenadas em listas, quais sejam, `rw_forecast`, `ets_forecast`, `arima_forecast` e `star_forecast`.

Além disso, as medidas de acurácia de todos os modelos são exportadas para um arquivo excel em `./data/accuracy.xls`. Esse arquivo será subscrito em todo momento que o `main.R` for executado.
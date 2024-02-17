FROM rocker/r-ver:4.3

WORKDIR /app

RUN R -e 'install.packages("renv", repos="https://packagemanager.posit.co/cran/__linux__/jammy/2024-02-09")'

COPY renv.lock renv.lock
RUN \
  --mount=type=cache,target=/root/.cache/R/renv \
  R -e 'renv::restore()'

COPY app.R entrypoint.R ./

EXPOSE 8080
CMD ["Rscript", "entrypoint.R"]

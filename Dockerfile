FROM rocker/r-ubuntu

RUN mkdir /final
WORKDIR /final

RUN apt-get update
RUN apt-get install -y pandoc
RUN apt-get install -y vim
RUN apt-get install -y \
      libcurl4-openssl-dev \
      libssl-dev \
      libxml2-dev \
      pkg-config \
      gdal-bin libgdal-dev \
      libgeos-dev \
      libproj-dev \
      libudunits2-dev \
      libabsl-dev \
      cmake && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir code
RUN mkdir output
RUN mkdir figures
RUN mkdir raw_data
RUN mkdir tables

COPY code code
COPY raw_data raw_data
COPY Makefile .
COPY final_report.Rmd .
COPY .Rprofile .
COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "renv::restore(prompt=FALSE)"

RUN mkdir report

CMD ["make", "report/final_report.html"]
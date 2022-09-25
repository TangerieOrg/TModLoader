FROM mcr.microsoft.com/dotnet/sdk:5.0 as build-env

WORKDIR /terraria

RUN apt-get update && \
    apt-get install -y wget unzip

COPY ./init.sh init.sh

RUN ./init.sh

RUN rm init.sh


FROM mcr.microsoft.com/dotnet/sdk:5.0

WORKDIR /terraria
COPY --from=build-env /terraria .

WORKDIR /terraria/tModLoader

COPY start.sh start.sh
RUN chmod +x start.sh
COPY serverconfig.txt serverconfig.txt

ENTRYPOINT [ "bash" ]
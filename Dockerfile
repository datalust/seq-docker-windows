FROM microsoft/windowsservercore

ENV ACCEPT_EULA=N

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ADD ["Setup.ps1", "C:/seq-docker/Setup.ps1"]

ADD ["Run.ps1", "C:/seq-docker/Run.ps1"]

ARG SEQ_VERSION

LABEL Description="Seq (Windows Server)" Vendor="Datalust" Version="$SEQ_VERSION"

RUN powershell.exe "C:/seq-docker/Setup.ps1" $env:SEQ_VERSION

ENTRYPOINT powershell.exe "C:/seq-docker/Run.ps1" $env:ACCEPT_EULA

EXPOSE 5341

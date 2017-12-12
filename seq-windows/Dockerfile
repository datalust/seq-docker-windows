FROM microsoft/windowsservercore

ENV ACCEPT_EULA=N

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ADD ["Run.ps1", "C:/seq-docker/Run.ps1"]

ARG SEQ_VERSION

LABEL Description="Seq (Windows Server)" Vendor="Datalust" Version="$SEQ_VERSION"

RUN Invoke-WebRequest https://getseq.net/Download/Begin?version=$env:SEQ_VERSION -OutFile C:/seq-docker/Seq-$env:SEQ_VERSION.msi -UseBasicParsing ; \
    Start-Process msiexec.exe -ArgumentList '/i C:\\seq-docker\\Seq-$env:SEQ_VERSION.msi /quiet /norestart' -Wait ; \
    Remove-Item C:/seq-docker/Seq-$env:SEQ_VERSION.msi -Force

CMD ["powershell", "C:/seq-docker/Run.ps1", "$ACCEPT_EULA"]

EXPOSE 5341

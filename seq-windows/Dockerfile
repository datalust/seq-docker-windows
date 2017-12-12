FROM microsoft/windowsservercore

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop';"]

ARG SEQ_VERSION

LABEL Description="Seq (Windows Server)" Vendor="Datalust" Version="$SEQ_VERSION"

RUN Invoke-WebRequest https://getseq.net/Download/Begin?version=$env:SEQ_VERSION -OutFile C:/Seq-$env:SEQ_VERSION.msi -UseBasicParsing ; \
    Start-Process msiexec.exe -ArgumentList '/i C:/Seq-$env:SEQ_VERSION.msi /quiet /norestart' -Wait ; \
    Remove-Item c:\Seq-$env:SEQ_VERSION.msi -Force

CMD ["C:/Program Files/Seq/Seq.exe", "run"]

EXPOSE 5341

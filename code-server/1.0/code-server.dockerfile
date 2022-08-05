FROM codercom/code-server:latest

COPY ./vscode-192.png /usr/lib/code-server/src/browser/media/pwa-icon-192.png
COPY ./vscode-512.png /usr/lib/code-server/src/browser/media/pwa-icon-512.png
COPY ./vscode.svg /src/browser/media/favicon-dark-support.svg
COPY ./settings.json /home/coder/.local/share/code-server/User/settings.json
FROM codercom/code-server:latest

COPY ./vscode-192.png /usr/lib/code-server/src/browser/media/pwa-icon-192.png
COPY ./vscode-512.png /usr/lib/code-server/src/browser/media/pwa-icon-512.png
COPY ./vscode.svg /src/browser/media/favicon-dark-support.svg
COPY ./settings.json /home/coder/.local/share/code-server/User/settings.json

RUN sudo chmod -R 0777 /home/coder/.local/share/code-server
RUN sudo chmod 0777 /home/coder/.local/share/code-server/User/settings.json

ENTRYPOINT ["/usr/bin/entrypoint.sh", "--bind-addr", "0.0.0.0:8080", "/home/coder/project"]
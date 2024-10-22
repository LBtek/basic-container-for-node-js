FROM debian:stable

RUN apt-get update && apt-get upgrade -y
RUN apt-get install curl wget git -y

COPY ./root/set-zsh.sh .
RUN chmod +x ./set-zsh.sh && ./set-zsh.sh

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
RUN tar -C /opt -xzf nvim-linux64.tar.gz
RUN echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc

RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

WORKDIR /usr/src/front-end
COPY . .

RUN chmod +x ./nvm-install-node.sh
RUN zsh ./nvm-install-node.sh

RUN chmod +x ./entrypoint.sh

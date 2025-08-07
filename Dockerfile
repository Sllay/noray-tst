FROM node:20-alpine
# UDP host for remote address registration
EXPOSE 8809/udp
# TCP host for commands
EXPOSE 8890/tcp
# HTTP host for Prometheus metrics
EXPOSE 8891/tcp
# Relay UDP ports (reduzido para evitar limite de portas)
EXPOSE 49152/udp
EXPOSE 49153/udp
EXPOSE 49154/udp

COPY . noray
WORKDIR noray

RUN npm install -g npm@latest && \
    npm install -g pnpm && \
    pnpm --version && \
    pnpm setup && \
    mkdir -p /usr/local/share/pnpm && \
    export PNPM_HOME="/usr/local/share/pnpm" && \
    export PATH="$PNPM_HOME:$PATH" && \
    pnpm bin -g && \
    pnpm install

CMD ["pnpm", "start:prod"]

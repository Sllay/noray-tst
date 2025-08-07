FROM node:20-alpine

# UDP host for remote address registration
EXPOSE 8809/udp
# TCP host for commands
EXPOSE 8890/tcp
# HTTP host for Prometheus metrics
EXPOSE 8891/tcp

COPY . noray
WORKDIR noray

# Instala dependências via npm (ignora qualquer engine check pendente no pnpm)
RUN npm install --legacy-peer-deps

CMD ["npm", "run", "start:prod"]

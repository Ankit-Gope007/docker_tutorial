#--Stage-1-- build stage
FROM node:22-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .



# ---Stage-2---Production-Stage
FROM node:22-alpine

WORKDIR /app

# coppy from builder
COPY --from=builder /app /app

EXPOSE 3000

CMD ["npm","run","dev"]
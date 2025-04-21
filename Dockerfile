FROM node:20-slim

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json

RUN npm install

COPY . .

ENV DATABASE_URL="postgresql://neondb_owner:npg_a7GX0dTtnuDO@ep-polished-bush-a4ql80ly-pooler.us-east-1.aws.neon.tech/neondb?sslmode=require"

RUN DATABASE_URL=$DATABASE_URL npx prisma migrate dev
RUN npx prisma generate
RUN npm run build
CMD ["npm", "run", "start"] 
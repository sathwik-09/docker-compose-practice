import express from 'express';
import { PrismaClient } from './generated/prisma';

const app = express();
const prismaclient = new PrismaClient();

app.get('/', async(req, res) => {
  const data = await prismaclient.user.findMany();
  res.send(data);
});

app.post('/', async(req, res) => {
  const data = await prismaclient.user.create({
    data: {
      username: 'Sathwik',
      password: '123456',
    },
  })
  res.send(data);
});

app.listen(3000, () => {
  console.log('Server is running on port 3000');
});
const request = require('supertest');
const express = require('express');

const app = express();
app.get('/', (req, res) => {
  res.send('Hello from Node.js app running in Docker!');
});

describe('GET /', () => {
  it('should return greeting message', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.text).toBe('Hello from Node.js app running in Docker!');
  });
});


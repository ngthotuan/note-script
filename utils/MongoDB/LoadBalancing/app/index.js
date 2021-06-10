const http = require('http');
const os = require('os');

const port = 3000;

const server = http.createServer((req, res) => {
    res.write(`Hello from ${os.hostname()}`);
    res.end();
});

server.listen(port, () => console.log('Server is listening on', port));
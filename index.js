import express from 'express'

const app = express()
const port = process.env.PORT || 3000


app.get('/', (req, res) => {
    res.json({message:'Hello from a container',service:'hello-node', pod:process.env.POD || 'unknown', time:new Date().toISOString()})
})

app.get('/readyz', (req, res) => {
    res.status(200).send('ready')
})

app.get('/rhealthz', (req, res) => {
    res.status(200).send('ok')
})

app.listen(port, () => console.log(`App listening on port http://localhost:${port}`))
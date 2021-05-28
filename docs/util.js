// util.js
const D=document
function cl(x){console.log(x)}
function GEBI(x){return D.getElementById(x)}
function replace(x,k,v){const r = x[k];x[k] = v;return r}
function PubSubSocket(path){
    const ws = new WebSocket(`ws://${location.host}${path}`)
    ws.pub = function(ch, msg){ ws.send(`(pub 1 "${ch}")`), ws.send(msg)}
    ws.sub = function(channels){ws.send(`(sub "${channels}")`)}
    return ws}

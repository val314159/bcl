// app.js
const outElt = GEBI("out")
function out(x){outElt.appendChild(D.createTextNode(x))}
function  pr(x){out(x+"\n");return x}
function   p(x){out(x     );return x}
function keydown(t,e){
    if(e.code!='Enter')return
    if(!e.altGraphKey&&
       !e.altKey&&
       e.ctrlKey&&
       !e.metaKey&&
       !e.shiftKey){
	cl("SUBMIT THIS")
	var value = replace(t,'value','')
	cl("SUBMIT THIS " + value)
	const ws = new PubSubSocket("/bongo")
	ws.onopen = function(){
	    cl("OPN")
	    ws.sub("x b u")}
	ws.onclose = function(){
	    cl("CLS")
	}
	ws.onmessage = function(e){
	    const data = e.data
	    cl(["DATA:",data])
	    if(!value) ws.close()
	    else{ws.pub(value)
		 value = ""}}
	return false}
    if(!e.altGraphKey&&
       e.altKey&&
       !e.ctrlKey&&
       !e.metaKey&&
       !e.shiftKey){
	cl("EVALUATE THIS")
	const value = replace(t,'value','')
	cl("EVALUE THIS " + value)
	return false}}

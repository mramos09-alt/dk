function lutar(){
    const classe = document.getElementById('classe').value;
    const arma = document.getElementById('arma').value.trim();
    const log= document.getElementById('log');

    if(!arma){
        log.innerHTML ="voce esqueceu de equipar uma arma"
}
let dado = Math.floor(Math.random()* 20) +1;
let resultado ='dado: ${dado} | <straong> ${classe}</straong> com <straong>${arma}</straong>';

switch(classe){
   case"guerreiro":
    if(arma.toLowerCase ()==="espada"&& dado >5){
    resultado+= "<span class= 'sucesso'>sucesso: voce decapitou o mosntro com um golpe de espada!</span>"
    } else if (dado >15){
        resultado += "<span class= 'sucesso'> vitoria: na força bruta, voce o esmagou o inimigo com seu "
    }else{
        resultado+= "<span class= 'derrota'>"
    }

}
}
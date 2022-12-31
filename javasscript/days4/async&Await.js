const getNomorAntri= (nomor) => {
  return  new Promise((resolve,reject) => {
        setTimeout(() => {
            resolve(nomor)
            },1000);
    })
}


const pilihPaket = (nomor,paket)=>{
    return new Promise((resolve,reject)=>{
        let msg ='';
        if (nomor <= 10 && !(isNaN(nomor))){
            msg="silahkan antri";
        }
        else {
            if (paket == "A"){
                msg="KFC PAKET A" 
            } else {
                msg="KFC PAKET B" ;
            }
        }
        setTimeout(()=>{
            resolve (msg)
        },2000);
        
    }) 
    
}
// pilihPaket(1,"B")

const tagihan = (paket) => {
   return new Promise((resolve,reject) => {// lengkapi promise dengan return
    let harga = 0;
    if (paket === "A"){
        harga=25000;
    } else {
        harga=24000
    }
    setTimeout(()=>{
        resolve(harga)
        
    },3000);
   })
  

}

// getNomorAntri(10)
// pilihPaket(10,"A")
// tagihan("A")

const orderKFC = async(paket) => {
    const nomorAntri = await getNomorAntri(11);
    const menu = await pilihPaket(paket);
    const total = await tagihan(menu);
    return [nomorAntri,menu,total];
}

orderKFC("A").then(res => console.log(res));
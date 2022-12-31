let arrayList = [];
for(let i=2;i<20;i+=2){
    arrayList.push(i);
}
console.log(arrayList);
arrayList.pop();  // menghapus data terakhir
console.log(arrayList);

let hasil = ''
for (let e of arrayList) {
    hasil+=(e+3)+' ';
}
console.log(hasil);


arrayList.map(e=>{
    hasil += e + ' ';
})
console.log(hasil);

arrayList.forEach(e => console.log(e))
arrayList.map(arr=>console.log(arr))


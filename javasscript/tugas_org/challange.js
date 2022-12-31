/* Buat 2 object array
    array yang kedua dapat diisi apabila array yang pertama telah terisi*/

function objArray(nama, alamat){
    this.nama = nama
    this.alamat = alamat
}

let objectArray = []
let objectArray1 =[]
//Without Using setTimeout and Promise
const insertArray01 = () => {
    let array1 = Object.assign({}, new objArray())
    array1.nama = "Eugene"
    array1.alamat = 'Jl. Merdeka'
    objectArray.push(array1)
    console.log("Object Pushed")
    return array1
}
// Using setTimeout and Promise
const insertArray02 = () => {
    return new Promise ((resolve, reject)=> {
        let array2 = Object.assign({}, new objArray())
        array2.nama = "Nonoy"
        array2.alamat = "Jl. yang gelap"
        
        setTimeout( () => {
            objectArray.push(array2)
            resolve(objectArray)
            console.log("Object 2 Pushed")
        },3000)
        
        return array2
    });
}
const insertArray03 = () =>{
    
    let array3 = Object.assign({}, new objArray())
    array3.nama = "Edwell"
    array3.alamat = "Jl. Kematian"
    setTimeout(()=>{
        objectArray1.push(array3)
        console.log("Object 3 Pushed")
    },4000)
    return array3

}
const insertArray04 = () => {
    return new Promise((resolve, reject)=> {
        let array4 = Object.assign({}, new objArray())
        array4.nama = "Henrialen"
        array4.alamat = "Jl. Kehidupan"
        objectArray1.push(array4)
        resolve(objectArray1)
    })

}

const callArray = async() =>{
    
    await insertArray01()
    await insertArray02()
    if(objectArray.length !==0){
        await insertArray03()
        await insertArray04()
    }
    else{
        console.log("Harus Masukkan array object yang pertama")
    }
    return[objectArray,objectArray1]
}

callArray().then(res => console.log(res))


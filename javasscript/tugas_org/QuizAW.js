
const Users = [];
const Cars = [];

function addUser(nama, email, alamat, active, age) {
    this.nama = nama,
    this.email = email,
    this.alamat = alamat,
    this.active = active,
    this.age = age
}

function addCar(nama, brand, model, color) {
    this.nama = nama,
    this.brand = brand
    this.model = model,
    this.color = color
}

const objUser = Object.assign({}, new addUser('Rendra', 'ren@gmail.com', 'Jalan Kutilang', true, 24));
const objCar = Object.assign({}, new addCar('Ionic', 'Hyundai', 'Ionic 5', 'grey'));
const objCar2 = Object.assign({}, new addCar('Tesla', 'Tesla', 'Tesla X', 'White'));

function InsertUser(array, obj){
    return new Promise((resolve) => {
        setTimeout(()=>{
            array.push(obj);
            resolve(array);
            console.log(array);
            // console.log('\n');
        }, 4000)
    })
    
}
function InsertCar(array, obj){
    return new Promise((resolve) => {
        setTimeout(()=>{
            array.push(obj);
            resolve(array);
            console.log(array);
            // console.log('\n');
        }, 10000)
    })
   
}

const Store = async()=>{
    await InsertUser(Users, objUser)
    await InsertCar(Cars, objCar)
    await InsertCar(Cars, objCar2)

    return [Users, Cars]
}

Store().then(res => console.log(res))
.catch(e => console.log(e))
  
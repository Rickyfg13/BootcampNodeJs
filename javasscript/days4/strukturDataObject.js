let users = [
    {
    nama : "Erik",
    email: "erik@gmail.com",
    alamat: "jalan merdeka",
    active: true
    },

]

// console.log(users)

// let data = [];
// for (let e in users){
//     data.push(users[e])
// }
// console.log(data);

// users.nama ="Doni";
// users.age = 28;
// console.log(users);

let usersBaru = users

function addUsers  (nama,email,alamat,active,age ) {
    this.nama=nama,
    this.email=email,
    this.alamat=alamat,
    this.active=active,
    this.age=age
}

let objUsers=[];

let user1 = Object.assign({}, new addUsers('Beno','Beno@gmail.com','Jalan bekti',23,true));
let user2 = Object.assign({}, new addUsers());
let user3 = Object.assign({}, new addUsers());

user1.nama= "Beno"
user1.email= "Beno@gmail.com"
user1.alamat= "Jalan bekti"
user1.age= 23
user1.active= true

user2.nama= "Kimberley"
user2.email= "Beno@gmail.com"
user2.alamat= "Jalan bekti"
user2.age= 29
user2.active= true

user3.nama= "Dani"
user3.email= "danik@gmail.com"
user3.alamat= "Jalan bekti"
user3.age= 35
user3.active= true

objUsers.push(user1,user2,user3)
let data = objUsers.map(e =>{
    console.log(e)
})
// console.log(objUsers)

for ( let e of objUsers){
    for (key in e){
        if(key == "nama")
        console.log(e[key])
    }
    // console.log(e.name)
    // console.log("Object"+ JSON.stringify(e)) // Mengkonversi nilai object ke array
}


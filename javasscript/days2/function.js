// 1.PARAMETER REGULAR FUNCTION
// tidak VOID

// function sayHello(){
//     return "hi mate";
// }

// console.log(sayHello());


// Void

// function sayHello1(firstName){
//     console.log(firstName) ;
// }

// sayHello1("cemas kau dek");

// 2. CALLBACK FUNCTION
// function startEngine(){
//     console.log("Engine start...");
// }
// function changeGear(gear){
//     console.log(`Masukan gigi ${gear} to move a car`);
// }
// function goCar(){
//     console.log("Mobile Berjalan");
// }
// function stopACar(){
//     console.log("Mobil berhenti...");
// }
// function shutdownEnggine(){
//     console.log("Mobil dimatikan...");
// }

// // call main function
// function driveACar(callBackFunction){
//     callBackFunction();
//     changeGear(1);
//     goCar();
//     stopACar();
//     shutdownEnggine();
// }

// driveACar(startEngine);

// 3. ARROY FUNCTION 
//     const startEngine = () => {
//         console.log("Engine start...");
//     }
//     const changeGear = (gear) => {
//         console.log(`Masukan gigi ${gear} to move a car`);
//     }
//     const goCar = () => {
//         console.log("Mobile Berjalan");
//     }
//     const stopACar= () =>{
//         console.log("Mobil berhenti...");
//     }
//     const shutdownEnggine = () => {
//         console.log("Mobil dimatikan...");
//     }
    
//     // call main function
//     const  driveACar = (callBackFunction) => {
//         callBackFunction();
//         changeGear(1);
//         goCar();
//         stopACar();
//         shutdownEnggine();
//     }
    
//     driveACar(startEngine);

//     // CONTOH 2
//     // VOID
//     const add = (x,y) => 
//     console.log(x+y);
//     add(3,4);
//     // NON VOID
//     const add1 = (x,y) =>
//     (x * y);
//     console.log(add1(4,5));

//     // FUNCTION ANONYMOUS
//     let show = () => {
//         console.log('Anonymous function');
//     };
//     show();

// let person = {
//     firstName: 'john',
//     lastName: 'doe'
// };

// (function tampil(person) {
//     console.log(person.firstName + ' ' + person.lastName);
// })(person);


// // FUNCTION SET TIME OUT
// function driveACarTimeOut (callBackFunction){
//     setTimeout( () => {
//         callBackFunction();
//     }, 1000);

//     setTimeout( () => {
//         changeGear(1);
//     }, 2000);
//     setTimeout( () => {
//         goCar();
//     }, 3000);
//     setTimeout( () => {
//         stopACar();
//     }, 4000);
//     setTimeout( () => {
//         shutdownEnggine();
//     }, 5000);

// }

// driveACarTimeOut(startEngine);


// REKURSIF ADALAH FUNCTION YANG MEMANGGIL DIRI SENDIRI
// function countDown(fromNumber){
//     console.log(fromNumber);
//     countDown(fromNumber-1);
// }
// countDown(2);

// function countDown(fromNumber){
//     console.log(fromNumber);
//     countDown(fromNumber);

//     let nextNumber = fromNumber +1;

//     if (nextNumber < 11){
//         countDown(nextNumber);
//     }
// }
// countDown(0)

// function bilGenap(number){
//     let nextNumber = number + 1
//     if(nextNumber < 21){
//         nextNumber % 2 == 0 ? console.log(nextNumber):console.log('')
//         bilGenap(nextNumber)
//     }
// }
// bilGenap(0)

// function Segitiga(s){
//   if (s == 0){
//     return;
//   }
//   Segitiga(s-1);
//   console.log('*'.repeat(s));
// }

// Segitiga(8)

// function printTriangle(n) {
//     if (n === 0) {
//       return;
//     }
//     printTriangle(n - 1);
//     console.log('*'.repeat(n));
//   }
  
//   printTriangle(100);

let huruf ='';
let angka = 0;

function segitiga(x){
  let p = x - 1;
  huruf+= '*';
  if (angka <= x){  
    console.log(huruf);
    segitiga(p);
  }
}
segitiga(5);

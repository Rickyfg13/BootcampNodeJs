let rl = require('readline-sync');
// let angka1 = parseInt(rl.question('Masukan data :'));


// if (angka1>5)
// {
//     console.log("Angka yang diinput lebih besar dari 5")
// } else {
//     console.log("Angka kecil dari 5")
// }

// if (angka1 == 5 )
// {
//     console.log("Angka yang diinput sama dengan 5")
// }else if (angka1 >= 5 )
// {
//     console.log("Angka yang diinput lebih besar dari 5")
// }else if (angka1 != 5 )
// {
//     console.log("Angka yang diinput tidak sama dengan 5")
// }else if (angka1 <= 5 )
// {
//     console.log("Angka yang diinput kurang dari sama dengan 5")
// } else{
//     console.log("Angka yang diinput tidak ada sesuai kondisi")
// }
let weight = 80;
let height = 1.73; 

let bmi = weight / (height*height);
let weightStatus;
// let weightStatus = bmi < 18.5 ? "Underweight" : bmi > 18.5 && bmi <= 24.9 ? "Helthy Weight"  : bmi >= 25 && bmi <= 29.9 ?  "Overweight" :  "Obesity"

// if(bmi < 18.5)
// {
//     weightStatus = "Underweight";
// } else if(bmi > 18.5 && bmi <= 24.9)
// {
//     weightStatus = "Helthy Weight";
// } else if (bmi >= 25 && bmi <= 29.9 )
// {
//     weightStatus = "Overweight";
// } else {
//     weightStatus = "Obesity";
// }

switch (true){
    case bmi < 18.5:
        weightStatus = "Underweight";
        break;
    case bmi > 18.5 && bmi <= 24.9:
        weightStatus = "Helthy Weight";
        break;
    case bmi >= 25 && bmi <= 29.9:
        weightStatus ="Overweight";
        break;
    default:
        weightStatus = "Obesity";
}

// console.log(weightStatus);

// let year = 2022;
// let month = 2;
// let dayCount;

// switch(month){
//     case 1:
//     case 3:
//     case 5:
//     case 7:
//     case 8:
//     case 10:
//     case 12:
//     dayCount = 31;
//     break;
//     case 4:
//     case 6:
//     case 9:
//     case 11:
//     dayCount = 30;
//     break;
//     case 2:
//         // leap year
//         if ((year % 4 == 0 && !(year % 100 == 0)) || year % 400 == 0  ){
//             dayCount = 29;
//         } else {
//             dayCount = 28;
//         }
//     break;
//     default:
//         dayCount= "tidak ditemukan";
// }

// console.log(dayCount);


// let grade = 85;
let hasil;

// if (grade >= 90 && grade <= 100 ){
//     hasil = 'A';
// } else if (grade >= 80 && grade <= 89 ){
//     hasil = 'B';
// } else if (grade >= 70 && grade <= 79 ){
//     hasil = 'C';
// } else if (grade >= 60 && grade <= 69 ){
//     hasil = 'D';
// } else if (grade >= 50 && grade <= 59 ){
//     hasil = 'E';
// } else {
//     hasil = "Nilai tidak diketahui";
// }

// console.log(hasil)
let grade = parseInt(rl.question('Masukan data :'));

switch(true){
    case grade >= 90 && grade <= 100:
        hasil = 'A';
        break;
    case grade >= 80 && grade <= 89:
        hasil = 'B';
        break;
    case grade >= 70 && grade <= 79:
        hasil = 'C';
        break;
    case grade >= 60 && grade <= 69:
        hasil = 'D';
        break;
    case grade >= 50 && grade <= 59:
        hasil = 'E';
        break;
    default:
        hasil="Nilai tidak ditemukan";

}

console.log(hasil)




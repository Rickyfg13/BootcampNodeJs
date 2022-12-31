let data: string = "hallo";
let data1: number = 20;
let data2: string = "hallo";
let data3: boolean = false;
let data4: any = "duatiga";
console.log(data, data1, data2, data3, data4);

let nama = "doni";
console.log(nama);

let a: string[] = ["a", "b", "c", "d"];
console.log(a);

let cs: string | number; // UNION
cs = "ui";
cs = 2;

// TUPLE TIDAK DAPAT DI MANIPULASI
// CONTOH DATA TUPLE
let color: [number, number, number] = [255, 0, 0];
// Tanda tanya merepresentasikan optional yaitu data boleh diisi atau tidak
let color1: [number, number, number, number?] = [255, 0, 0];

// ALIAS DI TS
type alunion = number | string | boolean;
let b: alunion;
b = true;
b = 20;

//  TYPE DATA ENUM
// enum Month {
//     jan,feb,mar,apr,mei
// };

// let mulaiKerja : Month.jan
// console.log(mulaiKerja)

// enum ApprovalStatus{
//     draft,
//     submitted,
//     approved,
//     rejected,
// }

// let statusApproved :ApprovalStatus.approved
// let statusRejected :ApprovalStatus.rejected
// console.log(statusRejected);
console.log("---------------------" + "\n");
// IF ELSE
let discount: number;
let itemCount = -11;
try {
  if (itemCount > 0 && itemCount <= 5) {
    discount = 5;
  } else if (itemCount > 5 && itemCount <= 10) {
    discount = 10;
  } else if (itemCount > 10) {
    discount = 15;
  } else {
    throw new Error("The number of items cannot be negative!");
  }
  console.log(`you got ${discount}% discount`);
} catch (e: any) {
  console.log(e.message);
}

console.log("-------------");

// MENGGUNAKAN SWITCH CASE
try {
  switch (true) {
    case itemCount > 0 && itemCount <= 5:
      discount = 5;
      break;
    case itemCount > 5 && itemCount <= 10:
      discount = 10;
      break;
    case itemCount > 10:
      discount = 15;
      break;
    default:
      throw new Error("The number of items cannot be negative!");
  }
} catch (e: any) {
  console.log(e.message);
}

// LOOPING for bilangan genap
for (let index = 0; index < 20; index += 2) {
  console.log(index);
}

// looping for dengan  array
let temp: number[] = [];
for (let index = 0; index < 10; index += 2) {
  temp.push(index);
  console.log(temp);
}

// looping DO WHILE
let index = 0;
while (index < 10) {
  console.log(index);
  index += 2;
}

// function pada ts
function tambah(x: any, y: any) {
  console.log(x + y);
}

tambah(5, 6); // output : 5 + 6 = 11

function tambah1(x: any, y: any) {
  console.log(x + y);
}

tambah1("5", "6"); // output : 5 + 6 = 56 ,jika tipe data string atau menjadi concat

let tambah_nilai: (x: number, y: number) => number; // nilai return dari let tambah_nilai harus number
tambah_nilai = function (x: number, y: number) {
  return x + y;
};

console.log(tambah_nilai(11, 23));

// FUNGSI OPTIONAL
function tambah5(x: number, y: number, z?: number): number {
  if (typeof z !== "undefined") {
    return x * y * z;
  }
  return x * y;
}

// REST PARAMETER = ...
function getTotal1(...numbers: number[]): number {
  let total = 0;
  numbers.forEach((num) => (total += num));
  return total;
}

console.log(getTotal1(10, 20, 30)); // 60

function getTotal(x: number, y: number, ...numbers: number[]): number {
  let total: number = 0;
  numbers.forEach((e) => (total += e + x), y);
  return x + y + numbers[0];
}

console.log(getTotal(10, 2, 3)); // 15

// OVERLOADING FUNCTION
function addNumber(a: number, b: number): number {
  return a + b;
}
function addNumber1(a: string, b: string): string {
  return a + b;
}

function add(a: number | string, b: number | string): any {
  if (typeof a == "number" && typeof b == "number") {
    return a + b;
  }
  if (typeof a == "string" && typeof b == "string") {
    return a + b;
  }
}

console.log(add(8, 11));

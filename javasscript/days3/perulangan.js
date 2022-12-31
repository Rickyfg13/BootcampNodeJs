let ranks = ['A','B','C'];

// for (let i = 0; i <  ranks.length; i++){
//     console.log(ranks[i]);
// }

// for (const[index,rank] of ranks.entries()){
//     console.log(`${rank} is at index ${index} `)
// }

// let colors = ['red','green','blue'];

// for(const[index,color] of colors.entries()){
//     console.log(`${color} is at index ${index} `);
// }

const users = [
    {
    name : 'John Doe',
    email : 'john.do@example.com',
    age : 25,
    dob : '08/02/1999',
    active : true,
    },
    {
    name : 'Mas Doe',
    email : 'john.do@example.com',
    age : 25,
    dob : '08/02/1999',
    active : true,
    },
    {
    name : 'Mas Leh',
    email : 'john.do@example.com',
    age : 25,
    dob : '08/02/1999',
    active : true,
    },
    {
    name : 'Mbak Lengs',
    email : 'john.do@example.com',
    age : 25,
    dob : '08/02/1999',
    active : true,
    },
    {
    name : 'mbak mas',
    email : 'john.do@example.com',
    age : 25,
    dob : '08/02/1999',
    active : true,
    },

]


// for (const[index,rank] of ranks.entries()){
//     console.log(`${rank} is at index ${index} `)
// }

// for(let key of users){
//     for(let item in key){
//       console.log(`${item} : ${key[item]}`)
//     }
//   }

  // for(let key of users){
  //   for(let data in key){
  //     console.log(`${data} : ${key[data]}`)
  //   }
  // }

// for (const key of users){
//     for (const index in key){
//         console.log(key)
//     }
// }

// KOTAK
// let lastCount = 0;
// for (let i = 0; i < 5; i++){
//   let concat = 0;
//   for(let j = 1; j < 5; j++){
//     concat = concat + (i+j) + " "
//   }
//   console.log(concat);
//   console.log();
// }

// for (let i = 0; i < 6; i++)
// {
//   let concat = "";
//   for (let j = i; j < 6; j++)
//   {
//     concat = j-i +" "+ concat
//   }

//   console.log(concat.replace("0",""));
//   console.log();
// }

let concat = "  ";
console.log(concat.repeat(5) + 6);
console.log(concat.repeat(4) + 4 + concat.repeat(2));
console.log(concat.repeat(3) + 3 + " " + " " + " " + "");
console.log(concat.repeat(2) + 2 + " " + " " + " " + " " + " " + " ");
console.log(concat.repeat(1) + 1 + " " + " " + " " + " " + " " + " " + " " + " ");
console.log(1 + " " + 2 + " " + 3 + " " + 4 + " " + 5 + " " + 6 );


//  for(let i = 0; i < 10; i++){
//   console.log(i+1)
//   if(i+1 == 3) 
//   break;
// }

// console.log('\n GENAP \n')
// for(let i = 0; i < 10; i++){
//   if(i%2 !== 0){
//   continue;
//   }
//   console.log(i)
// }

// const emptyArray =[];
// const foods =["sup","pizza","pasta"];
// const students =[
//   {name : "code"},
//   {name : "academy"}
// ];

// foods.push("roti");
// foods.pop("roti");
// foods.unshift("roti");
// foods.shift("roti");

// console.log(foods);
// students.forEach(e => console.log(e))


// Menampilkan bilangan genap diagonal dari arah kanan ke kiri bawah
// for (let i = 0; i < 10; i++){
//   if (i% 2 !== 0){
//     console.log(i)
//   };
// }
function genap(n){
for (let i = 1; i <= 8n; i++) {
  if (i % 2 === 0) {
      console.log(" ".repeat(n - i) + i + " ".repeat(i));
  }
}
}
genap(8);

// let concat = " "
// let x = 1;
//  while(x <= 8){
//   if( x% 2 ==0)
//   {
//     concat = concat.repeat(n-i) + angka.repeat(i)
//     console.log(concat);
//     concat=" ";
//   }
//   x++
// }


//  function genapDiagonal(n)
//  {
//  let concat =" ";
//  for (let i = 1; i <= n; i++)
//  {  
//     if(i%2 ==0)
//     {
//     concat = concat.repeat(n-i) + i
//     console.log(concat);
//     concat=" ";
//   }
//  }
// }

// genapDiagonal(10);



// function genapDiagonalW(n){
//   let concat = " ";
//   let i = 1;
//   while (i <= n ){ 
//     if(i%2 ==0)
//     {
//     concat = concat.repeat(n-i) + i
//     console.log(concat);
//     concat=" ";
//     }
//     i++;
//   }  
// }
//  genapDiagonalW(10);



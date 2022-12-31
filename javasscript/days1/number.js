// // NUMBER
// const n = 150.86
// console.log(typeof n)

// // math

// Math.sqrt(9);
// Math.pow(2,3);
// Math.PI;
// Math.round(4.678);

// // round down
// Math.floor(5.678); 


// let x =10 ;
// let y = +x;
// console.log(y);

// let s = '10';
// console.log(+s);

// // let age = 25;
// // age = age + 1;
// // console.log(age);


// let weight = 90;
// weight = ++weight + 5;
// console.log(weight);


// let weight1 = 90;
// let newweight = weight1++ + 5;
// console.log(weight1);

// let result = 0;


function alternatingCharacters_(s) {
     let result = 0;
 
     if (s.length >= 1 && s.length <= 100000) {
          let arr = s.split('');
          let past = arr[0];
          
          arr = arr.filter((item, key) => {
               if (item !== past && key !== 0) {
                    past = item;
                    return item; 
               }  
          });
          result = s.length - [ s.charAt(0), arr ].length;
     }
     
     return result; 
}



function alternatingCharacters(s) {
     let result = 0;
 
     if (s.length >= 1 && s.length <= 100000) {
          let arr = s.split('');
          let past = arr[0];
          
          arr = arr.filter((item, key) => {
               if (item !== past && key !== 0) {
                    past = item;
                    return item; 
               }  
          });
          result = s.length - [ s.charAt(0), ...arr ].length;
     }
     
     return result; 
}

console.log(alternatingCharacters("BBBBB"));
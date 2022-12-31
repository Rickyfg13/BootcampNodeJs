/*
SCOPE VARIABLE
perbedaan VAR VS CONST VS LET:

Var = bisa global dan local
kapan di katakan global ?
jika global = diluar function
jika local = di dalam function

Let = local, di dalam block atau kurung kurawal {}
const = local, sama dengan let,tetapi const tidak dapat diubah 
*/

// Penggunaan VAR
var message = 'Hi';

function say(){
  var message = 'hello';
  console.log(message);
}

say();
console.log(message);


// const 
const nama = {
  namaDepan : 'yasysa',
  namaBelakang : 'El hakim'
}

nama = {
  namaDepan : 'Agung',
  namaBelakang : 'Cahyadi' 
}

console.log(nama);

// LET 

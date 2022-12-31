

// 1. MENAMPILKAN HARI
function hari (h){
    if (h==1){
        console.log('Senin');
    } 
    else if (h==2){
        console.log('Selasa');
    }
    else if (h==3){
        console.log('Rabu');
    }
    else if (h==4){
        console.log('Kamis');
    }
    else if (h==5){
        console.log('Jumat');
    }
    else if (h==6){
        console.log('Sabtu');
    }
    else if (h==7){
        console.log('Minggu');
    } else {
        console.log('Hari Tidak ditemukan');
    }
}

hari(8);

// 2. MENAMPILKAN BILANGAN GENAP


//   for (var i = 0; i <= 100; i++) {
//     if (i % 2 == 0) {
//       console.log(i,'ini adalah bilangan genap');
//     }
//   }

// 3. MENAMPILKAN BILANGAN GANJIL

//   for (var i = 0; i <= 100; i++) {
//     if (i % 2 != 0) {
//       console.log(i,'ini adalah bilangan ganjil');
//     }
//   }

//   4. MENAMPILKAN ABJAD CAPITAL
// function abjadCapital(n) {
//     for (var i = 65; i < 65 + n; i++) {
//       console.log(String.fromCharCode(i));
//     }
//   }
//   abjadCapital(6);
 
//   5 MENAMPILKAN HURUF KECIL
function abjadKecil(n) {
    for (var i = 97; i < 97 + n; i++) {
      console.log(String.fromCharCode(i));
    }
  }
  abjadKecil(6);
// 4. buat ASYNC tanpa set timeout dan tanpa pakai promise

const users = [
  {
    nama: "Erik",
    kelas: 2,
  },

  {
    nama: "Rudi",
    kelas: 4,
  },
];
const divisi = [
  {
    nama: "Production",
    jabatan: "Supervisor",
  },
];

function addUser(nama, kelas) {
  (this.nama = nama), (this.kelas = kelas);
}

function addDivisi(nama, jabatan) {
  (this.nama = nama), (this.jabatan = jabatan);
}

const objUser1 = Object.assign({}, new addUser("Jono", 1));
const objDivisi = Object.assign({}, new addDivisi("HR", "Manager"));
const objDivisi1 = Object.assign({}, new addDivisi("IT", "Employee"));

function insertIntoUser(x, y) {
  x.push(y);
  console.log(x);
}

function insertIntoDivisi(x, y,z) {
  x.push(y,z);
  console.log(x);
}

const Masuk = async () => {
    await insertIntoUser(users, objUser1);
    await insertIntoDivisi(divisi, objDivisi, objDivisi1);
}

Masuk().then((res)=> console.log(res));



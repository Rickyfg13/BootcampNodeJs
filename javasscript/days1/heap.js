let nama = 'john';
let age = 25;

let person = {
    nama :'John',
    age:25

}
// console.log(person);

let member = person;
// console.log(member);

member.age = 27;
person.nama = 'Budi';
console.log(member);
console.log(person);
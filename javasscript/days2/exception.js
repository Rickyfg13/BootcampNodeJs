// TRY CATCH ERORR

try {
    let result = add(10,20);
    console.log(result);
    
}catch (e){
    console.log({name:e.name, message:e.message});
}
console.log('bye');

// TRY CATCH FINALLY
// FINALLY AKAN TETAP DIJALANKAN MESKIPUN EROR

// try {
//     let result = add(10,20);
//     console.log(result);
    
// }catch (e){
//     console.log({name:e.name, message:e.message});
// } finally{
//     // console.log('bye');
//     console.log('result');
// }

// const add = (x,y) => x + y ;

// let result = 0;

// try {
//     result = add(10,20);
// } catch (e){
//     console.log(e.message);
// } finally{
//     console.log(result);
// }

function add(x,y ){
    if (typeof x !=='number'){
        throw new Error('The first argument must be a number ');

    }
    if (typeof y !=='number'){
        throw new Error('The second argument must be a number ');

    }

    return x + y;
}


try {
    const result = add(10,'b');
    console.log(result);
} catch (e){
    console.log(e.name,'',e.message);
} 
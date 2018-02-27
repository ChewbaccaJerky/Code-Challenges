
/*
 * wordWrap(str, limit)
 *  I/O
 * 1:
 * input: 'The truth is I am Ironman', 8
 * output: ['The', 'truth is', 'I am', 'Ironman']
 * 
 * 2:
 * input: 'The truth is I am iron man', 9
 * output: ['The', 'truth is', 'I am', 'iron man']
 */

 
function wordWrap(str, limit) {
    const array = str.split(' ');
    const result = [];

    let tempStr = "";

    array.forEach((word, idx) => {
        if(tempStr.length + (word.length + 1) > limit) {
            result.push(tempStr);
            tempStr = word;
        }
        else {
            tempStr = tempStr.length === 0 ? word : tempStr + " " + word;
        }
    });

    result.push(tempStr);
    return result;
}

let str1 = 'The truth is I am Ironman';
let result1 = ['The', 'truth is', 'I am', 'Ironman'];
let str2 = 'The truth is I am iron man';
let result2 = ['The truth', 'is I am', 'iron man'];

console.log(wordWrap( str1, 8) === result1);
console.log(wordWrap( str2, 9) == result2);


function curry(func) {
    console.log(func.length);
    return function curried(...args) {
        if (args.length >= func.length) {
            return func.apply(this, args);
        } else {
            return function (...args2) {
                return curried.apply(this, args.concat(args2));
            };
        }
    };

}

function sum(a, b, c, d) {
    return a + b + c + d;
}

// function sum(...args) {
//     let total = 0;
//     args.forEach(n => {
//         total += n;
//     });

//     return total;
// }

let curriedSum = curry(sum);

console.log(curriedSum(1)(3,4 ,5));


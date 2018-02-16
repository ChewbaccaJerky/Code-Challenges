const myBind = function(ctx, ...bindArgs){
    return (...callArgs) => {
        return this.apply(ctx, bindArgs.concat(callArgs));
    };
};


// sum(1,3,4,5)(4)(3)(2,3,4)
const currySum = function currySum(num) {
    let len = arguments.length;
    return function(x) {
        let sum = 0;
        while(len > 0) {
            sum += num[len-1];
            len -= 1;
        }
        return sum + x;
    };
};

const n = currySum(1,2,3,4)(1,2);
console.log(n);



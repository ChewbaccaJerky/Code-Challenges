const myBind = function(ctx, ...bindArgs){
    return (...callArgs) => {
        return this.apply(ctx, bindArgs.concat(callArgs));
    };
};

function allSum(values) {
    const numbers = [];
    const args = arguments;
    function _curriedSum(){
        Array.from(args).forEach((n)=>{
            numbers.push(n);
        });

        if(args.length === 0) {
            let total = 0;
            numbers.forEach(n =>{
                total += n;
            });
            return total;
        }
        else {
            return _curriedSum();
        }
    }

    return _curriedSum();
}

function curriedSum(numArgs) {
    console.log(numArgs);
    const numbers = [];
    
    function _curriedSum(num) {
        numbers.push(num);

        if (numbers.length === numArgs) {
            let total = 0;

            numbers.forEach((n) => {
                total += n;
            });

            return total;
        } else {
            return _curriedSum;
        }
    }

    return _curriedSum;
}

const n = allSum(4,5,6)(10)(2)(3)(2);
console.log(n);



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

function curriedSum() {
    const numbers = [];

    for(let i = 0; i < arguments.length; i++) {
        numbers.push(arguments[i]);
    }

    function _curried() {
        
        if(arguments.length === 0) {
            let total = 0;

            numbers.forEach((num) => {
                total += num;
            });

            return total;
        }
        else {
            for(let i = 0; i < arguments.length; i++) {
                numbers.push(arguments[i]);
            }
            return _curried;
        }
    }

    return _curried;
}

const n = curriedSum(4,5,6)(1,2)(4,5,6)();
console.log(n);



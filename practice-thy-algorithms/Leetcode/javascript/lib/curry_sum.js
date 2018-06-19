const assert = require("assert");

const currySum = function(...args) {
    const store = args;

    function _curry(...vals) {
        if(vals.length > 0) {
            for(let i = 0; i < vals.length; i++) {
                store.push(vals[i]);
            }
            return _curry;
        }
        else {
            let sum = 0;
            for(let i = 0; i < store.length; i++){
                sum += store[i];
            }

            return sum;
        }
    }

    return _curry;
};

describe('CurrySum', ()=>{
    it('should return a number', ()=>{
        assert.equal(typeof(currySum(1,2)()), 'number');
    });

    it('should return zero if no params are passed', ()=>{
        assert.equal(currySum()(), 0);
    });

    it('should handle multiple params from a single invoke', () => {
        assert.equal(currySum(1, 2, 3, 4)(), 10);
    });

    it('should handle multiple invokes should return function', ()=>{
        assert.equal(typeof(currySum(1, 4)(2,3)), 'function');
    });

    it('should return number with final invoke', () => {
        assert.equal(typeof (currySum(1, 4)(2, 3)()), 'number');
    });

    it('should return number with multiple params and invokes', () => {
        assert.equal(currySum(1, 4)(2, 3)(), 10);
    });
});

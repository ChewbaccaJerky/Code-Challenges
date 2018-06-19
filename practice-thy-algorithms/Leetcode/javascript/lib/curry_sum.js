const assert = require("assert");

const currySum = (...args)=>{
    const store = args;
    
    function _curry(...vals) {
        if(vals.length > 0) {
            for(let i = 0; i < vals.length; i++) {
                store.push(vals[i]);
            }
        }
        else {
            const sum = store.reduce((a, b) => a + b, 0);
            return sum;
        }
    }

    return _curry();
};

describe('CurrySum', ()=>{
    it('should return a number', ()=>{
        assert.equal('number', typeof(currySum(1,2)));
    });

    it('should handle multiple params from a single invoke', ()=>{
        assert.equal(currySum(1,2,3,4), 10);
    });

    it('should return zero if no params are passed', ()=>{
        assert.equal(currySum(), 0);
    });
});

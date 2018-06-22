const assert = require('assert');

const repeatChars = function(str, repeats){
    let result = '';
    const tuples = [];
    let cur_char = str[0];
    let tuple = [cur_char, 0];

    for(let i = 0; i < str.length; i++) {
        if(str[i] === cur_char) {
            tuple[1]++;
        }
        else {
            tuples.push(tuple);
            cur_char = str[i];
            tuple = [cur_char, 1];
        }
    }

    tuples.push(tuple);

    for(let i = 0; i < tuples.length; i++) {
        if(tuples[i][1] >= repeats) {
            result += tuples[i][0].repeat(repeats); 
        }
    }

    return result;
};

describe('repeatChars', ()=>{
    
    it('returns a string', ()=>{
        assert.equal(typeof(repeatChars('aabbcc', 2)), 'string');
    });

    it('should return repeats of chars', ()=>{
        assert.equal(repeatChars('aabbcc', 2), 'aabbcc');
    });

    it('should return repeats of only num repeats', ()=>{
        assert.equal(repeatChars('aabbc', 2), 'aabb');
    });

    it('should return empty string', ()=>{
        assert.equal(repeatChars('abc', 3), '');
    });
});


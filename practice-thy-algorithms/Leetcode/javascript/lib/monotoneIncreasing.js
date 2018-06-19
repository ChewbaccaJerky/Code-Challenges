

/*
Monotone Increasing Digits
Difficulty:Medium

Given a non-negative integer N, find the largest number that is less than or equal to N with monotone increasing digits.

(Recall that an integer has monotone increasing digits if and only if each pair of adjacent digits x and y satisfy x <= y.)

Example 1:
Input: N = 10
Output: 9
Example 2:
Input: N = 1234
Output: 1234
Example 3:
Input: N = 332
Output: 299
Note: N is an integer in the range [0, 10^9].
*/

/**
 * @param {number} N
 * @return {number}
 */
var monotoneIncreasingDigits = function(N) {
    
    let found = false;
    
    while(!found) {
        if(isMonotone(N)) return N;
        
        // if first value is nine decrement by 1 * 10 ** length
        const numArr = String(N).split('');
        
        if(Math.max(...numArr) == numArr[0]) {
            N = (numArr[0] * (10 ** (numArr.length - 1))) - 1;
        }
        else {
            N -= 1;
            
        }
    }
};

/**
* @param {number} num
* @return {boolean}
*/
function isMonotone(N) {
    // Step 1: change to str then split
    let numArr = String(N).split('');
    
    // Step 2: check if all values are less the following
    let prev = numArr[0];
    for(let i = 1; i < numArr.length; i++) {
        // a. if curVal is less than prevVal return false
        if(prev > numArr[i]) return false;
        prev = numArr[i];
    }   
    // Step 3: return true
    return true;
    
}

/**
 * The Hamming distance between two integers is the number of positions at which the corresponding bits are different.
 *
 * Given two integers x and y, calculate the Hamming distance.
 * 
 * Note:
 * 0 ≤ x, y < 231.
 * 
 * Example:
 * 
 * Input: x = 1, y = 4
 * 
 * Output: 2
 * 
 * Explanation:
 * 1   (0 0 0 1)
 * 4   (0 1 0 0)
 *        ↑   ↑
 * 
 * The above arrows point to positions where the corresponding bits are different.
 */

 const hammingDistance = (x, y) => {
    let xorStr = (x ^ y).toString(2);
    let count = 0;

     for(let i = 0; i < xorStr.length; i++){
         if(xorStr[i] === '1') count++;
     }

     return count;
 };
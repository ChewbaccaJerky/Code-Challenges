const assert = require("assert");
/**
* The string "PAYPALISHIRING" is written in a zigzag pattern on 
* a given number of rows like this : (you may want to display this pattern in 
* a fixed font for better legibility)
* `
* P A H N
* A P L S I I G
* Y I R
* And then read line by line : "PAHNAPLSIIGYIR"
* 
* Write the code that will take a string and make this conversion given a number of rows : string convert(string s, int numRows);
* Example 1 : Input : s = "PAYPALISHIRING",
* numRows = 3
* Output : "PAHNAPLSIIGYIR"
* Example 2 : Input : s = "PAYPALISHIRING",
* numRows = 4
* Output : "PINALSIGYAHRPI"
* Explanation : P I N
* A L S I G
* `Y A H R
* P I
* 
 */

 /**
  * @param str -> String: letters
  * @param rows -> Int: number of rows to create
  * @return String: conversion
  */

const zigZagConversion = function(str, rows) {
    if(str === "" || rows === 0) return "";
    // create matrix of zig zag letters
    const matrix = matrixZigZag(str, rows);
    // iterate through created matrix and concate to result
    const result = convertMatrixToString(matrix);
    // return result
    return result;
};

/**
 * @param {Array[][]}: matrix
 * @return {String}
 */
const convertMatrixToString = function(matrix){
    let result = "";

    for(let j = matrix[0].length - 1; j >= 0; j--) {
        for(let i = 0; i < matrix.length; i++) {
            if(matrix[i][j] !== "") result += matrix[i][j];
        }
    }
    return result;
};

/**
 * 
 * @param {String} str 
 * @param {Row} row 
 */
const matrixZigZag = function(str, row) {
    
    const result = [];
    let tempArr = [];
    
    for(let i = 0; i < str.length; i++){

        // check if idx of result is an array to be completely filled
        if(0 === (result.length % (row - 2 + 1))) {
            tempArr.unshift(str[i]);

            // when array is filled push to result
            if(tempArr.length === row) result.push(tempArr);
        }
        else {
            // get index for single locations
            const idx = result.length % (row - 2 + 1);
            tempArr = new Array(row);
            
            // set tempArr to all ''
            for(let j = 0; j < tempArr.length; j++) tempArr[j] = '';

            tempArr[idx] = str[i];
            result.push(tempArr);
            tempArr = [];
        }
    }

    if(tempArr.length !== 0) {
        while (tempArr.length !== row) {
            tempArr.unshift('');
        }

        if(result[result.length - 1] !== tempArr) result.push(tempArr);
    }

    return result;
};

describe('Zig Zag Conversion', ()=>{

    context("zigZagConversion", ()=>{
        it('should return same if str is empty', ()=>{
            const result = zigZagConversion('', 4);
            const expected = "";
            assert.equal(result, expected);
        });
    
        it('should return same if rows is zero', () => {
            const result = zigZagConversion('adfadsasdfasfasd', 0);
            const expected = "";
            assert.equal(result, expected);
        });
    });

    context('matrixZigZag', ()=>{
        it('should return a matrix', ()=>{
            const result = typeof (matrixZigZag("PAYPALISHIRING", 3));
            const expected = typeof([[]]);
            
            assert.equal(result, expected);
        });

        it('should return a matrix', () => {
            const result = typeof (matrixZigZag("PAYPALISHIRING", 4));
            const expected = typeof ([[]]);
            assert.equal(result, expected);
        });

        it('should return a matrix', () => {
            const result = typeof (matrixZigZag("PAYPALISHIRING", 5));
            const expected = typeof ([[]]);
            assert.equal(result, expected);
        });
    });
    
    context('convertMatrixToString', ()=>{
        it('should return type of string', ()=>{
            const matrix = [ [ 'P', 'Y', 'A', 'P' ],
                            [ '', 'A', '', '' ],
                            [ '', '', 'L', '' ],
                            [ 'I', 'H', 'S', 'I' ],
                            [ '', 'R', '', '' ],
                            [ '', '', 'I', '' ],
                            [ '', '', 'G', 'N' ] ];
            const result = typeof(convertMatrixToString(matrix));
            const expected = "string";

            assert.equal(result, expected);
        });

        it('should return proper string', () => {
            const matrix = [['P', 'Y', 'A', 'P'],
            ['', 'A', '', ''],
            ['', '', 'L', ''],
            ['I', 'H', 'S', 'I'],
            ['', 'R', '', ''],
            ['', '', 'I', ''],
            ['', '', 'G', 'N']];
            const result = convertMatrixToString(matrix);
            const expected = "PINALSIGYAHRPI";

            assert.equal(result, expected);
        });
    });
});
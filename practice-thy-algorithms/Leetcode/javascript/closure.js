
// curry
// function -> function

const add = (a) => {
    return b => c => d => { return a + b + c + d; };
};

const addC = (nums) => {
    console.log(addC.length);

};

const result = addC(5, 4, 5);

console.log(result);


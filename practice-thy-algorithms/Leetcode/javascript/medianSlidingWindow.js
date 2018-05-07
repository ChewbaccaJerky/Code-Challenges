/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var medianSlidingWindow = function(nums, k) {
    const result = [];
    
    for(let i = 0; i <= nums.length - k; i++){
        const tempArr = nums.slice(i, i+k);
        const median = getMedian(tempArr);
        
        result.push(median);
    }

    return result;
};

function getMedian(tempArr) {
    // odd
    if(tempArr.length % 2 === 1) {
        const idx = Math.floor(tempArr.length/2);
        const median = quickSelect(tempArr, idx);
        return median;
    }
    else {
        const idx1 = Math.floor(tempArr.length/2);
        const idx2 = idx1 - 1;

        const val1 = quickSelect(tempArr, idx1);
        const val2 = quickSelect(tempArr, idx2);
        const median = (val1 + val2) / 2;
        console.log(`val1: ${val1} val2: ${val2} median: ${median}`);
        return median;
    }
}

function partition(nums, pivotIdx) {
    const left = [];
    const right = [];
    const pivot = nums[pivotIdx];
    
    for (let i = 0; i < nums.length; i++) {
        if (i === pivotIdx) 
            continue;
        
        if (nums[i] <= pivot) {
            left.push(nums[i]);
        } else {
            right.push(nums[i]);
        }
    }

    return {left, right, pivot};
}

function quickSelect(nums, pivotIdx) {
    const {left, right, pivot} = partition(nums, pivotIdx);
    const curIdx = left.length;

    if(curIdx === pivotIdx) {
        return pivot;
    }
    else if(curIdx < pivotIdx) {
        return quickSelect(right, pivotIdx - curIdx - 1);
    }
    else {
        return quickSelect(left, pivotIdx);
    }
}

let arr = [3,4,-1,2,10,5,11,6];
const result = medianSlidingWindow(arr, 6);
console.log(result);
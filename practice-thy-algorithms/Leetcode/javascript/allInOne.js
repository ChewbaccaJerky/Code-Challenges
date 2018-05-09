/*
Implement a data structure supporting the following operations : Inc(Key) - Inserts a new key with value 1. Or increments an existing key by 1. Key is guaranteed to be a non - empty string.Dec(Key) - If Key 's value is 1, remove it from the data structure. Otherwise decrements an existin' +
    'g key by 1. If the key does not exist, this function does nothing. Key is guaran' +
        'teed to be a non-empty string.' GetMaxKey() - Returns one of the keys with maximal value.If no element exists,
return an empty string "".GetMinKey() - Returns one of the keys with minimal value.If no element exists,
return an empty string "".Challenge : Perform all these in O(1)time complexity.
*/
/**
 * Initialize your data structure here.
 */
var AllOne = function () {
    this.store = {}
};

/**
 * Inserts a new key <Key> with value 1. Or increments an existing key by 1.
 * @param {string} key
 * @return {void}
 */
AllOne.prototype.inc = function (key) {
    if (this.store[key]) {
        this.store[key] = this.store[key] + 1;
    } else {
        this.store[key] = 1;
    }
};

/**
 * Decrements an existing key by 1. If Key's value is 1, remove it from the data structure.
 * @param {string} key
 * @return {void}
 */
AllOne.prototype.dec = function (key) {
    if (this.store[key] === 1) {
        delete this.store[key];
    } else {
        this.store[key] = this.store[key] - 1;
    }
};

/**
 * Returns one of the keys with maximal value.
 * @return {string}
 */
AllOne.prototype.getMaxKey = function () {
    let result = "";
    let curMax = -1000000000000000;
    for (key in this.store) {
        if (this.store[key] > curMax) {
            curMax = this.store[key];
            result = key;
        }
    }
    return result;
};

/**
 * Returns one of the keys with Minimal value.
 * @return {string}
 */
AllOne.prototype.getMinKey = function () {
    let result = "";
    let curMin = 1000000000000000;
    for (key in this.store) {
        if (this.store[key] < curMin) {
            curMin = this.store[key];
            result = key;
        }
    }

    return result;
};

/**
 * Your AllOne object will be instantiated and called as such:
 * var obj = Object.create(AllOne).createNew()
 * obj.inc(key)
 * obj.dec(key)
 * var param_3 = obj.getMaxKey()
 * var param_4 = obj.getMinKey()
 */
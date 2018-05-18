
class Node {
    constructor(value){
        this.value = value;
        this.children = {}; 
        this.endOfWord = false;
    }

    insert(letter) {
        this.children[letter] = new Node(letter);
        return this.children[letter];
    }
}

class Trie {
    constructor() {
        this.root = new Node(null);
    }
    // add
    insert(word){
        let node = this.root;

        for(let i = 0; i < word.length; i++){
            const children = node.children;
            const char = word[i];
            if(!children[char]) node.insert(char);
            
            node = children[char];

            if(i === word.length - 1) node.endOfWord = true;
        }
    }

    search(word) {
        let node = this.root;

        for(let i = 0; i < word.length; i++) {
            const children = node.children;

            if(!children[word[i]]) return false;
            node = children[word[i]];

            if((i === word.length - 1) && !node.endOfWord) return false;
        }

        return true;
    }
}

const trie = new Trie();

trie.insert("add");
trie.insert("address");
trie.insert("hello");
console.dir(trie.search("add"));
console.dir(trie.search("hello"));
console.dir(trie.search("address"));
console.dir(trie.search("ad"));




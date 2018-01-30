require_relative '../../lib/ds/linked_list'

describe 'Node' do
    subject(:node) { Node.new(10)}

    describe "#initialize" do
        
        it 'takes a value' do
            expect(node.value).to eq(10)
        end

        it 'initialize @next' do
            expect(node.next).to eq(nil)
        end
    end
end

describe "LinkedList" do
    subject(:linked_list){ LinkedList.new}

    describe "#initialize" do

        it "head value should be nil" do
            expect(linked_list.head).to eq(nil)
        end

        it "length should be 0" do
            expect( linked_list.length).to eq(0)
        end
    end

    describe "#add" do
        
        context "Linked List is empty" do
            it "head should be a node" do
                linked_list.add(10)
                expect( linked_list.head.class).to eq(Node)
            end

            it "should have a length of one" do
                linked_list.add(10)
                expect( linked_list.length).to eq(1)
            end
        end

        context "Linked List is not empty" do
            it "head.next should not equal nil" do
                linked_list.add(10)
                expect( linked_list.head.next).to eq(nil)
            end

            it "should have a length of two" do
                linked_list.add(10)
                linked_list.add(1)
                expect( linked_list.length).to eq(2)
            end

            it "should have a length of three" do
                linked_list.add(10)
                linked_list.add(1)
                linked_list.add(2)
                expect( linked_list.length).to eq(3)
            end
        end
    end

    describe "#print" do 
        
        it "should print all nodes" do 
            linked_list.add(10)
            linked_list.add(1)
            linked_list.add(2)
            debugger
            expect( linked_list.length ).to eq(nil)
        end
    end

end
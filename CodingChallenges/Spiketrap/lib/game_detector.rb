require "byebug"

def game_detector(tags, documents)
    return documents if tags.empty? || documents.empty?
    
    dict = create_dictionary(tags)

    documents.each do |doc|
        
        # Step 1 Get matched Tags
        matched_tags = get_tags(dict, tags, doc)
        # Step 2 Check if tags in array are within document
        tag_info = {GameID: "", text: ""}
        matched_tags.each do |key|
            matched = tags[key].each do |tag|
                if doc.include?(tag) && tag_info[:text].length < tag.length
                    tag_info[:GameId] = key
                    tag_info[:text] = tag
                end
            end
        end
        
        print tag_info

        
        # matched_tags.each do |tag|
        #     puts tag.class
        # end


    end
end

# @params tags
# @result Array<symbols>
# @complexity time: O(n) space: O(n)
def create_dictionary(tags)
    result = {}

    tags.keys.each do |key|
        sym = key[0].to_sym
        if result[sym].nil?
            result[sym] = [key]
        else
            result[sym].push(key)
        end
    end

    result
end


# @params dict: Sym<char> correlates with Array<GameID>
#         tags: GameId => Array<Pharses>
#         doc:  document string
# @return Array<GameID>
def get_tags(dict, tags, doc)
    result = []
    
    doc.split(' ').each do |word|
        key = word[0].upcase.to_sym
        tag_arr = dict[key]
        # debugger
        if tag_arr
            tag_arr.each do |tag|
                result << tag if tag.to_s.include?(word)
            end
        end
    end

    result
end

def get_matching_tag(matched_tags, tags, doc)
    result = {GameID: "", text: ""}

    matched_tags.each do |key|
        tags[key].each do |tag|
            if doc.include?(tag) && tag_info[:text].length < tag.length
                tag_info[:GameId] = key
                tag_info[:text] = tag
            end
        end
    end

    result
end
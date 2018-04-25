require "byebug"

def game_detector(tags, documents)
    return documents if tags.empty? || documents.empty?

    
    documents.map do |doc|
        matched = {}
        # Step 1 Get matched values
        tags.each do |key, arr|
            regex = create_regex(arr)
            if regex && regex.match(doc)
                phrase = regex.match(doc)[0]
                matched[key] = phrase
            end
        end


        # Step 2 Get index ranges
        keys = remove_overlapping_game_ids(matched, doc)
        
        # Step 3 Mutate current document
        keys.each do |game_id|
            doc = create_tagname_doc(game_id, matched[game_id], doc)
        end
        
        doc
    end
end

=begin
    @params Hash<game_id, Array<phrase>>, String doc
    @return Array<Symbol>
=end

def remove_overlapping_game_ids(matched, doc)
    ranges = {}

    matched.each do |game_id, phrase|
        start = doc.index(phrase)
        ending = start + phrase.length - 1
        if ranges.empty?
            ranges[game_id] = [start, ending]
        else
            keys_to_delete = []
            add_to_hash = true
            ranges.each do |key, cur_range|
                # case 1 when ranges are overlapping
                if start < cur_range.first && ending > cur_range.first
                    keys_to_delete << key
                # case 2 when cur_range is inside of range, remove range
                elsif start > cur_range.first && ending < cur_range.last
                    add_to_hash = false
                end
            end
            # delete overlapping ranges
            keys_to_delete.each do |key|
                ranges.delete(key)
            end

            # add to hash
            ranges[game_id] = [start, ending] if add_to_hash
        end
    end

    ranges.keys
end

=begin
    @params Array<Symbol> tagnames
    @return regex
=end
def create_regex(arr)
    return nil if arr.empty?

    regex_str = arr.join('|')
    Regexp.new(regex_str)
end

=begin
    @params Symbol game_id, String phrase, String doc
    @return String
=end
def create_tagname_doc(game_id, phrase, doc)
    return doc if game_id == ""
    new_str = "TAG{#{game_id.to_s},#{phrase}}"
    regex = Regexp.new(phrase)

    doc.gsub(regex, new_str)
end
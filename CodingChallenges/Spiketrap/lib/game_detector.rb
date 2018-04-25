require "byebug"

=begin
    @params Hash<game_id, Array<String> tags, Array<String> documents
    @documents Array<String>
    @time complexity O(nm^2)
=end
def game_detector(tags, documents)
    return documents if tags.empty? || documents.empty?
    
    documents.map do |doc|
        matched = {}
        # Step 1 Get matched values O(tags)
        tags.each do |key, arr|
            regex = create_regex(arr)
            if regex && regex.match(doc)
                phrase = regex.match(doc)[0]
                matched[key] = phrase
            end
        end

        # Step 2 Remove overlapping game id phrase keys
        keys = remove_overlapping_game_ids(matched, doc)
        
        # Step 3 Mutate current document
        keys.each do |game_id|
            doc = create_tagname_doc(game_id, matched[game_id], doc)
        end
        
        doc
    end
end

=begin
    Remove Overlapping Game Ids:
        When ever a phrase location is overlapping another the inner phrase.
        Inner phrase is removed.
    @params Hash<game_id, Array<phrase>>, String doc
    @return Array<Symbol>
    @time complexity O(m*m)
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
    Create Regex
        Create a regex of joined strings
    @params Array<Symbol> tagnames
    @return regex
    @time complexity O(1)
=end
def create_regex(arr)
    return nil if arr.empty?

    regex_str = arr.join('|')
    Regexp.new(regex_str)
end

=begin
    Create Tag Name Doc
        Replace game_ids with Tag{GameID, original text}
    @params Symbol game_id, String phrase, String doc
    @return String
    @time complexity O(1)
=end
def create_tagname_doc(game_id, phrase, doc)
    return doc if game_id == ""
    new_str = "TAG{#{game_id.to_s},#{phrase}}"
    regex = Regexp.new(phrase)

    doc.gsub(regex, new_str)
end
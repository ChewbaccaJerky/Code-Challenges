require "game_detector"

describe "game_detector" do 
    test_tags = {
        "CallOfDutyWW2": ["Call of duty world war two", "COD WW2", "COD WWII","WW2COD"],
        "Fortnite": ["Fortnite", "Fort Nite"],
        "Destiny": ["Destiny", "original Destiny game"],
        "Destiny2": ["Destiny 2", "the last Destiny game", "Destiny II"],
        "WorldOfWarcraft": ["WoW the game", "world of warcraft"],
    }
    test_docs = ["I liked the last Destiny game, now I play Fortnite",
                "Lol, no comment about that", "I'm still playing world of warcraft since ww2"]
    
    context "Empty Params" do
    
        it "accepts empty hash of tags" do
            expect(game_detector({}, test_docs)).to eq(test_docs)
        end

        it "accepts empty array of documents" do
            expect(game_detector(test_tags, [])).to eq([])
        end

    end

    context "Params not empty" do
        
        it "accepts single item hash and array " do
            expect(game_detector(
                {"Destiny": ["Destiny", "original Destiny game"]}, 
                ["I liked the original Destiny game."]))
                .to eq(["I liked the TAG{Destiny,original Destiny game}."])
        end

        it "accepts document with multiple GameIDs in a single document" do 
            tags = {"Destiny2": ["last Destiny game", "Destiny 2"], "Fortnite": ["Fortnite", "Fort Nite"]}
            docs = ["I liked the last Destiny game, now I play Fortnite"]
            result = ["I liked the TAG{Destiny2,last Destiny game}, now I play TAG{Fortnite,Fortnite}"]
            expect(game_detector(tags, docs)).to eq(result)
        end

        it "accepts large hash of game ids with similar game ids and large array" do
            result = ["I liked TAG{Destiny2,the last Destiny game}, now I play TAG{Fortnite,Fortnite}",
                      "Lol, no comment about that",
                      "I'm still playing TAG{WorldOfWarcraft,world of warcraft} since ww2"]
            expect(game_detector(test_tags, test_docs)).to eq(result)
        end

        it "accepts large array without any matching tags" do
            docs = ["Gaming world is great", "Going to get more things to do"]
            expect(game_detector(test_tags, docs))
                .to eq(docs)
        end
    end
end 

describe "get_tags" do 

    it "return an array with similar tags that matches" do
        dict = {D: ["Destiny", "Destiny2"]}
        tags = {"Destiny": ["Destiny", "original Destiny"], "Destiny2": ["Destiny 2", "last Destiny game"]}
        doc = "I love Destiny forever!"
        expect(get_tags(dict, tags, doc)).to eq(["Destiny", "Destiny2"])
    end

    it "return a single item array" do
        expect(get_tags({"D": ["Destiny"]}, {"Destiny": ["Destiny"]}, "Destiny")).to eq(["Destiny"])
    end
end
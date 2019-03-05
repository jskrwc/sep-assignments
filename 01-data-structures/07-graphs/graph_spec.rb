include RSpec

require_relative 'graph'

RSpec.describe Graph, type: Class do

  let (:kevin_bacon) { Node.new("Kevin Bacon") }
  let (:lori_singer) {Node.new("Lori Singer") }
  let (:john_lithgow) { Node.new("John Lithgow") }
  let (:dianne_wiest) { Node.new("Dianne Wiest") }
  let (:chris_penn)   { Node.new("Chris Penn") }
  let (:sara_jessica_parker)  { Node.new("Sara Jessica Parker") }
  let (:matthew_mcconaughey) { Node.new("Matthew McConaughey") }
  let (:anne_hathaway) { Node.new("Anne Hathaway") }
  let (:jessica_chastain) { Node.new("Jessica Chastain") }
  let (:helen_hunt)  { Node.new("Helen Hunt") }
  let (:zoe_saldanas)  { Node.new("Zoe Saldanas") }
  let (:steve_buscemi)  { Node.new("Steve Buscemi") }
  let (:harvey_keitel)   { Node.new("Harvey Keitel") }
  let (:tim_roth) { Node.new("Tim Roth") }
  let (:bill_paxton) { Node.new("Bill Paxton") }
  let (:tom_hanks) { Node.new("Tom Hanks") }
  let (:jeff_bridges) { Node.new("Jeff Bridges") }
  let (:john_goodman) { Node.new("John Goodman") }
  let (:julianne_moore) { Node.new("Julianne Moore") }

  let (:graph) { Graph.new(kevin_bacon) }

  before (:each) do
    kevin_bacon.film_actor_hash["FootLoose"] = [lori_singer, john_lithgow, chris_penn, john_goodman]
    bill_paxton.film_actor_hash["Appolo 13"] = [kevin_bacon, tom_hanks]
    chris_penn.film_actor_hash["Resevoir Dogs"] = [steve_buscemi, harvey_keitel, tim_roth, tom_hanks]
    john_lithgow.film_actor_hash["Interstellar"] = [matthew_mcconaughey, anne_hathaway, lori_singer]
    steve_buscemi.film_actor_hash["The Big Lebowski"] = [jeff_bridges, john_goodman, julianne_moore]
    julianne_moore.film_actor_hash["Crazy Stupid Love"] = [tim_roth, zoe_saldanas]
  end

  describe "testing the nodes" do
    it "returns the name of the node" do
      expect(kevin_bacon.name).to eq("Kevin Bacon")
    end

    it "returns the hash info" do
      expect(kevin_bacon.film_actor_hash["FootLoose"][0].name).to eq ("Lori Singer")
    end

    it "returns the hash info" do
      expect(kevin_bacon.film_actor_hash["FootLoose"][2].name).to eq ("Chris Penn")
    end
  end

  describe "finding kevin bacon" do
    it "returns nil if no connections to Kevin Bacon" do
      expect(graph.find_kevin_bacon(helen_hunt)).to be_nil
    end

    it "returns a movie if there is a direct connection to Kevin Bacon (in same movie)" do
      expect{(graph.find_kevin_bacon(lori_singer))}.to output("[\"FootLoose\"]\n").to_stdout
    end

    it "returns a movie if there is a connection to Kevin Bacon through other actor(s) (steve_buscemi to john_goodman to kevin_bacon)" do
      expect{(graph.find_kevin_bacon(steve_buscemi))}.to output("[\"The Big Lebowski\", \"FootLoose\"]\n").to_stdout
    end
  end

end

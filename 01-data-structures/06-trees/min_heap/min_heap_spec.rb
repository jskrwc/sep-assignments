include RSpec

require_relative 'min_heap'

RSpec.describe MinHeapTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { MinHeapTree.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts new nodes with a higher ratings than parents" do
      heap.insert(root, hope)
      heap.insert(root, shawshank)
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.root.title).to eq "The Matrix"
    end

    it "properly inserts a new node with lower rating than root from the left" do
      heap.insert(root, pacific_rim)
      expect(heap.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node with lower rating than root from the right" do
      heap.insert(root, hope)
      heap.insert(root, pacific_rim)
      expect(heap.root.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node with lower rating than parent - no mulitiple sift up" do
      heap.insert(root, martian)
      heap.insert(root, hope)
      heap.insert(root, district)
      expect(heap.root.left.left.title).to eq "The Martian"
    end

    it "properly inserts a new node with lower rating than root - mulitiple sift up" do
      heap.insert(root, martian)
      heap.insert(root, hope)
      # heap.insert(root, braveheart)
      heap.insert(root, pacific_rim)
      expect(heap.root.title).to eq "Pacific Rim"
    end

    it "properly inserts new nodes both lower than parent" do
      heap.insert(root, district)
      heap.insert(root, hope)
      heap.insert(root, shawshank)
      heap.insert(root, braveheart)
      heap.insert(root, pacific_rim)
      expect(heap.root.title).to eq "Pacific Rim"
    end

#    ------------------

    it "properly inserts a new node as a right child" do
      heap.insert(root, shawshank)
      heap.insert(root, district)
      expect(root.right.title).to eq "District 9"
    end

    it "properly inserts a new node as a right-left child" do
      heap.insert(root, district)
      heap.insert(root, shawshank)
      heap.insert(root, hope)
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.root.right.left.title).to eq "Mad Max 2: The Road Warrior"
    end

    it "properly inserts a new node as a right-right child" do
      heap.insert(root, district)
      heap.insert(root, shawshank)
      heap.insert(root, hope)
      heap.insert(root, empire)
      heap.insert(root, martian)
      heap.insert(root, mad_max_2)
      expect(root.right.right.title).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end

    # it "properly finds a left node that swapped up" do
    #   heap.insert(root, pacific_rim)
    #   expect(heap.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    # end

    it "properly finds a right node" do
      heap.insert(root, district)
      heap.insert(root, martian)
      expect(heap.find(root, martian.title).title).to eq "The Martian"
    end

    # it "properly finds a right node that swapped up" do
    #   heap.insert(root, braveheart)
    #   heap.insert(root, pacific_rim)
    #   expect(heap.find(root, pacific_rim.title).title).to eq "Pacific Rim"
    # end

    it "properly finds a left-right node" do
      heap.insert(root, donnie)
      heap.insert(root, inception)
      expect(heap.find(root, inception.title).title).to eq "Inception"
    end

    it "properly finds a right node" do
      heap.insert(root, district)
      expect(heap.find(root, district.title).title).to eq "District 9"
    end

    it "properly finds a right-left node" do
      heap.insert(root, hope)
      heap.insert(root, martian)
      expect(heap.find(root, martian.title).title).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      expect(heap.find(root, mad_max_2.title).title).to eq "Mad Max 2: The Road Warrior"
    end
  end
  #
  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(root, hope)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(root, martian)
      heap.insert(root, inception)
      heap.delete(root, inception.title)
      expect(heap.find(root, inception.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      heap.insert(root, braveheart)
      heap.insert(root, inception)
      heap.insert(root, hope)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      heap.insert(root, braveheart)
      heap.insert(root, inception)
      heap.insert(root, hope)
      heap.insert(root, empire)
      heap.delete(root, empire.title)
      expect(heap.find(root, empire.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(root, district)
      heap.delete(root, district.title)
      expect(heap.find(root, district.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      heap.insert(root, hope)
      heap.insert(root, martian)
      heap.delete(root, martian.title)
      expect(heap.find(root, martian.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      heap.insert(root, hope)
      heap.insert(root, martian)
      heap.delete(root, hope.title)
      expect(heap.find(root, hope.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      heap.delete(root, mad_max_2.title)
      expect(heap.find(root, mad_max_2.title)).to be_nil
    end

    it "properly deletes a --- node" do
      heap.insert(root, district)
      heap.insert(root, shawshank)
      heap.insert(root, hope)
      # heap.insert(root, empire)
      heap.insert(root, mad_max_2)
      heap.delete(root, mad_max_2.title)
      expect(heap.find(root, mad_max_2.title)).to be_nil
    end

  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(root, hope)
       heap.insert(root, empire)
       heap.insert(root, jedi)
       heap.insert(root, martian)
       heap.insert(root, pacific_rim)
       heap.insert(root, inception)
       heap.insert(root, braveheart)
       heap.insert(root, shawshank)
       heap.insert(root, district)
       heap.insert(root, mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end

end

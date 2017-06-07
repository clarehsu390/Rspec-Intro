require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Jacky") }
  let(:brownie) {Dessert.new("brownie", 100, "Chef Jacky")}

  describe "#initialize" do
    it "sets a type" do
      expect(brownie.type).to eq("brownie")
    end

    it "sets a quantity" do
      expect(brownie.quantity).to eq(100)
    end

    it "starts ingredients as an empty array" do
      expect(brownie.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect{brownie.quantity("string")}.to raise_error
    end
  end


  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(brownie.add_ingredient("sugar")).to eq(["sugar"])
  end

  describe "#mix!" do
    it "shuffles the ingredient array"
      ingredients = ["sugar", "milk", "eggs", "chocolate"]
      ingredients.each do |ingredient|
        brownie.add_ingredient(ingredient)
      end
      brownie.mix!
      expect(brownie.ingredients).to not_eq(ingredients)
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect(brownie.eat(5)).to eq(95)
    end


    it "raises an error if the amount is greater than the quantity" do
      expect {brownie.eat(500)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jacky the Great Baker")
      expect(brownie.serve).to eq("Chef Jacky the Great Baker has made 100 brownies!")
    end

  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in"
      expect(chef).to receive(:bake).with(brownie)
      chef.make_more
    end
  end
end

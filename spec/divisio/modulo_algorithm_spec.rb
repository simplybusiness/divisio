describe Divisio::ModuloAlgorithm do
  describe "#calc" do
    it "returns a variant based on key provided" do
      expect(Divisio::ModuloAlgorithm.new("key", ["1", "2", "3"]).calc).to eq("3")
    end
  end
end

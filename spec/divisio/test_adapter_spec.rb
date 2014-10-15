require 'spec_helper'

describe Divisio::TestAdapter do
  describe "::split" do
    it "returns info that it is a test" do
      expect(described_class.split(anything, anything, anything)).to eq('I am returning a test')
    end
  end

  describe "::delete_experiment_for_identity" do
    it "returns info that it is a test" do
      expect(described_class.delete_experiment_for_identity(anything, anything)).to eq('Nothing was deleted because this is a test')
    end
  end
end

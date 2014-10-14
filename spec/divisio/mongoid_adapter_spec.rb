require 'spec_helper'

describe Divisio::MongoidAdapter do
  let(:experiment) { 'experiment' }
  let(:variants) { ['1', '2', '3'] }
  let(:identity) { 'identity' }

  describe "::split" do

    it "returns a variant for the given experiment and identity" do
      result = described_class.split(experiment, variants, identity)
      expect(result).to eq('3')
    end

    context 'new record' do

      it "saves the experiment to the database" do
        expect_any_instance_of(Divisio::MongoidAdapter::Experiment).to receive(:save)
        described_class.split(experiment, variants, identity)
      end

    end

    context 'old record' do

      before do
        Divisio::MongoidAdapter::Experiment.create(name: experiment, identifier: identity, variant: "random")
      end

      it "returns the variant from mongo if already exists" do
        expect(described_class.split(experiment, variants, identity)).to eq('random')
      end

      it "does not re-save to the database" do
        expect_any_instance_of(Divisio::MongoidAdapter::Experiment).to_not receive(:save)

        described_class.split(experiment, variants, identity)
      end

    end

    it "always assigns same variant for the same attributes" do
      assigned_variant = described_class.split(experiment, variants, identity)
      expect { described_class.delete_experiment_for_identity(identity, experiment) }.
        to change { Divisio::MongoidAdapter::Experiment.count }.from(1).to(0)

      expect(described_class.split(experiment, variants, identity)).to eq(assigned_variant)
    end

  end

  describe '::delete_experiment_for_identity' do

    context "record exists in the database" do
      before do
        Divisio::MongoidAdapter::Experiment.create(name: experiment, identifier: identity, variant: "random")
      end

      it "deletes the record" do
        expect{described_class.delete_experiment_for_identity(identity, experiment)}.
          to change { Divisio::MongoidAdapter::Experiment.count }.from(1).to(0)
      end

      it "returns true" do
        expect(described_class.delete_experiment_for_identity(identity, experiment)).to eq(true)
      end
    end

    context "record does not exist in the database" do
      it "returns false" do
        expect(described_class.delete_experiment_for_identity(identity, experiment)).to eq(false)
      end
    end
  end
end

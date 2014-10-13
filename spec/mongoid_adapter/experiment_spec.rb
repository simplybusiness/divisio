require 'spec_helper'

describe Divisio::MongoidAdapter::Experiment do
  describe "#save" do

    let(:required_fields) { {:name => "experiment", :identifier => "hash", :variant => "2"} }
    subject { Divisio::MongoidAdapter::Experiment.new }

    context "all fields are present" do
      it "gets saved to the database" do
        subject.attributes = required_fields

        expect{ subject.save }.to change{ described_class.count }.from(0).to(1)
      end
    end

    context "missing fields" do
      it "doesn't get saved if identifier is missing" do
        subject.attributes = required_fields.tap{ |h| h.delete(:identifier) }
        expect(subject.save).to be_falsey
      end

      it "doesn't get saved if name is missing" do
        subject.attributes = required_fields.tap{ |h| h.delete(:name) }
        expect(subject.save).to be_falsey
      end

      it "doesn't get saved if variant is missing" do
        subject.attributes = required_fields.tap{ |h| h.delete(:variant) }
        expect(subject.save).to be_falsey
      end
    end

    context "uniqueness" do
      before do
        subject.attributes = required_fields
        subject.save
        expect(described_class.count).to eq(1)
      end

      it "does not save second object with the same name and identifier" do
        required_fields[:variant] = "3"
        new_object = described_class.new(required_fields)
        expect{ new_object.save }.to_not change(described_class, :count)
      end
    end
  end
end

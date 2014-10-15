require 'spec_helper' do
  describe Divisio do
    describe '::default_adapter' do
      it "has a default adapter" do
        expect(Divisio.default_adapter).to eq(Divisio::TestAdapter)
      end
    end

    describe '::default_adapter=' do
      it "overwrites the default adapter" do
        Divisio.default_adapter = Divisio::MongoidAdapter
        expect(Divisio.default_adapter).to eq(Divisio::MongoidAdapter)
      end
    end

    describe '::new' do
      context 'no adapter provided to initializer' do
        it "initializes an object with a default adapter" do
          framework = Divisio.new

          expect(framework.instance_variable_get("@adapter")).to eq(Divisio.default_adapter)
        end
      end

      context 'adapter provided to initializer' do
        it "initializes an object with a supplied adapter" do
          framework = Divisio.new(adapter: Divisio::MongoidAdapter)

          expect(framework.instance_variable_get("@adapter")).to eq(Divisio::MongoidAdapter)
        end
      end
    end

    describe '#split' do
      it "calls the same method on the adapter" do
        expect(Divisio::MongoidAdapter).to receive(:split)

        Divisio.new(adapter: Divisio::MongoidAdapter).split(anything, anything, anything)
      end
    end

    describe '#delete_experiment_for_identity' do
      it "calls the same method on the adapter" do
        expect(Divisio::MongoidAdapter).to receive(:delete_experiment_for_identity)

        Divisio.new(adapter: Divisio::MongoidAdapter).delete_experiment_for_identity(anything, anything)
      end
    end
  end
end

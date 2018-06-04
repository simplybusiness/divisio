describe Divisio::ModuloAlgorithm do
  describe '#calc' do
    let(:variants) {}

    context 'when there is one variant provided' do
      let(:variants) { 1 }

      it 'returns the variant' do
        expect(Divisio::ModuloAlgorithm.new('key', variants).calc).to eq(1)
      end
    end

    context 'when there are multiple variants provided' do
      let(:variants) { %w[1 2 3] }

      { blah8: '1', blah4: '2', blah0: '3' }.each_pair do |key, expected_variant|
        it "returns the variant based on the key provided: #{key}" do
          expect(Divisio::ModuloAlgorithm.new(key, variants).calc).to eq(expected_variant)
        end
      end
    end

    context 'when there are multiple weighted variants provided' do
      let(:variants) { { a: 1, b: 2, c: 3 } }

      { blah8: :a, blah4: :b, blah0: :c }.each_pair do |key, expected_variant|
        it "returns the variant based on the key provided and weight: #{key}" do
          expect(Divisio::ModuloAlgorithm.new(key, variants).calc).to eq(expected_variant)
        end
      end
    end
  end
end

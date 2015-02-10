shared_examples_for 'a modulo adapter' do

  describe '::split' do
    let(:experiment) { 'experiment' }
    let(:variants)   { ['1', '2', '3'] }
    let(:identity)   { 'identity' }
    subject{ described_class.split(experiment, variants, identity) }

    it 'returns a variant for the given experiment and identity' do
      expect(subject).to eq('3')
    end

    it 'always assigns same variant for the same attributes' do
      expect(described_class.split(experiment, variants, identity)).to eq(subject)
    end
  end
end

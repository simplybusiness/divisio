describe Divisio::MongoidAdapter do
  let(:experiment) { 'experiment' }
  let(:variants)   { [1, 2, 3] }
  let(:identity)   { 'identity' }

  describe '::split' do
    subject { described_class.split(experiment, variants, identity) }

    it_behaves_like 'a base adapter'

    context 'new record' do
      it 'saves the experiment to the database' do
        expect_any_instance_of(Divisio::MongoidAdapter::Experiment).to receive(:save)
        subject
      end

      it 'converts the variant to string' do
        expect(subject).to be_a String
      end
    end

    context 'old record' do
      before do
        Divisio::MongoidAdapter::Experiment.create(name: experiment, identifier: identity, variant: 'random')
      end

      it 'returns the variant from mongo if already exists' do
        expect(subject).to eq('random')
      end

      it 'does not re-save to the database' do
        expect_any_instance_of(Divisio::MongoidAdapter::Experiment).to_not receive(:save)
        subject
      end
    end
  end

  describe '::delete_experiment_for_identity' do
    subject { described_class.delete_experiment_for_identity(identity, experiment) }

    context 'record exists in the database' do
      before do
        Divisio::MongoidAdapter::Experiment.create(name: experiment, identifier: identity, variant: 'random')
      end

      it 'deletes the record' do
        expect { subject }.to change { Divisio::MongoidAdapter::Experiment.count }.from(1).to(0)
      end

      it 'returns true' do
        expect(subject).to eq(true)
      end
    end

    context 'record does not exist in the database' do
      it 'returns false' do
        expect(subject).to eq(false)
      end
    end
  end
end

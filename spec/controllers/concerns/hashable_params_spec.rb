require 'spec_helper'

describe HashableParams do
  include HashableParams

  describe '#params_to_hash' do
    subject { params_to_hash(raw_params) }

    context 'passed an empty hash' do
      let(:raw_params) { {} }
      it { is_expected.to eq({}) }
    end

    context 'passed a hash' do
      let(:raw_params) { { foo: 1, bar: 2 } }
      it { is_expected.to match_array(raw_params) }
    end

    context 'passed an instance of ActionController::Parameters' do
      let(:params_hash) { { foo: "1", bar: "false" } }
      let(:raw_params) { ActionController::Parameters.new(params_hash) }

      it 'returns a hash' do
        expect(subject).to be_a(Hash)
      end

      it 'returns a hash which responds to #with_indifferent_access' do
        expect(subject).to respond_to(:with_indifferent_access)
      end

      it 'does not strip unpermitted keys' do
        expect(subject.keys).to match_array(['foo', 'bar'])
      end

    end

  end

end
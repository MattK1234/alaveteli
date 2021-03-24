require 'spec_helper'

describe Admin::ProminenceHelper, type: :helper do
  %i[normal backpage requester_only hidden].each do |prominence|
    let(prominence) { double(prominence: prominence.to_s) }
  end

  describe '#prominence_icon' do
    subject { helper.prominence_icon(prominence) }

    context 'when given a string' do
      let(:prominence) { 'normal' }
      it { is_expected.to eq(helper.prominence_icon(normal)) }
    end

    context 'normal' do
      let(:prominence) { normal }
      it { is_expected.to include(%q(title="normal")) }
      it { is_expected.to include('icon-eye-open') }
      it { is_expected.not_to include('icon-bg') }
    end

    context 'backpage' do
      let(:prominence) { backpage }
      it { is_expected.to include(%q(title="backpage")) }
      it { is_expected.to include('icon-eye-close') }
      it { is_expected.not_to include('icon-bg') }
    end

    context 'requester_only' do
      let(:prominence) { requester_only }
      it { is_expected.to include(%q(title="requester_only")) }
      it { is_expected.to include('icon-eye-close') }
      it { is_expected.not_to include('icon-bg-warning') }
    end

    context 'hidden' do
      let(:prominence) { requester_only }
      it { is_expected.to include(%q(title="requester_only")) }
      it { is_expected.to include('icon-eye-close') }
      it { is_expected.not_to include('icon-bg-warning') }
    end
  end

  describe '#highlight_prominence' do
    subject { helper.highlight_prominence(prominence) }

    context 'when given a string' do
      let(:prominence) { 'backpage' }
      it { is_expected.to eq(helper.highlight_prominence(backpage)) }
    end

    context 'normal' do
      let(:prominence) { normal }
      it { is_expected.to eq('normal') }
    end

    context 'backpage' do
      let(:prominence) { backpage }
      it { is_expected.to eq(%q(<span class="text-warning">backpage</span>)) }
    end

    context 'requester_only' do
      let(:prominence) { requester_only }

      it do
        is_expected.to eq(%q(<span class="text-warning">requester_only</span>))
      end
    end

    context 'hidden' do
      let(:prominence) { hidden }
      it { is_expected.to eq(%q(<span class="text-error">hidden</span>)) }
    end

    context 'an unhandled string' do
      let(:prominence) { 'unhandled' }
      it { is_expected.to eq('unhandled') }
    end
  end
end

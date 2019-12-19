require 'spec_helper'

describe Wazuh do
  it 'has a version number' do
    expect(Wazuh::VERSION).not_to be nil
  end

  describe '.#respond_to' do
    subject { described_class }

    it { is_expected.to be_respond_to(:agents) }
    it { is_expected.to be_respond_to(:delete_agents) }
  end

  shared_examples_for 'a agent' do
    it do
      expect(agent).to           be_a Hash
    end
  end

  describe '.#agents' do
    before do
      stub_api(:get, '/agents')
    end

    subject { agents }

    let!(:agents) do
      described_class.agents
    end

    let(:agent) { agents["items"][0] }

    it do
      is_expected.to be_a Hash
    end

    it_should_behave_like 'a agent'
  end

  describe '.#delete_agents' do
    before do
      stub_api(:delete, '/agents')
    end

    subject { total_affected_agents }

    let!(:response) do
      described_class.delete_agents
    end

    let(:total_affected_agents) { response["total_affected_agents"] }

    it do
      is_expected.to be 2 
    end
  end

end

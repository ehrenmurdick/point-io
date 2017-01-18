require 'rails_helper'

describe 'parties requests' do
  describe 'post create' do
    before do
      post parties_path(format: :json)
    end

    describe 'the response' do
      subject { response }
      it { is_expected.to be_successful }
      its(:body) { is_expected.to match_json_schema('parties/create', strict: true) }
    end
  end

  describe 'put reset' do
    let(:party) { Party.create(votes: [Vote.create]) }

    before do
      put reset_party_path(party.id, format: :json)
    end

    describe 'the response' do
      subject { response }
      it { is_expected.to be_successful }
    end

    it 'should reset the number of votes to zero' do
      expect(party.votes.count).to eq(0)
    end
  end

  describe 'get show' do
    let(:party) { Party.create(votes: [Vote.create(points: 1)]) }

    before do
      get party_path(party, format: :json)
    end

    describe 'the response' do
      subject { response }
      it { is_expected.to be_successful }
      its(:body) { is_expected.to match_json_schema('parties/show', strict: true) }
    end
  end
end

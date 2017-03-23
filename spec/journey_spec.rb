require 'journey'

describe Journey do
  let(:station) {double(:station)}
  subject(:journey) {described_class.new(station)}

  describe '#entry_station' do
    it {is_expected.to respond_to :entry_station}
    it "is expected to contain station" do
      expect(journey.entry_station).to eq station
    end
  end

  describe '#ended' do
    it "is not ended" do
      expect(journey.ended).to be false
    end
  end

  describe '#end_journey' do
    it 'ends the journey' do
      journey.end_journey
      expect(journey.ended).to be true
    end
  end
end

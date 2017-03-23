require 'journey'

describe Journey do
  let(:station) {double(:station)}
  subject {described_class.new(station)}

  describe '#entry_station' do
    it {is_expected.to respond_to :entry_station}
    it "is expected to contain station" do
      expect(subject.entry_station).to eq station
    end
  end

end

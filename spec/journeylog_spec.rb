require 'journeylog'

describe JourneyLog do
  subject(:journeylog) {described_class.new(journey)}
  let(:entry_station) {:entry_station}

  let(:journey) { double(:journey_class) }

  # describe 'Class initialization' do
  #   it 'Creates journey log class' do
  #     expect(journey_log).to
  #   end
  # end

  describe '#start' do
  	it'starts a journey' do
  	  expect(journeylog.start(entry_station)).to eq entry_station
    end
  end

  describe '#current_journey' do
  	it'returns incomplete journey or creates new journey' do
  	  expect(journeylog.current_journey).to eq nil
  	end
  end

  describe '#finish' do
    it 'adds an exit station to current journey' do
      expect(journeylog.finish).to eq nil
    end
  end

end

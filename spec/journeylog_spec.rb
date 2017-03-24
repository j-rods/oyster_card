require 'journeylog'

describe JourneyLog do
  subject(:journeylog) {described_class.new(journey)}
  let(:entry_station) {:entry_station}

  let(:journey) { double(:journey_class) }

  describe '#start' do
  	it'starts a journey' do
  	  expect(journeylog.start(entry_station)).to eq entry_station
    end
  end

  describe '#current_journey' do
  	it'returns incomplete journey' do 
      expect(journeylog.current_journey).to eq "Incomplete journey"
  	end
    
    it 'creates new journey' do
      journeylog.start(entry_station)	
  	  expect(journeylog.current_journey).to eq entry_station
  	end

  end

  describe '#finish' do
    it 'adds an exit station to current journey' do
      expect(journeylog.finish).to eq nil
    end
  end

end

require 'journeylog'

describe JourneyLog do
  subject(:journeylog) {described_class.new}
  let(:entry_station) {:entry_station}

  describe '#journey_log' do
    it {is_expected.to respond_to(:journey_log)}
  end

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

end

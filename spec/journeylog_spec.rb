require 'journeylog'

describe JourneyLog do
  subject(:journeylog) {described_class.new(journey)}
  let(:entry_station) {:entry_station}
  let(:exit_station) {:exit_station}

  let(:journey) { double(:journey_class) }

  describe '#start' do
  	it'starts a journey' do
  	  expect(journeylog.start(entry_station)).to eq entry_station
    end
  end

  # describe '#current_journey' do
  # 	it'returns incomplete journey' do
  #     expect(journeylog.current_journey).to eq "Incomplete journey"
  # 	end
  #
  #   it 'creates new journey' do
  #     journeylog.start(entry_station)
  # 	  expect(journeylog.current_journey).to eq entry_station
  # 	end
  #
  # end
  #
  # describe '#finish' do
  #   it 'adds an exit station to current journey' do
  #     journeylog.start(entry_station)
  #     journeylog.current_journey
  #     expect(journeylog.finish(exit_station)).to eq exit_station
  #   end
  # end
  # 
  # describe '#journeys' do
  #   it 'Returns journey log' do
  #     expect(journeylog.journeys).to eq journeylog.journey_log
  #   end
  # end


end

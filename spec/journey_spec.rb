require 'journey'

describe Journey do
  let(:station) {double(:station)}
  subject(:journey) {described_class.new(station)}

  describe '#entry_station' do
    context 'when starting a journey' do
      it "it's expected to set an entry station" do
        expect(journey.entry_station).to eq station
      end

      # it 'sets an entry station' do 
        

      # end

      describe '#start_journey' do
        it 'tracks a new journey' do
          journey.start_journey
          expect(journey.ended).to be false
        end
      end

    end
  end

  describe '#end_journey' do
    context 'when ending a journey' do 
      it 'ends the journey' do
        journey.end_journey(station)
        expect(journey.ended).to be true
      end

      it 'returns itself when exiting journey' do
        expect(journey.end_journey(station)).to eq(journey)
      end

      it 'returns a station exit' do
        expect(journey.exit_station=station).to eq station
      end 
    end
  end

  describe '#fare' do
    it 'has a penalty fare by default' do
      journey.start_journey
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end


    it 'is initially equal to the minimum fare' do
    allow(journey).to receive(:ended).and_return(true)
    expect(journey.fare).to eq 1
    end

    context 'given an entry station' do
      subject {described_class.new(entry_station: station)}
      it "returns a penalty fare if no exit station given" do
        journey.start_journey
        expect(journey.fare).to eq Journey::PENALTY_FARE
      end
    end

    context 'given an exit station' do
      let(:other_station) { double :other_station }

      before do
        journey.end_journey(other_station)
      end

      it 'calculates a fare' do
        expect(journey.fare).to eq 1
      end

      it 'knows if a journey is complete' do
        expect(journey).to be_complete
      end

    end

  end

  describe '#complete?' do
    it 'knows if a journey is not complete' do
      expect(journey).not_to be_complete
    end
  end

end

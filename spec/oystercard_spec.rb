require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:station) { double :station }
  let(:other_station) { double :station}
  let(:entry_station) {double :station}
  let(:exit_station) {double :station}
  let(:journey) { {entry_station: entry_station, exit_station: exit_station} }


  describe '#balance' do
    it "shows balance on the card" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    context 'when no balance' do
      it "adds money to the card" do
        expect{ oystercard.top_up(20) }.to change{ subject.balance }.by 20
      end
    end

    context 'when balance' do
      it 'raises an error when the balance surpasses 90' do
        maximum_balance = Oystercard::MAXIMUM_BALANCE
        # subject.top_up(maximum_balance)
        expect {oystercard.top_up(maximum_balance+1)}.to raise_error "Maximum balance of #{maximum_balance} reached"
      end
    end
  end

  describe '#touch_in' do
    context 'when starting a journey' do

      it 'raises an error if touch in with balance below minimum of £1' do
        expect {oystercard.touch_in(entry_station) }.to raise_error "Insufficient funds. £1 minimum needed to travel."
      end

      it 'deducts a penalty charge if card not touched out' do
        oystercard.top_up(20)
        oystercard.touch_in(station)
        expect{ oystercard.touch_in(other_station)}.to change{ oystercard.balance}.by(-6)
      end
    end
  end

  # describe '#in_journey?' do
  #   it {is_expected.to respond_to :in_journey?}
  # end

  describe 'touch_out' do
    context 'when ending journey' do

      it 'deducts correct fare amount on card touch out' do
        oystercard.top_up(20)
        oystercard.touch_in(entry_station)
        expect{oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by (-Oystercard::MINIMUM_TRAVEL_BALANCE)
      end

    end
  end

  describe '#journey_history' do
    context 'before starting any journeys' do
      it 'has an empty list of journeys by default' do
        expect(oystercard.journey_history).to be_empty
      end
    end

    context 'when starting journey' do
      it 'creates a journey history when touching in and out of stations' do
        oystercard.top_up(20)
        oystercard.touch_in(entry_station)
        oystercard.touch_out(exit_station)
        expect(oystercard.journey_history).to eq [journey]
      end
    end
  end
end

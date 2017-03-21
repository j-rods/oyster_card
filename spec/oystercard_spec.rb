require 'oystercard'

describe Oystercard do
  it { is_expected.to respond_to(:top_up).with(1).argument}
  subject(:oystercard) {described_class.new}

  describe '#balance' do
    it "shows balance on the card" do
      expect(oystercard.balance).to eq 0
    end
  end

  describe '#top_up' do
    it "adds money to the card" do
      expect{ oystercard.top_up(20) }.to change{ subject.balance }.by 20
    end

    it 'raises an error when the balance surpasses 90' do
      maximum_balance = Oystercard::MAXIMUM_BALANCE
      # subject.top_up(maximum_balance)
      expect {oystercard.top_up(maximum_balance+1)}.to raise_error "Maximum balance of #{maximum_balance} reached"
    end
  end

  describe '#deduct' do
    it 'deducts fare from balance' do
      oystercard.top_up(20)
      expect { oystercard.deduct 5}.to change{ oystercard.balance }.by -5
    end
  end

  describe '#touch_in' do
    it 'changes card journey state to in transit when touching in' do
      oystercard.touch_in
      expect(oystercard.in_journey?).to eq true
    end
  end

  describe '#in_journey?' do
    it {is_expected.to respond_to :in_journey?}
  end

  describe 'touch_out' do
    it 'changes card journey state to journey ended when touching out' do
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard.in_journey?).to eq false
    end
  end
end

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
end

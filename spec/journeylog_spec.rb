require 'journeylog'

describe JourneyLog do
  describe '#journey_log' do
    it {is_expected.to respond_to(:journey_log)}
  end
end

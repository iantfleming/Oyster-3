require 'journey'




describe Journey do

  let(:card) { double :card }
  # let(:top_up) { double :top_up }
  # let(:touch_in) { double :touch_in }
  # let(:touch_out) { double :touch_out }

  it 'can create an instance of journey' do
    expect(subject).to be_kind_of(Journey)
  end


  describe '#in_journey?' do
    it 'returns true when in journey' do
      allow(card).to receive(:top_up).with(10)
      allow(card).to receive(:touch_in).with('Balam')
      card.top_up(10)
      card.touch_in('Balam')
      expect(subject).to be_in_journey
    end

    it 'returns false when not in journey' do
      expect(subject).not_to be_in_journey
    end
  end

  it 'responds to the method in_journey?' do
    expect(subject).to respond_to(:in_journey?)
  end

  it 'starts with no stored journeys' do
    expect(subject.journeys).to eq []
  end

  it 'it remembers the start station' do
    allow(card).to receive(:top_up).with(10)
    allow(card).to receive(:touch_in).with('Balam')
    card.top_up(10)
    station_touch_in = card.touch_in('Balam')
    expect(subject.start_station).to eq station_touch_in
  end

  # it 'records journey from start to end station' do
  #   subject.top_up(Journey::STANDARD_FARE)
  #   subject.touch_in(station)
  #   subject.touch_out(station1)
  #   expect(subject.journeys).to include({:start_station => station, :exit_station => station1})
  # end
  it 'records the journey from start to end station' do
    # allow(card).to receive(:top_up).with(10)
    # allow(card).to receive(:touch_in).with('Balam')
    # allow(card).to receive(:touch_out).with('Holborn')
    # allow(card).to receive(:last_journey)
    # card.top_up(10)
    #
    # card.touch_in('Balam')
    # p subject.start_station
    # card.touch_out('Holborn')
    # subject.last_journey
    journey = Journey.new
    journey.start_station = 'Balam'
    journey.exit_station = 'Holborn'
    expect(journey.journeys).to include('Balam')
  end


  it 'delivers maximum fare if journey incomplete' do
    allow(subject).to receive(:complete_journey?).and_return(false)
    subject.fare_total
    expect(subject.journey_fare).to eq Journey::MAX_FARE
  end
end

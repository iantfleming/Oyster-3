require 'journey'

describe Journey do
  it 'can create an instance of journey' do
    expect(subject).to be_kind_of(Journey)
  end
  it 'has a maximum fare of 6' do
    expect(subject.complete?).to eq (false)
  end

  let(:card) { double :card }
  let(:top_up) { double :top_up }
  let(:touch_in) { double :touch_in }
  let(:touch_out) { double :touch_out }
  it 'delivers maximum fare if journey incomplete' do
    allow(:card).to receive_messages(:top_up => 10, :touch_in => 'Balam')
    card.top_up(10)
    card.touch_in('Holborn')
    subject.complete? == false
    expect(subject.journey:fair).to eq Journey::MAX_FARE
  end
end

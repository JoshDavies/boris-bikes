# frozen_string_literal: true

require 'docking_station'

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  describe 'initialization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'creates a station with default capacity' do
      expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it 'creates a full station with specified capacity' do
      station = DockingStation.new(80)

      80.times { station.dock(bike) }

      expect { station.dock(bike) }.to raise_error(RuntimeError, 'Docking station full')
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  #  it { is_expected.to respond_to(:bike) }
end

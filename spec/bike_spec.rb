# frozen_string_literal: true

require 'bike'
describe Bike do
  it { is_expected.to respond_to :working? }

  # in bike_spec.rb
  it 'can be reported broken' do
    subject.report_broken
    # let's use one of RSpec's predicate matchers
    expect(subject).not_to be_working
  end

  describe '#report_broken' do
    it 'user reports bike broken' do
      bike = Bike.new
      bike.report_broken
      expect(bike.working?).to eq false
    end
  end
end

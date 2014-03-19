require 'spec_helper'

describe Schedule do
  
  subject(:schedule) { build(:schedule) }

  it "can add entries" do
    expect(schedule.tasks.new).not_to raise_error
    expect(schedule.tasks.length).to eq(1)
  end

end

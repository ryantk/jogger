require 'spec_helper'

describe Journal do
  
  subject(:journal) { build(:journal) }

  specify { expect(journal).to respond_to(:title) }
  specify { expect(journal).to respond_to(:title=) }
  specify { expect(journal).to respond_to(:person) }

  it "can add an entry" do
    expect(journal.entries.new).not_to raise_error
    expect(journal.entries.length).to eq(1)
  end

end

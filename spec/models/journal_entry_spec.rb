require 'spec_helper'

describe JournalEntry do
  
  subject(:entry) { build(:journal_entry) }

  specify { expect(entry).to respond_to(:body) }
  specify { expect(entry).to respond_to(:body=) }
  specify { expect(entry).to respond_to(:journal) }
  specify { expect(entry).to respond_to(:tags) }

  it "can add body" do
    body = "a long entry"
    entry.body = body
    expect(entry.body).to eq(body)
  end

  it "can add tags" do
    entry.tags << build(:tag)
    expect(entry.tags.length).to be(1)
  end

end

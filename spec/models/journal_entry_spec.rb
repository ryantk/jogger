require 'spec_helper'

describe JournalEntry do
  
  subject(:entry) { build(:journal_entry) }

  specify { expect(entry).to respond_to(:body) }
  specify { expect(entry).to respond_to(:body=) }
  specify { expect(entry).to respond_to(:journal) }

  it_behaves_like "taggable"

  it "can add body" do
    body = "a long entry"
    entry.body = body
    expect(entry.body).to eq(body)
  end

end

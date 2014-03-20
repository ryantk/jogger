require 'spec_helper'

describe Comment do
  
  subject(:comment) { build(:comment) }

  specify { expect(comment).to respond_to(:body) }
  specify { expect(comment).to respond_to(:body=) }

  it_behaves_like "required_field", :body

end

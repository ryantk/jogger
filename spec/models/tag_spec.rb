require 'spec_helper'

describe Tag do

  subject(:tag) { build(:tag) }

  specify { expect(tag).to respond_to(:title) }
  specify { expect(tag).to respond_to(:title=) }

  it_behaves_like "required_field", :title

end

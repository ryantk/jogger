require 'spec_helper'

describe Memory do

  subject(:memory) { build(:memory) }

  it_behaves_like "memory"

end

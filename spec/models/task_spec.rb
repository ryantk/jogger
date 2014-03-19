require 'spec_helper'

describe Task do

  subject(:task) { build(:task) }

  it_behaves_like "taggable"

end

require 'spec_helper'

describe Memory do

  subject(:memory) { Memory.new(filename: "file.jpg", uploaded: true) }

  it_behaves_like "memory"

end

require 'spec_helper'

describe AudioClip do

  subject(:audio_clip) { build(:audio_clip) }

  it_behaves_like "memory"
  
end

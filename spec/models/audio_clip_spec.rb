require 'spec_helper'

describe AudioClip do

  subject(:audio_clip) { AudioClip.new(filename: "song.wav", uploaded: true) }

  it_behaves_like "memory"
  
end

FactoryGirl.define do
  factory :memory do
    filename "file.jpg"
    uploaded true
  end
end

FactoryGirl.define do
  factory :audio_clip do
    filename "file.wav"
    uploaded true
  end
end
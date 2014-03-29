class User < Person
  has_many :journals, foreign_key: :person_id
  has_many :journal_entries
  has_many :tasks
  has_many :audio_clips, foreign_key: :person_id
  has_many :video_clips, foreign_key: :person_id
  has_many :photographs, foreign_key: :person_id
end
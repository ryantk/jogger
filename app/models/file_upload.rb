class FileUpload < ActiveRecord::Base

  # Accepts ActionDispatch::Http::UploadedFile
  def self.create_from_params(upload)
    new.tap do |file|
      file.name = "#{hashing}#{File.extname(upload.original_filename)}"
      file.path = "/uploads/memories/#{file.name}"
      file.size = upload.tempfile.size

      file.save

      File.open(
        Rails.root.join('public', 'uploads', 'memories', file.name), 'wb'
      ) do |save_file| 
        save_file.write(upload.read)
      end
    end
  end

  private

    def self.hashing
      Digest::MD5.hexdigest("#{Time.now}")
    end

end

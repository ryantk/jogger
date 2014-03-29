class FileEncrypt
  attr_accessor :key

  def self.instance
    unless @instance
      @instance = FileEncrypt.new
      
      pub_file = Rails.root.join("config", "public.pem")
      pri_file = Rails.root.join("config", "private.pem")

      if File.exists?(pub_file)
        key_pem = File.read(pub_file)
        key     = OpenSSL::PKey::RSA.new(key_pem, pass_phrase)
        @instance.key = key
        @instance.public_key = key.public_key.to_pem
      else
        @instance.key = new_rsa_key
        @instance.public_key = new_rsa_key.public_key.to_pem.tap {|k| store_key(k) }
      end

      if File.exists?(pri_file)
        key_pem = File.read(pri_file)
        key     = OpenSSL::PKey::RSA.new(key_pem, pass_phrase)
        @instance.key = key
        @instance.private_key = key.to_pem
      else
        @instance.key = new_rsa_key
        @instance.private_key = new_rsa_key.to_pem.tap {|k| store_key(k) }
      end
    end
    @instance
  end

  def self.encrypt(text)
    instance.key.public_encrypt(text)
  end

  def self.decrypt(text)
    instance.key.public_decrypt(text)
  end

  private

    def self.key_path(filename)
      Rails.root.join("config", "#{filename}.pem")
    end

    def self.store_key(key, type)
      File.open(Rails.root.join("config", "#{type}.pem"), 'w') do |f| 
        cipher = OpenSSL::Cipher::Cipher.new('AES-128-CBC')
        secure = key.export(cipher, pass_phrase)
        f.write(secure)
      end
    end

    def self.new_rsa_key
      @rsakey ||= OpenSSL::PKey::RSA.new(2048)
    end

    def self.pass_phrase
      "\x85f\xF8\xE2\xA6\xCD\x06\xE5.\xF5\e\xA0\xFF\xA1\xA4\xE6\x1E\x03OoD\xEDm\x8C89U\x9B#\x86\xDB\xF0"
    end

end
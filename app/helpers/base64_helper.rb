module Base64Helper
  require 'base64'

  # Encodes file to "urlsafe_base64" string, this allows the base64 string to
  # be send unaltered via JSON
  def file_to_url_safe_base64(file)
    file_temp_path = file.tempfile.path
    Base64.urlsafe_encode64(File.open(file_temp_path, "rb").read)
  end
end

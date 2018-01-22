module LoginHelper
  require 'base64'

  def file_to_base64(file)
    file_temp_path = file.tempfile.path
    Base64.encode64(File.open(file_temp_path, "rb").read)
  end
end

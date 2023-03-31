require 'json'

class HandleData
  def initialize(file_path)
    @file_path = "data/#{file_path}.json"
  end

  def read
    data = File.read(@file_path)
    JSON.parse(data)
  end

  def write(data)
    json = JSON.generate(data)
    File.write(@file_path, json)
  end
end

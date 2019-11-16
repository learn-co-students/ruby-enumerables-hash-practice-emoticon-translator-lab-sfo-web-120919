  require 'yaml'
  require 'pry'

def load_library(link)
  hash = {}
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}
  # Parse a YAML string
  file = YAML.load_file(link)
  file.each do |key, value|
    hash["get_meaning"][value[1]] = key
    hash["get_emoticon"][value[0]] = value[1]
  end
  return hash
end

def get_japanese_emoticon(file_path,emoticon)
  #binding.pry
  translater = load_library(file_path)
  if !translater["get_emoticon"][emoticon]
    return "Sorry, that emoticon was not found"
  else
   return translater["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file_path,emoticon)
  englishenater = load_library(file_path)
  if !englishenater["get_meaning"][emoticon]
    return "Sorry, that emoticon was not found"
  else
    return englishenater["get_meaning"][emoticon]
  end
  # code goes here
end

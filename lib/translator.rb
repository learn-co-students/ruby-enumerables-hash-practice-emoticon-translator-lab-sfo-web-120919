require "yaml"

def load_library(path)
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  
  emoticon_hash["get_emoticon"] = {}
  emoticon_hash["get_meaning"] = {}
  
  emoticons.each do |word, emoticon_types|
    emoticon_hash["get_emoticon"][emoticon_types.first] = emoticon_types.last 
    emoticon_hash["get_meaning"][emoticon_types.last] = word 
  end
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  emoticon_hash = load_library(path)
  sorry_message = "Sorry, that emoticon was not found"
  
  result = emoticon_hash["get_emoticon"][emoticon]
  unless result
    result = sorry_message
  end
  result
end

def get_english_meaning(path, emoticon)
  emoticon_hash = load_library(path)
  sorry_message = "Sorry, that emoticon was not found"
  
  result = emoticon_hash["get_meaning"][emoticon]
  unless result
    result = sorry_message
  end
  result
end
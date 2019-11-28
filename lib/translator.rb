# require modules here
require 'yaml'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  # p emoticons 
  emoticon_hash = { "get_meaning" => {}, "get_emoticon" => {} }
  
  # _____logic is still a bit fuzzy for the code below_____
  
  emoticons.each do |meaning, emoticons| 
    emoticon_hash["get_meaning"][emoticons[1]] = meaning
    emoticon_hash["get_emoticon"][emoticons[0]] = emoticons[1]
  end 
  emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_emoticon"].include?(emoticon)
    emoticon_hash["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  if emoticon_hash["get_meaning"].include?(emoticon)
    emoticon_hash["get_meaning"][emoticon] 
  else 
    "Sorry, that emoticon was not found"
  end
end
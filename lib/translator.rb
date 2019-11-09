# require modules here
require 'yaml'
require_relative 'translator'

# get_meaning => {jap_str => english_str}, get_emoticon => {english_str => jap_str }

def transform_hash(hash)
  
  return hash.reduce({ "get_meaning" => {}, "get_emoticon" => {} }) do |translation_hash, (wordKey, (english_emoji, japanese_emoji))|
    
      
        translation_hash["get_emoticon"][english_emoji] = japanese_emoji
        translation_hash["get_meaning"][english_emoji] = wordKey
        translation_hash["get_meaning"][japanese_emoji] = wordKey
        
       
  
  
     translation_hash
  end
  
  
end 

def load_library(library)
  
  loaded_file = YAML.load_file(library)
  result = transform_hash(loaded_file)
  return result
  
end

def get_japanese_emoticon(file, english_emoticon)
  
  translation_hash = load_library(file)
  if !translation_hash["get_emoticon"][english_emoticon]
    return "Sorry, that emoticon was not found"
  else 
    return translation_hash["get_emoticon"][english_emoticon]
  end 
end

def get_english_meaning(file, japanese_emoticon)
  
  translation_hash = load_library(file)
  if !translation_hash["get_meaning"][japanese_emoticon]
    return "Sorry, that emoticon was not found"
  else 
    return translation_hash["get_meaning"][japanese_emoticon] 
  end 
  
end
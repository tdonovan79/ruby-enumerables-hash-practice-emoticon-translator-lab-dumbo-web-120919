# require modules here
require "yaml"
require "pp"

#load yaml file into hash
def load_library(file_name)
  #set up emoticons hash
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  #load library into variable
  library = YAML.load_file(file_name)
  #seperate keys and values into get meaning and get emoticon
  library.each do |key, value|
    #get hash with western emote pointing to japanese emote
    emoticons["get_emoticon"][library[key][0]] = library[key][1]
    #get hash with emotes pointing to meanings
    value.each do |emote|
      emoticons["get_meaning"][emote] = key
    end
  end
  pp emoticons
  return emoticons
end
load_library('lib/emoticons.yml')

#accept western emote and return japanese emote
def get_japanese_emoticon(file_name, emote)
  emoticons = load_library(file_name)
  if emoticons["get_emoticon"][emote]
    return emoticons["get_emoticon"][emote]
  else
    return "Sorry, that emoticon was not found"
  end
end

#accept emote and give meaning
def get_english_meaning(file_name, emote)
  emoticons = load_library(file_name)
  if emoticons["get_emoticon"][emote]
    return emoticons["get_emoticon"][emote]
  else
    return "Sorry, that emoticon was not found"
  end
end
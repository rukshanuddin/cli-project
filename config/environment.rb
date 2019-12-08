#Required gems
require 'bundler'
require 'nokogiri'
require 'open-uri'
require 'pry'
require 'colorize'

Bundler.require
#Required files
require_relative '../lib/pokedex.rb'
require_relative '../lib/pokemon.rb'
require_relative '../lib/scraper.rb'
require_relative '../lib/run.rb'
require_relative '../lib/print_pokemon.rb'
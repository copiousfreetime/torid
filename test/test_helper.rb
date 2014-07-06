require 'simplecov' rescue nil
SimpleCov.start if ENV['COVERAGE']
gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

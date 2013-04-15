class Article < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :title, :url
end

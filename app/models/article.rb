class Article < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :title, :url

  def links=(links)
    self.url = links[:external].href if links.include? 'external'
  end
end

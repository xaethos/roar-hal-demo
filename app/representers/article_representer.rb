module ArticleRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia

  property :title
  property :latitude
  property :longitude

  link :self do
    article_path self
  end

  link :external do
    self.url
  end
end

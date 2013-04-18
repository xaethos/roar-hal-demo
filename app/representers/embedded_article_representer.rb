module EmbeddedArticleRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia

  property :latitude
  property :longitude

  link :self do
    { href: article_path(self), title: title }
  end
end

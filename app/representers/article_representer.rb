module ArticleRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia

  property :title
  property :latitude
  property :longitude

  link :self do
    { href: article_path(self), title: title }
  end

  link :external do
    { href: self.url, title: 'Wikipedia' }
  end
end

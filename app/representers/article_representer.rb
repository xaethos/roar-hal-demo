module ArticleRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia
  include EmbeddedArticleRepresenter

  property :title

  link :self do
    { href: article_path(self) }
  end

  link :external do
    { href: self.url, title: 'Wikipedia' }
  end
end

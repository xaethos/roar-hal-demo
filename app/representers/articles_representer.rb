module ArticlesRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia

  collection :article, extend: EmbeddedArticleRepresenter, embedded: true

  def article
    collect
  end

  link :self do
    articles_path
  end

  link :search do
    { href: "#{search_articles_path}{?title}", title: "Search" }
  end
end


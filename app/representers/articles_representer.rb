module ArticlesRepresenter
  include Roar::Representer::JSON::HAL
  include Roar::Representer::Feature::Hypermedia

  collection :article, extend: ArticleRepresenter, embedded: true

  def article
    collect
  end

  link :self do
    articles_path
  end
end


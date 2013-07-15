class ArticlesRepresenter < Roar::Decorator
  include Roar::Representer::JSON::HAL

  itemDecorator = Class.new(Roar::Decorator) do
    include Roar::Representer::JSON::HAL
    property :latitude
    property :longitude
    link :self do
      { href: article_path(represented), title: represented.title }
    end
  end

  collection :all,
    as: :article,
    class: Article,
    decorator: itemDecorator,
    embedded: true

  link :self do
    articles_path
  end

  link rel: :search, title: 'Search' do
    "#{search_articles_path}{?title}"
  end
end


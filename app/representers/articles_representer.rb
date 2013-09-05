class ArticlesRepresenter < Roar::Decorator
  include Roar::Representer::JSON::HAL

  collection :all,
    as: :article,
    class: Article,
    embedded: true do
      property :latitude
      property :longitude
      link :self do
        { href: article_path(represented), title: represented.title }
      end
    end

  link :self do
    articles_path
  end

  link(:profile) { '/profile/article-list' }

  link rel: :search, title: 'Search' do
    "#{search_articles_path}{?title}"
  end
end


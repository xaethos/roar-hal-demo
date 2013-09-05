class ArticleRepresenter < Roar::Decorator
  include Roar::Representer::JSON::HAL
  include Roar::Decorator::HypermediaConsumer

  property :title
  property :latitude
  property :longitude

  link(:self) { article_path(represented) }

  link(:profile) { '/profile/article' }

  link rel: :external, title: 'Wikipedia' do
    represented.url
  end
end

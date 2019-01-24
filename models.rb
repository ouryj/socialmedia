require 'sinatra/activerecord'
require 'pg'

set :database, 'postgresql:socialmedia'

configure :development do
    set :database, 'postgresql:socialmedia'
  end
  
  # on heroku
  configure :production do
    set :database, ENV['DATABASE_URL']
  end


class User < ActiveRecord::Base
    has_many :posts, dependent: :destroy
end

class Post < ActiveRecord::Base
    belongs_to :user 
end

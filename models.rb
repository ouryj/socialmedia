require 'sinatra/activerecord'
require 'pg'

set :database, 'postgresql:socialmedia'


class User < ActiveRecord::Base
    has_many :posts, dependent: :destroy
end

class Post < ActiveRecord::Base
    belongs_to :user 
end

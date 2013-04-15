class User
  include Mongoid::Document
    field :name, :type => String
    field :email, :type => String

    has_many :authorizations
    validates :name, :email, :presence => true

end


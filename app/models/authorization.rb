class Authorization
  include Mongoid::Document
  field :provider, :type => String
  field :uid, :type => String
  field :user_id, :type => Integer

  belongs_to :user
  validates :provider, :uid, :presence => true

  def self.find_or_create(auth_hash)

        @auth_provider = find_by_provider_and_uid(auth_hash)

        puts 'auth provider ofund' unless @auth_provider

        unless @auth_provider
            # raise auth_hash.to_yaml
            user = User.create :name => auth_hash["info"]["name"], :email => auth_hash["info"]["email"]

            @auth_provider = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
        end
  end

  def self.find_by_provider_and_uid(auth_hash)
        if Authorization.where(:provider => auth_hash['provider'],  :uid => auth_hash['uid']).exists?
            @auth_provider = Authorization.where(:provider => auth_hash['provider'],  :uid => auth_hash['uid'])
        end
  end


end

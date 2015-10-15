class User
  attr_accessor :name, :screen_name, :service, :user_id

  def initialize(args)
    @name        = args[:name]
    @screen_name = args[:screen_name]
    @service     = args[:service]
    @user_id     = args[:user_id]
  end
end
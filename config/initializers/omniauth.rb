Rails.application.config.middleware.use OmniAuth::Builder do
  use OmniAuth::Strategies::Twitter, ConsumerConfig['consumer']['token'], ConsumerConfig['consumer']['secret']
end

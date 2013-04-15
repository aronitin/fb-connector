Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '575029202516841', 'be8ccf49dc7b825f943a6c7f32f5e3f1', :display => 'popup'
end

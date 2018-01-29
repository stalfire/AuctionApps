Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_KEY'], ENV['FACEBOOK_APP_SECRET'],
  scope: 'public_profile, email, user_about_me, user_birthday',
  secure_image_url: true,
  image_size: :large,
  info_fields: 'name,first_name,last_name,email,birthday,gender'
end
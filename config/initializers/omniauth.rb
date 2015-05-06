Rails.application.config.middleware.use OmniAuth::Builder do

  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: ['email', 'https://www.googleapis.com/auth/gmail.modify'],
    access_type: 'offline'
  }
  # provider :twitter, ENV['TWITTER_APP_ID'], ENV['TWITTER_APP_SECRET']
  # provider :linkedin, ENV['LINKEDIN_APP_ID'], ENV['LINKEDIN_APP_SECRET']

end
Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET'],
    callback_path: '/auth/google_oauth2/callback'
end
OmniAuth.config.allowed_request_methods = %i[get]
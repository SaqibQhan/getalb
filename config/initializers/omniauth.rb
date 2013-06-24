OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '453868088043151', '9214893f7baf2562b0c38c1d43253760', :scope => 'manage_pages, email, user_photos, user_status, publish_stream'
end


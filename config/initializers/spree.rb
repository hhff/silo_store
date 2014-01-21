# Configure Spree Preferences
#
# Note: Initializing preferences available within the Admin will overwrite any changes that were made through the user interface when you restart.
#       If you would like users to be able to update a setting with the Admin it should NOT be set here.
#
# In order to initialize a setting do:
# config.setting_name = 'new value'
Spree.config do |config|
  # Example:
  # Uncomment to override the default site name.
  # config.site_name = "Spree Demo Site"
  config.auto_capture = true
  config.site_name = "Silo Arts & Records"
  config.site_url = "dev.siloarts.net:3000"
  config.always_include_confirm_step = true

  config.override_actionmailer_config = true
  config.enable_mail_delivery = true
  config.mails_from = "thankyou@siloarts.net"
  config.mail_domain = 'siloarts.net'
  config.mail_host = 'smtp.gmail.com'
  config.mail_port = 587
  config.secure_connection_type = 'TLS'
  config.mail_auth_type = 'plain'
  config.smtp_username = ENV['SMTP_USERNAME']
  config.smtp_password = ENV['SMTP_PASSWORD']

end

Spree.user_class = "User"

          Rails.application.config.to_prepare do
            require_dependency 'spree/authentication_helpers'
          end

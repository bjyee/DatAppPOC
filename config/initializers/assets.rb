# Javascript

# Jquery
Rails.application.config.assets.precompile += %w( jquery-1.11.1.min.js )
# bootstrap
Rails.application.config.assets.precompile += %w( bootstrap.min.js )

Rails.application.config.assets.precompile += %w( landing_index.js )
Rails.application.config.assets.precompile += %w( group_index.js )
Rails.application.config.assets.precompile += %w( forget_password.js )

# Stylesheets
# bootstrap
Rails.application.config.assets.precompile += %w( bootstrap.min.css )

Rails.application.config.assets.precompile += %w( landing_index.css )
Rails.application.config.assets.precompile += %w( group_index.css )
Rails.application.config.assets.precompile += %w( forget_password.css )

# Maps
Rails.application.config.assets.precompile += %w( bootstrap-theme.css.map )
Rails.application.config.assets.precompile += %w( bootstrap.css.map )

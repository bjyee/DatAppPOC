# Javascript

# Jquery
Rails.application.config.assets.precompile += %w( jquery-1.11.1.min.js )
# bootstrap
Rails.application.config.assets.precompile += %w( bootstrap.js )

Rails.application.config.assets.precompile += %w( landing_index.js )
Rails.application.config.assets.precompile += %w( group_index.js )
Rails.application.config.assets.precompile += %w( group_new.js )
Rails.application.config.assets.precompile += %w( group_show.js )
Rails.application.config.assets.precompile += %w( forget_password.js )

# Stylesheets
# bootstrap
Rails.application.config.assets.precompile += %w( bootstrap.css )

Rails.application.config.assets.precompile += %w( landing_index.css )
Rails.application.config.assets.precompile += %w( group_index.css )
Rails.application.config.assets.precompile += %w( group_new.css )
Rails.application.config.assets.precompile += %w( group_show.css )
Rails.application.config.assets.precompile += %w( forget_password.css )

# Maps
Rails.application.config.assets.precompile += %w( bootstrap-theme.css.map )
Rails.application.config.assets.precompile += %w( bootstrap.css.map )

# Fonts
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.eot )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.svg )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.ttf )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.2off )
Rails.application.config.assets.precompile += %w( glyphicons-halflings-regular.woff2 )

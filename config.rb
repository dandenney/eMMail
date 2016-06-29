###
# Compass
###

# Change Compass configuration
compass_config do |config|
  config.sass_options = {:debug_info => false}
  config.sass_options = {:line_comments => false}
end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Use pretty URls
#

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :relative_links, true

helpers do

  # Grabs a set of resources from Middleman's Sitemap
  #
  # == Parameters
  #
  # * +type+ - The Frontmatter type of resource to get (defaults to 'page')
  #
  # == Usage
  #
  #   - get_resources.each do |page|
  #     # ...
  #
  def get_resources(type = 'page')
    sitemap.resources.select { |resource| resource.data.type == type }
  end

  # Creates html_attrs for tables
  def tbl_reset
    { border: "0", cellpadding: "0", cellspacing: "0" }
  end

end

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  # activate :minify_css

  # Minify Javascript on build
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  activate :gibberish do |gibberish|
    gibberish.password = '4xZhhaji4?twh)'
    gibberish.encrypt '*'
  end
end

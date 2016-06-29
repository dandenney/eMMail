# *************************************
#
#   Rakefile
#
# *************************************

# -------------------------------------
#   Requires
# -------------------------------------

require './lib/latest_blog_posts'

# -------------------------------------
#   Namespace
# -------------------------------------

namespace :emails do

  # ----- Latest Blog Posts ----- #

  desc "Gets the current month's blog posts"
  task :latest_blog_posts do
    get_latest_blog_posts
  end

end

# -------------------------------------
#   Deploy
# -------------------------------------

# ----- Variables ----- #

REPO_URL = 'git@github.com:codeschool/emails.git'

# ----- Generate ----- #

desc 'Generate flat files with Middleman'
task :generate do
  puts '-- Generating site with Middleman --'
  system './bin/middleman build --clean'
  cd 'build' do
    system 'git init'
    system "git remote add origin #{ REPO_URL }"
  end
end

# ----- Push ----- #

desc 'Push the build to the gh-pages branch on GitHub'
task :push do
  puts '-- Deploying build to GitHub Pages --'
  cd 'build' do
    system 'git add .'
    system 'git add -u'
    system "git commit -m 'Site updated at #{Time.now.utc}'"
    system 'git push origin master:gh-pages --force'
  end
end

# ----- Deploy ----- #

desc 'Generate flat files and deploy to GitHub Pages'
task :deploy => [:generate, :push] do
end

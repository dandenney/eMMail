# *************************************
#
#   Latest Blog Posts
#   -> Gets the current month's blog posts
#
# *************************************

# -------------------------------------
#   Requires
# -------------------------------------

require 'rss'
require 'open-uri'

# Parses the date and returns the month
#
# == Parameters
#
# @param date [String] the date string
#
# == Usage
#
#   parse_date( item.pubDate )
#
def parse_date( date )
  Date.parse( date.to_s ).strftime( '%B' )
end

# Returns if it's the current month or not
#
# == Parameters
#
# @param month [String] the current month
#
# == Usage
#
#   if is_current_month?( month )
#     # ...
#
def is_current_month?( month )
  current_month = Date::MONTHNAMES[ Time.now.month ]
  current_month == month
end

# Gets the latest blog posts from an RSS feed
#
# == Usage
#
#   get_latest_blog_posts
#
def get_latest_blog_posts
  url = 'https://www.codeschool.com/blog/feed.xml'
  open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    feed.items.each do |item|
      if is_current_month?( parse_date( item.published) )
        puts "#{ item.title }: #{ item.link }"
        puts "by #{ item.author }"
        puts
      end
    end
  end
end

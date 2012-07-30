module Jekyll
  module MyFilters
    def summarize(str, splitstr = /<!--more-->/)
      str.split(splitstr)[0]
    end
  end
end

Liquid::Template.register_filter(Jekyll::MyFilters)

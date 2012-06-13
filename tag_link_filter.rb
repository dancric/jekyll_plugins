module Jekyll
  module TagLinkFilter
    def tag_links(input)
        input.collect! {|tag| '<a href="/blog/tags/index.html#' + tag + '">' + tag +'</a>' }
    end
  end
end

Liquid::Template.register_filter(Jekyll::TagLinkFilter)
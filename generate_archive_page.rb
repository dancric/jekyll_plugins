module Jekyll

  class ArchiveIndex < Page
    def initialize(site, base, dir)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'archive_index.html')
      
      self.data['title'] = "Blog Posts by Post Date"
      
      content = ''
      
      year = -1
      month = -1
      
      for post in site.posts.reverse
          if post.date.year == year
              if post.date.month == month
                  content << '<li><a href="' << post.url << '">' <<post.data["title"] << '</a></li>'
              else
                  month = post.date.month
                  content << '<h3>' << Date::MONTHNAMES[month] << '</h3>'
                  content << '<li><a href="' << post.url << '">' <<post.data["title"] << '</a></li>'
              end
          else
              year = post.date.year
              month = post.date.month
              
              content << '<h2>' << year.to_s() << '</h2>'
              content << '<h3>' << Date::MONTHNAMES[month] << '</h3>'
              
              content << '<li><a href="' << post.url << '">' <<post.data["title"] << '</a></li>'
          end
      end    
      
      self.data['archive_content'] = content
    end
end

  class ArchiveGenerator < Generator
    safe true
    priority :high
    
    def generate(site)
      if site.layouts.key? 'archive_index'
        dir = '/blog/archive'
        write_archive_index(site, File.join(dir))
      end
    end
  
    def write_archive_index(site, dir)
      index = ArchiveIndex.new(site, site.source, dir)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end

end
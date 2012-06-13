module Jekyll

  class TagIndex < Page
    def initialize(site, base, dir, tags)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'tag_index.html')
      
      self.data['stags'] = tags
      self.data['title'] = "Blog Posts by Tag"
    end
  end

  class TagGenerator < Generator
    safe true
    priority :high
    
    def generate(site)
      if site.layouts.key? 'tag_index'
        dir = 'blog/tags'
        write_tag_index(site, File.join(dir), site.tags.keys.sort)
      end
    end
  
    def write_tag_index(site, dir, tags)
      index = TagIndex.new(site, site.source, dir, tags)
      index.render(site.layouts, site.site_payload)
      index.write(site.dest)
      site.pages << index
    end
  end

end
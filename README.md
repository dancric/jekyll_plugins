Jekyll Plugins for Single-Page Archive and Tag Pages
==============

These plugins are meant to be used with Jekyll to generate single-page archive and tag pages (an exmaple can be seen [on
  my personal site](http://dannycrichton.com/blog/tags/)).
  
Files
--------

There are three plugins included:
* generate_archive_page.rb: This creates the single-page archive page and uses the archive_index.html layout as a template.
* generate_tag_page.rb: This creates the single-page tag page and uses the tag_index.html layout as a template.  
  Tags are sorted and provided to the page as the "stags" (sorted-tags) variable.
* tag_link_filter.rb: This plugin provides a filter by which a list of tags can be transformed into links to the tag page.  I use this underneath a post to list the relevant tags with links to the tag index page.

Usage
--------

Install the files in the _plugins directory of your Jekyll installation.  Make the directory if it does not already exist.

License
----------

Completely free to use in any way you see fit.
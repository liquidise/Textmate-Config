#!/usr/bin/env ruby -wKU
# encoding: utf-8

# Lookup terms in the flex compiler config doc.
#
class FlexConfigDoc
  def initialize()
    require "rexml/document"
    p = "#{File.dirname(__FILE__)}/../../data/flex-config.xml"
    d = File.new( p )
    @doc = REXML::Document.new d
  end
  
  def find(scope)
    scope = scope.split(" ").pop().sub('meta.tag.xml.flex-config.','').gsub('.','\.')
    rgx = / #{scope}: /
    REXML::XPath.match(@doc, '//comment()').each { |e|
      c = e.to_s      
      return c.sub(rgx,'') if c =~ rgx      
    }
    return 'No documentation found.'
  end
end

if __FILE__ == $0
  
  fcd = FlexConfigDoc.new
  puts fcd.find('meta.tag.xml.flex-config.compiler.warn-number-from-string-changes')
  puts fcd.find('meta.tag.xml.flex-config.compiler.defaults-css-files')
  puts fcd.find('meta.tag.xml.flex-config.compiler.external-library-path')
  puts fcd.find('meta.tag.xml.flex-config.frames.frame')
  
end

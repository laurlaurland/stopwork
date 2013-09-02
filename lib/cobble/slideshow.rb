require "mustache"
require_relative "cobble"

module Cobble
  # Template for whole slideshow
  class Slideshow < Mustache
    self.template_file = File.expand_path(File.dirname(__FILE__) + "/slideshow.mustache")

    attr_accessor :title

    def initialize file
      @title = File.basename(file, '.*').to_title + " - Cobble"
      @slides = Compiler.compile open(file).read
    end

    def body
      @slides.map { |s| Cobble::Types.render(s) }.join "\n"
    end
  end
end
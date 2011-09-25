require 'faker'

module Qwerty
  class Lipsum
    attr_accessor :nodes, :total, :destructive, :parent_document

    def initialize(nodes = Node.root.children, options = {})
      @nodes = nodes
      @total = options[:total] || 10
      @destructive = options[:destructive] || true
      @parent_document = options[:parent_document]
      @options = options
    end

    # Create Lipsum documents
    def run!
      nodes.each do | node |            
        destructive? ? node.documents.destroy_all : next unless node.documents.empty?
        (node.depth == 1? 1 : total).times do
          doc = node.documents.new
          doc.title = node.depth == 1 ? node.name.capitalize : Faker::Lorem.words(rand(5)+1).join(' ').capitalize
          doc.body = Faker::Lorem.paragraphs(rand(20)+1).collect { |p| "<p>#{p}</p>"}.join("\n")
          doc.published = true
          doc.parent = parent_document
          doc.save
          self.class.new(node.children, @options.merge({:parent_document => doc})).run!
        end
      end
    end

    def destructive?
      @destructive
    end
  end
end

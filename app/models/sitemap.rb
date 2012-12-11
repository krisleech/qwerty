class Sitemap
  def self.build(&block)
    if block_given?
      yield(root)
      root.save!
    end

    # root.children.each do | node |
    #  document = node.documents.new
    #  document.title = node.name.capitalize
    #  document.save!
    # end
    root
  end

  def self.destroy!
    Node.root.try(:destroy)
  end

  def self.cleanup
    # remove nodes which do not exist
  end

  def self.root
    Node.root || Node.create(:name => 'root')
  end

  def self.to_hash
    root.to_hash
  end

  def self.load_from_disk!
    destroy!
    load "#{Rails.root}/config/sitemap.rb"
  end
end

class Sitemap
  def self.build(&block)
    if block_given?
      yield(root)
      root.save!
    end
    root
  end

  def self.root
    Node.root || Node.create(:name => 'root')
  end

  def self.to_hash
    root.to_hash
  end

  def self.load_from_disk!
    Node.root.try(:destroy)
    load "#{Rails.root}/config/sitemap.rb"
  end
end

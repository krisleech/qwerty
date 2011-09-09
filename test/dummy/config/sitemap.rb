Sitemap.build do | root |
  root.add(:blog) do | blog |
    blog.add(:page) do | page |
      page.set(:per_page => 10)
    end
  end
end

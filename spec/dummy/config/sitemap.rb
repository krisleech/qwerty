Sitemap.build do | root |
  root.undeleteable!

  root.add(:home) do | home |
    home.undeleteable!

    home.add(:banner) do | banner |
      banner.set(:sort => 'position asc')
      banner.set(:pagination => :off)
      banner.fields(:only => %w(title url image))
      banner.fieldsets(:except => %w(meta advanced))
    end

    home.add(:link) do | link |
      link.set(:sort => 'position asc')
      link.fields(:only => %w(title url image))
      link.fieldsets(:except => %w(meta advanced))
      link.pagination_off!
    end
  end

  root.add(:about) do | about |
    about.undeleteable!

    about.add(:page) do | page |
      page.set(:per_page => 10)
      page.set(:sort => 'title asc')
    end
  end

  root.add(:blog) do | blog |
    blog.undeleteable!

    blog.add(:post) do | post |
      post.set(:per_page => 10)
      post.set(:sort => 'published_at desc')
    end
  end

  root.add(:gallery) do | gallery |
    gallery.undeleteable!

    gallery.add(:gallery) do | gallery |
      gallery.add(:picture) do | picture |
        picture.set(:sort => 'published_at desc')
        picture.pagination_off!
      end
    end
  end

end

Sitemap.build do | root |
  root.undeleteable!

  root.add(:home) do | home |
    home.undeleteable!
  end

  root.add(:project) do | project |
    project.undeleteable!

    project.add(:page) do | page |
      page.set(:per_page => 10)
      page.set(:sort => 'updated_at desc')
      
      page.add(:image) do | image |
        image.set(:per_page => 10)
        image.set(:sort => 'position asc')
      end
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
      post.set(:sort => 'published_at asc')
    end
  end
end

desc "Destructively rebuild the site"
task :bootstrap => [:load_sitemap, :load_lipsum]

desc 'Load sitemap from config/sitemap.rb'
task :load_sitemap => [:environment] do
  Sitemap.load_from_disk!
end

desc 'Load some Lispsum content for all nodes in Sitemap'
task :load_lipsum => [:environment] do
  Qwerty::Lipsum.new.run!
end

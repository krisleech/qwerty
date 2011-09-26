desc "Descructivly rebuild the site"
task :bootstrap => [:environment] do
  Sitemap.load_from_disk!
  Qwerty::Lipsum.new.run!
end

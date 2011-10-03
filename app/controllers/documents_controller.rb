class DocumentsController < QwertyBaseController

  class NoTemplateFound < StandardError; end

  def index
    @documents = Document.public
  end

  def show
    path = request.path == '/' ? '/home' : request.path
    @document = Document.public.find_by_permalink!(path)
    prepare_view_environment
    render locate_template(@document) 
  end

  private
  
  def prepare_view_environment
    # e.g @blog
    instance_variable_set("@#{@document.node_name}", @document)
    # e.g @posts
    if @document.can_have_children?
      @document.node.children.each do | node |
        instance_variable_set("@#{node.name.pluralize}", node.documents.public)
      end
    end
  end

  # TODO: move this in a class in lib, path_prefix should be setable in
  # Qwerty.options
  # Use Pathname class:
  # http://ruby-doc.org/stdlib/libdoc/pathname/rdoc/index.html
  # Or ViewResolver
  # http://jkfill.com/2011/03/11/implementing-a-rails-3-view-resolver/
  
  def locate_template(document)
    view_prefix = 'cms'

    return File.join(view_prefix, document.template) unless document.template.blank?
    return File.join(view_prefix, document.node.get(:template)) unless document.node.get(:template).blank?

    paths = [document.title.parameterize('_'), 
      document.permalink.gsub('/', '.')[1..-1], 
      document.permalink, 
      document.node.ancestry.gsub('/root', ''),
      document.node.ancestry.gsub('/root', '').gsub('/', '.')[1..-1], 
      'default', 
      'show']
      paths.uniq.each do | path |
      view_paths.each do | view_path |
        rel_path = File.join(view_prefix, path) + '.html.erb'
        full_path = File.join(view_path, rel_path)
        if File.exists? full_path
          logger.debug "Found: #{full_path}"
          return rel_path
        else
          logger.debug "Not Found: #{full_path}"
        end
      end
      logger.debug ''
    end
    raise NoTemplateFound
  end
end

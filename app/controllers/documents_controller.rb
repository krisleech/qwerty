class DocumentsController < QwertyBaseController
  def index
    @documents = Document.public
  end

  def show
    path = request.path == '/' ? '/home' : request.path
    @document = Document.public.find_by_permalink!(path)
  end
end

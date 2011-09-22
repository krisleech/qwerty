class DocumentsController < QwertyBaseController
  def index
    @documents = Document.public
  end

  def show
    @document = Document.public.find_by_permalink!(request.path)
  end
end

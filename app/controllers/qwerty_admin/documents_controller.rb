class QwertyAdmin::DocumentsController < QwertyAdmin::BaseController
  def index
    @documents = Document.roots
  end

  def new
    @document = build_resource
    @document.parent_id = params[:parent_id]
    @document.node_id = params[:node_id]
  end
  
  def create
    create! { default_redirect }
  end

  def update
    update! { default_redirect }
  end

  def up
    resource.move_higher
    redirect_to default_redirect
  end

  def down
    resource.move_lower
    redirect_to default_redirect
  end

  private

  def default_redirect
    resource.root? ? qwerty_admin_documents_path : qwerty_admin_document_path(resource.parent)
  end
end

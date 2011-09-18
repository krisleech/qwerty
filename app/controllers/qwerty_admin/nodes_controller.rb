class QwertyAdmin::NodesController < QwertyAdmin::BaseController
  def index
    @root_node = Sitemap.root
  end

  def new
    @node = build_resource
    @node.parent_id = params[:parent_id]
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
    qwerty_admin_nodes_path
  end
end

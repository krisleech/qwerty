class QwertyAdmin::NodesController < QwertyAdmin::BaseController
  def index
    @root_node = Sitemap.root
  end

  def new
    @node = Node.new
    @node.parent_id = params[:parent_id]
  end
  
  def create
    create! { [:qwerty_admin, :nodes] }
  end

  def update
    update! { [:qwerty_admin, :nodes] }
  end
end

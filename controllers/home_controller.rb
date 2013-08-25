class HomeApp < SinatraController
  # use Rack::Auth::Basic do |username, password|
  #   username == 'filip' && password == 'pass'
  # end
  use Rack::Reloader
  
  get '/' do
    #@posts = Post.all(:limit => 25)
    @posts = Post.all(:fields => [:id, :name],:limit => 25)
    if params[:page]
      @page = params[:page].to_i
      @posts = Post.all(:fields => [:id, :name], limit: 10, offset: @page * 10)
    end  
    slim :index
  end

  get '/post/:id' do
    @post = Post.get(params[:id])
    slim :post
  end

end

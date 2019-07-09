class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :destroy, :show]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    @article = Article.new(article_params)
    @article.user = current_user #teste
    if @article.save #Se não houver erros e o arquivo for adicionado ao banco
      flash[:notice] = "Article added!"
      redirect_to article_path(@article)
    else
      render 'new' #Carrega o form de novo
    end
  end

  def show

  end

  def update

    if @article.update(article_params)
      flash[:notice] = "Article was updated :)"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def edit

  end

  def destroy

    @article.destroy
    flash[:notice] = "Article was deleted :D"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :description)
    end

    def set_article
      @article = Article.find(params[:id])
    end

    def require_same_user
      if current_user != @article.user && !current_user.admin?
        flash[:danger] = "You're not this article owner"
        redirect_to root_path
      end
    end
end

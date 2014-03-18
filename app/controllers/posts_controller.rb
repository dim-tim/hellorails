class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    #по нажатию Submit с формы приходят параметры как params[:post] где post - Это имя формы
    #и мы создаем новый объект модели, связав её поля с полями формы которые пришли от пользователя
    @post = Post.new(params[:post])

    #save in DB
    if @post.save
      #переходим на show и передаем id записи
      redirect_to :action => :show, :id => @post.id
    else
      render 'new'
    end
  end

  def show
    #ищем в БД по id запись и сохраняем её в переменной экземпляра
    #передаем переменную экземпляра во вьюху show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to :action => :show, :id => @post.id
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to :action => :index
  end
end

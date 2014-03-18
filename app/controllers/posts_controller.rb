class PostsController < ApplicationController

  def new

  end

  def create
    #по нажатию Submit с формы приходят параметры как params[:post] где post - Это имя формы
    #и мы создаем новый объект модели, связав её поля с полями формы которые пришли от пользователя
    @post = Post.new(params[:post])

    #save in DB
    @post.save
    #переходим на show и передаем id записи
    redirect_to :action => :show, :id => @post.id
  end

  def show
    #ищем в БД по id запись и сохраняем её в переменной экземпляра
    #передаем переменную экземпляра во вьюху show
    @post = Post.find(params[:id])
  end
end

# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show]

  def index
    @q = Article.sorted.ransack(params[:q])
    @articles = @q.result
  end

  def new
    authorize Article.new
  end

  def create
    @article = Article.new(article_params)

    authorize @article

    if @article.save
      flash[:notice] = I18n.t('notice.updated')
      redirect_to articles_path
    else
      flash[:error] = @article.errors.full_messages
      render :new
    end
  end

  def edit
    authorize @article
  end

  def update
    authorize @article

    if @article.update(article_params)
      flash[:notice] = I18n.t('notice.updated')
    else
      flash[:error] = @article.errors.full_messages
    end

    redirect_to articles_path(@article)
  end

  def show
    @article.increment!(:visit_count)
  end

  private

  def article_params
    params.require(:article).permit(:title, :level, :minutes_to_read, :kind, :content, :image, :description)
  end

  def set_article
    @article = Article.find_by(id: params[:id])
    redirect_to root_path, notice: I18n.t('notice.not_found') if @article.blank?
  end
end

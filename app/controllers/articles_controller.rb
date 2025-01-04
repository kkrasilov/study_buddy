# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :set_article, only: %i[edit update show]
  before_action :check_admin, only: %i[new create edit update]

  def index
    @q = Article.order(:created_at).ransack(params[:q])
    @articles = @q.result
  end

  def new; end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = I18n.t('notice.updated')
      redirect_to articles_path
    else
      flash[:error] = @article.errors.full_messages
      render :new
    end
  end

  def edit; end

  def update
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

  def check_admin
    redirect_to root_path unless current_user&.admin?
  end
end

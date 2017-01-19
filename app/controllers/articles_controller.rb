class ArticlesController < ApplicationController
# GET /articles
def index
@articles=Article.all
end
#get articles/:id
def show
	#select from
	#encuentra un articulo por su id
	@article=Article.find(params[:id])

	#where
   #Article.where("id=?"params[:id])
   #Article.where.not("id=?"params[:id])
end
#GET /article/new
def new
@article=Article.new
end

#GET /article/new
def edit
	@article=Article.find(params[:id])
end

#GET/article/create
def create
	#insert into
	@article=Article.new(title:params[:article][:title],
		body:params[:article][:title])

	if @article.save
		redirect_to @article
	else
		render :new
	end
end



#	
#end

def destroy
	#delete frp, article
	@article=Article.find(params[:id])
	@article.destroy
	redirect_to articles_path	
end

#PUT /article/:id
def update
	@article=Article.find(params[:id])

	if @article.update(article_params)
		redirect_to @article
	else
		render :edit
	end
#@article.update_attributes({title: 'nuevo titulo'})
end

private

def article_params

	params.require(:article).permit(:title,:body)
end

end

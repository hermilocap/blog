class Article < ActiveRecord::Base
	#validaciones de vacio
	validates:title,presence:true
	validates:body, presence:true
end

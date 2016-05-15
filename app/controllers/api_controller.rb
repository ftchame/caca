class ApiController < ApplicationController
	access_token = '2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
	def tag
		tag = params[:tag]
		if params[:access_token]
			token = params[:access_token]
		else
			token = access_token
		count = tagCount(tag, access_token)
		array = arrayPosts(tag, access_token)
		if(count && array)
			render json: {
			metadata: {
				total: count
			},
			posts: array,
			version: ENV["version_id"]
		}
		else
			render json: {error: "Parametros correctos, pero hubo error en búsqueda. No se pueden recibir tags que tengan menos de 2 resultados"}, status: 400
		end
	else
		render json: {error: "Parametros no están correctos. Deben ser Strings y con nombre 'tag' y 'access_token'"}, status: 400
	end
	end
end

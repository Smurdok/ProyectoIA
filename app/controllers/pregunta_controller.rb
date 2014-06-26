class PreguntaController < ApplicationController
  	def envia
	  	#require 'jaccard'

	  	@comercial = ["compra", "precio", "cuesta", "venta", "cuanto", "adquirir", "obtener", "conseguir", "negociar", "consumir", "cantidad", "importe", "costo", "estimacion", "monto", "total", "suma", "adquirir"];
		@tecnico = ["reparar", "revisar", "checar", "reparacion", "ayuda", "soporte", "corregir", "arreglar", "averio", "componer", "corregir", "deteriorarse", "solucionar", "prende", "prender", "encender"];

	  	#@palabra = params[:q];
	  	@pregunta = params[:q];
	  	@palabras = @pregunta.split(" ");

		if (Jaccard.coefficient(@tecnico,@palabras) > Jaccard.coefficient(@comercial,@palabras))
			@tipo = "Tecnico"
		else @tipo = "Comercial"
		end
	end
end

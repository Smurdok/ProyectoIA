class PreguntaController < ApplicationController
  	def envia
	  	#require 'jaccard'

	  	@comercial = ["compra", "precio", "cuesta", "venta", "cuanto", "adquirir", "obtener", "conseguir", "negociar", "consumir", "cantidad", "importe", "costo", "estimacion", "monto", "total", "suma", "adquirir"];
		@tecnico = ["reparar", "revisar", "checar", "reparacion", "ayuda", "soporte", "corregir", "arreglar", "averio", "componer", "corregir", "deteriorarse", "solucionar", "prende", "prender", "encender","sirve", "descompuso","funciona"];


	  	@pregunta = params[:q];
	  	@palabras = @pregunta.split(" ");

		if (Jaccard.coefficient(@tecnico,@palabras) > Jaccard.coefficient(@comercial,@palabras))
			@tipo = "Tecnico"
		else @tipo = "Comercial"
		end

		b = Classifier::Bayes.new 'comercial','tecnico'
		@comercial.each {|x| b.train_comercial x}
		@tecnico.each {|y| b.train_tecnico y}
		@respuesta = b.classify @pregunta

		a = Classifier::Bayes.new 'comercial','tecnico'
		comercial =[
				"Comprar el nuevo","Renovar Licencia",
				"Cuanto cuesta, precio",
				"Donde venden",
				"Donde adquiero",
				"Cual es el costo total de, o a meses",
				"El importe o monto"
			]
			
		tecnico = [
				"Se cayo, mojo, estrello mi",
				"Se rompio",
				"No prende, enciende mi",
				"Pueden reparar, arreglar, checar mi"
			]
		comercial.each {|x| a.train_comercial x}
		tecnico.each {|y| a.train_tecnico y}
		@respuesta2 = a.classify @pregunta

	end

end

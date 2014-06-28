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

		lsi = Classifier::LSI.new
		posibles =[
				["Comprar el nuevo","Renovar Licencia", :comercial],
				["Cuanto cuesta, precio", :comercial],
				["Donde venden", :comercial],
				["Donde adquiero", :comercial],
				["Cual es el costo total de, o a meses", :comercial],
				["El importe o monto", :comercial],
				["Se cayo, mojo, estrello mi", :tecnico],
				["Se rompio", :tecnico],
				["No prende, enciende mi", :tecnico],
				["Pueden reparar, arreglar, checar mi", :tecnico]
			]
		posibles.each {|x,y| lsi.add_item x, y}
		@respuesta2 = lsi.classify @pregunta

	end

end

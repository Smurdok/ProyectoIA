class ProductosController < ApplicationController
  def buscar

  	#frecuencias = Hash.new(0)
	#palabras.each {|palabra| frecuencias[palabra] +=1}

  	@producto = params[:cosas];

  	#mi_hash = Hash.new(0)
  	#mi_hash = []
	productos = Hash.new(0)

	productos  = { 
  		"televisor" => "televisor sala lcd",
  		"refrigerador" => "refrigerador hogar cocina",
  		"telefono" => "hogar telefono oficina",
  		"zapatos" => "zapatos moda casual",
  		"tenis" => "tenis deportivos moda",
  		"camisa" => "camisa vestir",
  		"zapatillas"=>"zapatillas moda formal mujer",
  		"computadora"=>"computadora tecnologia oficina",
  		"tanga"	=>"lenceria sexy mujer",
  		"pantalla"=>"tecnologia lcd hogar",
  		"pantalon"=>"moda casual hombres",
  		"pans"=>"deportivo hombres casual",
  		"smartphone"=>"tecnologia telefono oficina",
  		"playeras"=>"vestir hombre casual",
  		"dvd"=>"tecnologia sala oficina hogar",
  		"boxer"=>"hombre moda casual",
  		"brasiere"=>"mujer sexy lenceria",
  		"chamarra"=>"hombre moda casual",
  		"minicomponente"=>"hogar tecnologia oficina",
  		"sala"=>"hogar sala familiar",
  		"vestido"=>"mujer moda formal",

	}



	@cosa1 = @producto.split(" ");

	#@salida = productos.map { |x,y| y} 
	mi_hash = Hash.new(0)
	@salida = productos.map { |x,y| mi_hash[x] = Jaccard.coefficient(y.split(" "),@cosa1)} 
	#@salida1 = productos.map { |x, y| "#{x}: #{y}" }
	#@salida2 = productos.map { |x| x}

	@salida3 = mi_hash.map {|x| x}
	mi_hash = mi_hash.sort_by {|a,b| b}
	@salidaFinal = mi_hash.reverse!



  @salida4 = mi_hash.map {|x,y| y > 0}

	#@productos.each { |x,y| puts x}

  end
end

class GruaList < Prawn::Document
  #Hay dos formas de hacerlo 1- con el constructor de la clase o  2- con este Método principal que construye el  documento pdf y se invoca con el contructor en el controller
  
  # 1- Método constructor de la clase Orderlist 
  
  def initialize(gruas, view)
     super()
     logo 
     @gruas = gruas
     @vista = view
     grua_details
  end
   
  # 2- Método que reemplaza el constructor(initialize se elimina), pero implica que en el controller de la clase se invoque así:
  #  output = OrderList.new.to_pdf(@orders,view_context) -> es más larga esta forma.
  # y también se debe cambiar el formato quitandole el método render así:
  # format.pdf{
  #      send_data output, :filename => "orderslist.pdf", :type => "application/pdf", :disposition => "inline"
  #    }
  def to_pdf(gruas, view)
    logo
    @gruas = gruas
    @vista = view
    gruas_details
    render
  end
  
  #Método para definir el logo con su ubicación así como el título del reporte  
  def logo
    logopath =  "#{Rails.root}/app/assets/images/LOGO.png"
    image logopath, :width => 50, :height => 64
    move_down 10
    draw_text "Listado de gruas", :at => [150, 575], size: 22
    text "SAVE DRIVING"
    text "Asistencia vehicular"
  end
  
  #Método para dar formato a la salida de los registros
  def precision(num)
    @vista.number_with_precision(num, :locale => :es ,:precision => 2, :separator => ",", :delimiter => '.')
  end
  
  #Método para almacenar y mostrar los registros del detalle de la orden
  def grua_item_rows
    [["id", "documento", "numero", "nombres", "direccion", "ciudad", "tel", "email", "observaciones", "calificacion"]] +
    @gruas.map do |grua|
      [ "#{grua.id} ",   
      "#{grua.documento.nombre} ", 
      "#{grua.numero_doc} ",
      "#{grua.nombres} ", 
      "#{grua.direccion} ", 
      "#{grua.municipio.nombre} ", 
      "#{grua.telefonos} ", 
      "#{grua.email} ",
      "#{grua.observaciones} ",
      "#{grua.calificacion.nombre} "]
    end
  end
  
  #Método que imprime la tabla de las ordenes que hay
  def grua_details
    move_down 70
    table grua_item_rows, :width => 520 do
      row(0).font_style = :bold
      columns(1..11).align = :right
      self.header = true
      self.column_widths = {0 => 17, 1 => 50, 2 => 70, 3 => 70, 4 => 70, 5 => 45, 6 => 50, 7 => 65, 8 => 50, 9 => 33 }
    end
  end

end

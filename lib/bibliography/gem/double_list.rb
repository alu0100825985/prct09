    Node = Struct.new(:prev, :value, :next) # Definimos la estructura del nodo

    class Double_List # Clase para el desarrollo de una lista doblemente enlazada.
    
      attr_accessor :head, :tail
      include Enumerable 
    
      #-----> MÉTODOS DE LA CLASE.
    
      def initialize(head, tail) # Constructor de la clase.
    
        # Declaración e inicialización de las variables de instancia.
        @head = head # Variable de instancia para establecer la cabeza de nuestra lista. Pasada por parámetro.
        @tail = tail # Variable de instancia para establecer la cola de nuestra lista. Pasada por parámetro.
      end
      
      def insert(item) # Método para insertar un nodo al principio de la lista.
        @node = Node.new(nil,item,nil) # Inicializamos un nodo con el value pasado por parámetro.
        @node.next = @head # Establecemos como next del nodo insertado a head.
        @node.prev = nil # Establecemos como nulo el prev del nodo insertado.

        if @tail == nil # CONDICIÓN: Si no existe cola en la lista.
          @tail = @node # La cola será igual al nodo insertado.
        else 
          @head.prev = @node # El prev del nodo que estaba situado al principio será el insertado (este pasará a ser ahora el segundo)
        end
        @head = @node # El nodo insertado pasará a ser la cabeza de la lista.
      end
      
      def extract # Método para extraer un nodo del principio de la lista.
        node_extract = @head # Variable auxiliar para conservar el primer nodo de la lista.
        @head = @head.next # Establecemos con head al siguiente nodo.

        node_extract.next = nil # Establecemos como nil el next del nodo a extraer.
        node_extract.prev = nil # Establecemos como nil el prev del nodo a extraer.

        if @head == nil # CONDICIÓN: Si al extraer el nodo de la lista, la cabeza es igual a nil (único nodo)
          @tail = nil # La cola será también nil.
        end

        return node_extract # Extraemos el head anterior, almacenado en la variable auxiliar.
      end
  
      def empty? # Método para comprobar si la lista está vacía.
        @head == nil
      end
      
      def each # Método del mixin Enumerable. Se define como una iteración sobre los valores de los nodos.
        auxiliary_pointer = @head # Puntero auxiliar para ir recorriendo la lista. Inicializada en la cabeza de la lista.
        while auxiliary_pointer != nil # Mientras el puntero auxiliar no sea igual a nil (fin de la lista).
          yield auxiliary_pointer.value # Yield sobre el valor del nodo apuntado para el mixin enumerable.
          auxiliary_pointer = auxiliary_pointer.next # Cambiamos el puntero hacia el siguiente nodo.
        end
      end
      
    end
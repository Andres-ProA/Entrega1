###
Paso 1: Copiar de https://www.w3schools.com/python/python_mysql_create_db.asp e instalar el conector: pip install mysql-connector-python
Luego reemplazar los valores de las variables con las credenciales de cada MySQL.
###
import mysql.connector

mydb = mysql.connector.connect(
  host="localhost",
  user="yourusername",
  password="yourpassword"
)
mycursor = mydb.cursor()
mycursor.execute("CREATE DATABASE mydatabase") #reemplazar por el nombre de la base de datos. 

###
Paso 2: Crear las tablas
###
mycursor.execute("CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))")


###
Paso 3: Insertar datos
###
sql = "INSERT INTO customers (name, address) VALUES (%s, %s)"
val = ("John", "Highway 21")
mycursor.execute(sql, val)
mydb.commit()

###
Paso 4: Realizar consultas
###
-----------SELECT-----------
mycursor.execute("SELECT * FROM customers")
myresult = mycursor.fetchall()
for x in myresult:
  print(x)

----------SELECT WHERE---------
sql = "SELECT * FROM customers WHERE address ='Park Lane 38'"
mycursor.execute(sql)
myresult = mycursor.fetchall()
for x in myresult:
  print(x)

-----------DELETE---------------
sql = "DELETE FROM customers WHERE address = 'Mountain 21'"
mycursor.execute(sql)
mydb.commit()


-----------UPDATE--------------
sql = "UPDATE customers SET address = 'Canyon 123' WHERE address = 'Valley 345'"
mycursor.execute(sql)
mydb.commit()



###
Paso 5: Crear un menú de ingreso de datos por consola.
###

def menu():
    while True:
        print("\n========= MENÚ PRINCIPAL =========")
        print("1. Registrar usuario")
        print("2. Iniciar sesión")
        print("3. Consultar usuario")
        print("4. Modificar datos")
        print("5. Cambiar contraseña")
        print("6. Eliminar usuario")
        print("7. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            registrar_usuario()
        elif opcion == "2":
            iniciar_sesion()
        elif opcion == "3":
            consultar_usuario()
        elif opcion == "4":
            modificar_usuario()
        elif opcion == "5":
            modificar_password()
        elif opcion == "6":
            eliminar_usuario()
        elif opcion == "7":
            print("¡Hasta pronto!")
            break
        else:
            print("Opción inválida. Intente de nuevo.\n")

# -------------------------------------
# EJECUCIÓN
# -------------------------------------
if __name__ == "__main__":
    menu()



###
Paso 6: Crear una funcion que conecte a la base de datos.
###
def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="admin",
        database="tienda_de_ropa"
    )


###
Paso 7: Crear las funciones que elegimos en el menú. Por ejemplo: iniciar_sesion()
###
def iniciar_sesion():
    print("\n--- INICIO DE SESIÓN ---")
    email = input("Email: ")
    password = input("Contraseña: ")

    conexion = conectar()
    cursor = conexion.cursor()

    query = "SELECT id, nombre, apellido FROM usuarios WHERE email = %s AND password = %s"
    cursor.execute(query, (email, password))
    resultado = cursor.fetchone()

    if resultado:
        print(f"\nBienvenido {resultado[1]} {resultado[2]} (ID: {resultado[0]})\n") #type: ignore
    else:
        print("\nCredenciales incorrectas.\n")

    cursor.close()
    conexion.close()
def convertir_binario_a_decimal(binario):
    decimal = 0
    posicion = 0
    while binario > 0:
        digito = binario % 10
        decimal += digito * (2 ** posicion)
        posicion += 1
        binario //= 10
    return decimal

def convertir_decimal_a_binario(decimal):
    binario = ''
    while decimal > 0:
        digito = decimal % 2
        binario = str(digito) + binario
        decimal //= 2
    return int(binario)

def convertir_decimal_a_octal(decimal):
    octal = ''
    while decimal > 0:
        digito = decimal % 8
        octal = str(digito) + octal
        decimal //= 8
    return int(octal)

def convertir_decimal_a_hexadecimal(decimal):
    hexadecimal = ''
    while decimal > 0:
        digito = decimal % 16
        if digito < 10:
            hexadecimal = str(digito) + hexadecimal
        else:
            hexadecimal = chr(ord('A') + digito - 10) + hexadecimal
        decimal //= 16
    return hexadecimal


def convertir_octal_a_decimal(octal):
    decimal = 0
    posicion = 0
    while octal > 0:
        digito = octal % 10
        decimal += digito * (8 ** posicion)
        posicion += 1
        octal //= 10
    return decimal

def convertir_hexadecimal_a_decimal(hexadecimal):
    decimal = 0
    posicion = 0
    for digito in hexadecimal[::-1]:
        if digito.isdigit():
            decimal += int(digito) * (16 ** posicion)
        else:
            decimal += (ord(digito.upper()) - ord('A') + 10) * (16 ** posicion)
        posicion += 1
    return decimal

def convertir_binario_a_octal(binario):
    decimal = convertir_binario_a_decimal(binario)
    octal = convertir_decimal_a_octal(decimal)
    return octal

def convertir_binario_a_hexadecimal(binario):
    decimal = convertir_binario_a_decimal(binario)
    hexadecimal = convertir_decimal_a_hexadecimal(decimal)
    return hexadecimal

def convertir_octal_a_binario(octal):
    decimal = convertir_octal_a_decimal(octal)
    binario = convertir_decimal_a_binario(decimal)
    return binario

def convertir_octal_a_hexadecimal(octal):
    decimal = convertir_octal_a_decimal(octal)
    hexadecimal = convertir_decimal_a_hexadecimal(decimal)
    return hexadecimal

def convertir_hexadecimal_a_binario(hexadecimal):
    decimal = convertir_hexadecimal_a_decimal(hexadecimal)
    binario = convertir_decimal_a_binario(decimal)
    return binario

def convertir_hexadecimal_a_octal(hexadecimal):
    decimal = convertir_hexadecimal_a_decimal(hexadecimal)
    octal = convertir_decimal_a_octal(decimal)
    return octal


print("1. Convertir desde Binario")
print("2. Convertir Desde Decimal")
print("3. Convertir desde Octal")
print("4. Convertir desde Hexadecimal")
print("5. Salir")
opcion = int(input("Ingrese una opcion: "))

if opcion == 1:
    print("1. Convertir a Decimal")
    print("2. Convertir a Octal")
    print("3. Convertir a Hexadecimall")
    print("4. Regresar")
    opcion = int(input("Ingrese una opcion: "))

    if opcion == 1:
        binario = int(input("Ingrese un número binario: "))
        decimal = convertir_binario_a_decimal(binario)
        print(f"El número binario {binario} equivale a {decimal} en decimal.")

    elif opcion == 2:
        binario = int(input("Ingrese un número binario: "))
        octal = convertir_binario_a_octal(binario)
        print(f"El número binario {binario} equivale a {decimal} en octal.")
    elif opcion == 3:
        binario = int(input("Ingrese un número binario: "))
        hexadecimal = convertir_binario_a_hexadecimal(binario)
        print(f"El número binario {binario} equivale a {hexadecimal} en hexadecimal.")
    elif opcion == 4:
        pass

elif opcion == 2:
    print("1. Convertir a Binario")
    print("2. Convertir a Octal")
    print("3. Convertir a Hexadecimall")
    print("4. Regresar")
    opcion = int(input("Ingrese una opcion: "))

    if opcion == 1:
        decimal = int(input("Ingrese un número decimal: "))
        binario = convertir_decimal_a_binario(decimal)
        print(f"El número decimal {decimal} equivale a {binario} en binario.")

    elif opcion == 2:
        decimal = int(input("Ingrese un número decimal: "))
        octal = convertir_decimal_a_octal(decimal)
        print(f"El número decimal {decimal} equivale a {octal} en octal.")
    elif opcion == 3:
        decimal = int(input("Ingrese un número decimal: "))
        hexadecimal = convertir_decimal_a_hexadecimal(decimal)
        print(f"El número decimal {decimal} equivale a {hexadecimal} en hexadecimal.")
    elif opcion == 4:
        pass

elif opcion == 3:
    print("1. Convertir a Binario")
    print("2. Convertir a Decimal")
    print("3. Convertir a Hexadecimall")
    print("4. Regresar")
    opcion = int(input("Ingrese una opcion: "))

    if opcion == 1:
        octal = int(input("Ingrese un número octal: "))
        binario = convertir_octal_a_binario(octal)
        print(f"El número octal {octal} equivale a {binario} en binario.")
    elif opcion == 2:
        octal = int(input("Ingrese un número octal: "))
        decimal = convertir_octal_a_decimal(octal)
        print(f"El número octal {octal} equivale a {decimal} en decimal.")

    elif opcion == 3:
        octal = int(input("Ingrese un número octal: "))
        hexadecimal = convertir_octal_a_hexadecimal(octal)
        print(f"El número octal {octal} equivale a {hexadecimal} en hexadecimal.")
    elif opcion == 4:
        pass

elif opcion == 4:
    print("1. Convertir a Binario")
    print("2. Convertir a Decimal")
    print("3. Convertir a Octal")
    print("4. Regresar")
    opcion = int(input("Ingrese una opcion: "))

    if opcion == 1:
        hexadecimal = int(input("Ingrese un número hexadecimal: "))
        binario = convertir_hexadecimal_a_binario(hexadecimal)
        print(f"El número hexadecimal {hexadecimal} equivale a {binario} en binario.")
    elif opcion == 2:
        hexadecimal = int(input("Ingrese un número hexadecimal: "))
        decimal = convertir_hexadecimal_a_decimal(hexadecimal)
        print(f"El número hexadecimal {hexadecimal} equivale a {decimal} en decimal.")
    elif opcion == 3:
        hexadecimal = int(input("Ingrese un número hexadecimal: "))
        octal = convertir_hexadecimal_a_octal(hexadecimal)
        print(f"El número hexadecimal {hexadecimal} equivale a {octal} en octal.")
    elif opcion == 4:
        pass

elif opcion == 5:
    pass
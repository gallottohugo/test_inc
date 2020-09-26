# TEST INCREASE

Proyecto Flutter.

## Versiones utilizadas
- Flutter version 1.20.2
- Framework revision bbfbf1770c, 2020-08-13 08:33:09
- Engine revision 9d5b21729f
- Dart version 2.9.1

## Instalación
- [Instalar el SDK de Dart](https://dart.dev/get-dart)
- [Instalar Flutter](https://flutter.dev/docs/get-started/install)

## Clonar
- Clonar el repositorio en la máquina local usando `https://github.com/gallottohugo/test_inc.git`

## Setup
- Ejecutar `flutter pub get` para instalar los paquetes utilizados

## Test
- Android toolchain - Device (Android SDK version 29.0.0)
- Platform android-30, build-tools 29.0.0

---

## Mejoras del examen
- Explicar y brindar más información sobre los objetos (tablas) definidos. No se comprende del todo la relación entre los mismos y cómo obtener algunos resultados para dicho examen.

## Mejoras en el API
- Mejorar las condiciones del servidor, al enviar varias peticiones al mismo tiempo el servidor se rompe y devuelve `Internal Server Error - Status 500`.
- Retornar información en formato JSON.
- Agregar claves externas en los objetos.

## Mejoras en la solución
- Realizar peticiones al servidor de manera automática.
- Mejorar el manejo de excepciones.
- Resolver el item `Dinero que los clientes cobraron y el dinero que van a cobrar`.
- Posibilidad de volver a consultar un cliente en particular cuando se cae el servidor.
- Mejorar el diseño.
- Formato moneda a los importes.

## Explicación de implementación
La implementación consiste en una aplicacíón (proyecto Flutter).
Al presionar el botón `INICIAR APLICACIÓN` se realiza una petición al servidor y se consume el archivo file.txt almacenando las transferencias, clientes y su relación en una lista temporal.
Luego se muestra un listado de los clientes con la posibilidad de ver la información completa de los mismos y el listado de transferencias que realizó.

## Video demostrativo
![app test](https://img.youtube.com/vi/ujGjZVrvXDo/0.jpg)

- [Link al video](https://www.youtube.com/watch?v=ujGjZVrvXDo)





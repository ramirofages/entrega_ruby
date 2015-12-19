# TP ruby

##Preparar el ambiente:

Yo trabaje sobre windows y tuve que instalar nodejs por un problema con execjs en windows. En una virtual con linux tambien lo instale por las dudas y no tuve problemas (aunque no verifique que fuese necesario ahi).
En los inputs del formulario utilice el type=date el cual no es soportado por firefox todavia, asique recomiendo usar chrome o alguno que soporte ese tipo de input.

Despues de eso hacen:


`bundle install`

 para instalar las gemas. 


Despues en el directorio /bin :

```
rake db:migrate
rake db:seed
```
y por ultimo

```
rails server
```
y ya deberia estar todo andando



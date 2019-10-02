% Colo de la fruta
coloracion(negra).
coloracion(roja).
coloracion(blanca).
coloracion(rosada).

% Nivel de cobertura de manchas
cobertura(alto).
cobertura(medio).
cobertura(bajo).
cobertura(ninguno).	

% Posibles manchas en la fruta
mancha(quemadura).
mancha(herida).
mancha(machucon).
mancha(perforacion).
mancha(partidura).
mancha(magulladura).
mancha(medialuna).
mancha(arruga).
mancha(madurez).
mancha(abrasion).

%El fruto no tiene mancha
mancha(nada).

% Define el diametro de la fruta
calibre(18).
calibre(19).
calibre(20).
calibre(21).
calibre(22).
calibre(23).
calibre(24).
calibre(25).
calibre(26).
calibre(27).
calibre(28).
calibre(29).
calibre(30).
calibre(31).
calibre(32).

% Tamanio segun el calibre de la fruta
tamanio(pequenio, 18).
tamanio(pequenio, 19).
tamanio(pequenio, 20).
tamanio(pequenio, 21).
tamanio(mediano, 22).
tamanio(mediano, 23).
tamanio(mediano, 24).
tamanio(mediano, 25).
tamanio(mediano, 26).
tamanio(mediano, 27).
tamanio(grande, 28).
tamanio(grande, 29).
tamanio(grande, 30).
tamanio(grande, 31).
tamanio(grande, 32).

% Salida embalajes
salidaEmbalaje(1, 18).
salidaEmbalaje(2, 19).
salidaEmbalaje(3, 20).
salidaEmbalaje(4, 21).
salidaEmbalaje(5, 22).
salidaEmbalaje(6, 23).
salidaEmbalaje(7, 24).
salidaEmbalaje(8, 25).
salidaEmbalaje(9, 26).
salidaEmbalaje(10, 27).
salidaEmbalaje(11, 28).
salidaEmbalaje(12, 29).
salidaEmbalaje(13, 30).
salidaEmbalaje(14, 31).
salidaEmbalaje(15, 32).
salidaEmbalaje(16, desecho).

% Fruto exportable
salida(grande, ninguno, exportable).
salida(mediano, ninguno, exportable).

% Fruto mercado interno
salida(grande, bajo, interno).
salida(mediano, bajo, interno).
salida(pequenio, ninguno, interno).

% Fruto desechable
salida(_, alto, desecho).
salida(_, medio, desecho).

%fruta(Coloracion, mancha, cobertura, calibre, Defecto)

% Condiciones perfecto estado
fruta(roja, _, ninguno, _, "sin defectos").
fruta(negra, _, ninguno, _, "sin defectos").
fruta(roja, nada, _, _, "sin defectos").
fruta(negra, nada, _, _, "sin defectos").

% 1 - Condiciones magulladura
fruta(negra, magulladura, alto, _, "magulladura").


% 2 - Condiciones cicatriz
fruta(roja, herida, medio, _, "herida cicatrizada").
fruta(roja, herida, alto, _, "heridas cicatrizadas").
fruta(roja, herida, bajo, _, "herida cicatrizada").

% 3 - Condiciones machucon
fruta(roja, machucon, alto, _, "machucon").
fruta(rosada, machucon, alto, _, "machucon").

% 4 - Condiciones perforacion
fruta(roja, perforacion, medio, _, "perforacion cicatrizada").
fruta(roja, perforacion, alto, _,"perforacion cicatrizada").

% 5 - Condiciones quemadura
fruta(roja, quemadura, alto, _, "quemadura solar").
fruta(roja, quemadura, medio, _, "quemadura solar").

% 6 - Condiciones sin color
fruta(blanca, _, _, _, "sin Color").

% 7 - Condiciones partidura cicatrizada
fruta(roja, partidura, medio, _, "partidura cicatrizada").
fruta(negra, partidura, alto, _, "partidura cicatrizada").

% 8 - Condiciones fruto arrugado
fruta(roja, arruga, medio, _, "fruta arrugada").
fruta(negra, arruga, alto, _, "fruta arrugada").

% 9 - Condiciones cicatriz
fruta(roja, cicatriz, medio, _, "cicatriz").
fruta(roja, cicatriz, alto, _, "cicatriz").

% 10 - Condiciones medialuna
fruta(roja, medialuna, _, _, "medialuna").

% 11 - Condiciones madurez excesiva
fruta(roja, madurez, alto, _, "madurez excesiva").

% 12 - Condiciones abrasion
fruta(roja, abrasion, medio, _, "abrasion").
fruta(roja, abrasion, alto, _, "abrasion").

entradaFruta(Coloracion, Mancha, Cobertura, Calibre, Defecto, Tamanio, Salida):-
	fruta(Coloracion, Mancha, Cobertura, Calibre, Defecto),
	tamanio(Tamanio, Calibre),
	salidaEmbalaje(Salida, Calibre).


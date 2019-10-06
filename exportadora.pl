% ############## LABORATORIO N° 1 LOGICA Y TEORIA DE LA COMPUTACIÓN ####################

% Integrantes: - Jorge Plaza 
%              - Franco Labra
%              - Bryan Santelices
%              - Gabriel González


%/////////////////  BASE DE CONOCIMIENTO  ////////////////////// 

% coloracion("Color de la fruta").  

% Color de la fruta
coloracion(negra).
coloracion(roja).
coloracion(blanca).
coloracion(rosada).
%------------------------------------------

% cobertura("nivel de la mancha"). 

% Nivel de cobertura de manchas
cobertura(alto).
cobertura(medio).
cobertura(bajo).
cobertura(ninguno).	
%------------------------------------------

% mancha("Tipo de mancha").

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

% El fruto no tiene mancha
mancha(ninguno).
% ------------------------------------------

% calibre("Diametro de la fruta").

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
% ------------------------------------------

% tamanio("tamaño de fruta","calibre de la fruta").

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
% ------------------------------------------

% salidaEmbalaje("Banda de salida","Calibre de la fruta").

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
% ------------------------------------------

% salida("tamaño de la fruta","Cobertura de la fruta","tipo de portacion").

% Fruto exportable
salida(grande, ninguno, exportable).
salida(mediano, ninguno, exportable).
% ------------------------------------------

% Fruto mercado interno
salida(grande, bajo, interno).
salida(mediano, bajo, interno).
salida(pequenio, ninguno, interno).
% ------------------------------------------

% Fruto desechable
salida(_, alto, desecho).
salida(_, medio, desecho).
salida(pequenio,bajo,desecho).
% ------------------------------------------

% fruta("Coloracion", "mancha", "cobertura", "calibre", "Defecto").

% Condiciones perfecto estado
fruta(roja, _, ninguno, "sin defectos").
fruta(negra, _, ninguno, "sin defectos").
fruta(roja, ninguno, _, "sin defectos").
fruta(negra, ninguno, _, "sin defectos").

% 1 - Condiciones magulladura
fruta(_, magulladura, alto, "magulladura").
fruta(_, magulladura, medio, "magulladura").
fruta(_, magulladura, bajo, "magulladura leve").

% 2 - Condiciones cicatriz
fruta(_, herida, alto, "herida cicatrizadas").
fruta(_, herida, medio, "heridas cicatrizadas").
fruta(_, herida, bajo, "herida cicatrizada").

% 3 - Condiciones machucon
fruta(_, machucon, alto, "machucon").
fruta(_, machucon, medio, "machucon").
fruta(_, machucon, bajo, "machucon leve").

% 4 - Condiciones perforacion
fruta(_, perforacion, alto,  "perforacion cicatrizada").
fruta(_, perforacion, medio, "perforacion cicatrizada").
fruta(_, perforacion, bajo, "perforacion cicatrizada").

% 5 - Condiciones quemadura
fruta(_, quemadura, alto, "quemadura solar").
fruta(_, quemadura, medio, "quemadura solar").
fruta(_, quemadura, bajo, "quemadura solar leve").

% 6 - Condiciones sin color
fruta(blanca, _, _, "sin Color").

% 7 - Condiciones partidura cicatrizada
fruta(_, partidura, alto, "partidura cicatrizada").
fruta(_, partidura, medio, "partidura cicatrizada").
fruta(_, partidura, bajo, "partidura cicatrizada leve").

% 8 - Condiciones fruto arrugado
fruta(_, arruga, alto, "fruta arrugada").
fruta(_, arruga, medio, "fruta arrugada").
fruta(_, arruga, bajo, "fruta arrugada leve").

% 9 - Condiciones cicatriz
fruta(_, cicatriz, alto, "cicatriz").
fruta(_, cicatriz, medio, "cicatriz").
fruta(_, cicatriz, bajo, "cicatriz leve").

% 10 - Condiciones medialuna
fruta(_, medialuna, _, "medialuna").

% 11 - Condiciones madurez excesiva
fruta(_, madurez, alto, "madurez excesiva").
fruta(_, madurez, medio, "madurez excesiva").
fruta(_, madurez, bajo, "madurez leve").

% 12 - Condiciones abrasion
fruta(_, abrasion, alto, "abrasion").
fruta(_, abrasion, medio, "abrasion").
fruta(_, abrasion, bajo, "abrasion leve").
%---------------------------------------------------

% Base logica que permite comparar variables
igual(alto,alto).
igual(medio,medio).
igual(bajo,bajo).
%---------------------------------------------------


% ///////////////////////////////  PREDICADO Y CLAUSULAS ///////////////////////////////////////////


verificacionSalidaEmbalaje(S,Cober,Calibre):- 
	igual(Cober,alto) -> S is 16; 
	igual(Cober,medio) -> S is 16; 
	igual(Cober,bajo) -> salidaEmbalaje(S,Calibre).  


entradaFruta(Coloracion, Mancha, Cobertura, Calibre, Defectos, Tamanio, Salida, Mercado):-
	findall(Defecto, fruta(Coloracion, Mancha, Cobertura, Defecto), Defectos),
	tamanio(Tamanio, Calibre),
	verificacionSalidaEmbalaje(Salida,Cobertura,Calibre),
	salida(Tamanio, Cobertura, Mercado),!.
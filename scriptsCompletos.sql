/*
`tbl_login`			-->
`tbl_usuario`		-->


tbl_usuarioficha
tbl_rol


`tbl_ficha`			--> 2
`tbl_fase`			--> 2


`tbl_foro`			--> 4


`tbl_tipoid`		--> 6
`tbl_estado`		--> 6
`tbl_anuncio`		--> 6
		
`tbl_jornada`		--> 3
`tbl_modalidad`		--> 3
`tbl_oferta`		--> 3
`tbl_programa`		--> 3
		
`tbl_horario`			--> 1
`tbl_materialapoyo`		--> 1
`tbl_documentosficha`	--> 1
*/
CREATE DATABASE proyectointranetpruebas;

CREATE TABLE tbl_fases(
    fas_id	   Int(10) auto_increment PRIMARY KEY,
    fas_nombre Varchar(45) NOT NULL
);

CREATE TABLE tbl_materialapoyo(
    map_id	    Int(10) auto_increment PRIMARY KEY,
    map_titulo	Varchar(45) NOT NULL,
    map_fecpub	DATE NOT NULL DEFAULT CURRENT_DATE(),	
    map_descrp	Varchar(255) NULL,
    map_fasid	Int(10) NOT NULL
);

CREATE TABLE tbl_materialapoyo_ficha(
    maf_id	  Int(10) auto_increment PRIMARY KEY,
    maf_mapid Int(10) NOT NULL,
    maf_ficid Int(10) NOT NULL
);

CREATE TABLE tbl_ficha(
  	fic_id 	 		int(10) NOT NULL AUTO_INCREMENT,
  	fic_codigo		VARCHAR(60) NOT NULL,
    fic_feccrn      DATE NOT NULL DEFAULT CURRENT_DATE(),
    fic_fecfn       date,
    fic_tijid       int(10) NOT NULL,
    fic_modid       int(10) NOT NULL,
    fic_tofid       int(10) NOT NULL,
    fic_pfoid       int(10) NOT NULL,
	PRIMARY KEY 	(fic_id)
 );

CREATE TABLE tbl_tipojornada(
    tij_id     Int(10) auto_increment PRIMARY KEY,
    tij_nombre Varchar(45) NOT NULL
);

CREATE TABLE tbl_modalidad(
    mod_id	    Int(10) auto_increment PRIMARY KEY,
    mod_nombre	Varchar(45) NOT NULL
);

CREATE TABLE tbl_tipooferta(
    tof_id	     Int(10) auto_increment PRIMARY KEY,
    tof_nombre   Varchar(45) NOT NULL
);

CREATE TABLE tbl_horario(
    hor_id	Int(10) auto_increment PRIMARY KEY,
    hor_url   Varchar(500) NOT NULL,
    hor_triini DATE NOT NULL DEFAULT CURRENT_DATE(),		
    hor_trifin	Date NOT NULL,
    hor_trinum	Int(10) NOT NULL,
    hor_ficid	Int(10) NOT NULL
);

CREATE TABLE tbl_anuncio(
    anu_id	    Int(10) auto_increment PRIMARY KEY,
    anu_titulo	Varchar(45) NOT NULL,
    anu_descrp	Varchar(255) NULL,
    anu_feccrn	DATE NOT NULL DEFAULT CURRENT_DATE(),	
    anu_fecfn	Date NOT NULL,
    anu_ficid	Int(10) NOT NULL,
    anu_usuid	Int(10) NOT NULL
);


CREATE TABLE tbl_login(
    log_id 	 		int(10) NOT NULL AUTO_INCREMENT,
    log_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    log_usuid		int(10) NOT NULL,
    log_ficid		int(10) NOT NULL,
    PRIMARY KEY 	(log_id)
);

CREATE TABLE tbl_foro(
    for_id     int(10) auto_increment primary key,
    for_titulo Varchar(45) not null,
    for_fchfin DATE NOT NULL DEFAULT CURRENT_DATE(),
    for_fchini Date,
    for_descrp Varchar(600) not null,
    for_ficid  int(10) not null
);

CREATE TABLE tbl_comentario(
    com_id     int(10) auto_increment primary key,
    com_respst Varchar(45) no null,
    com_fchcrt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    com_perprt Varchar(45),
    com_forid  int(10)
);
CREATE TABLE tbl_respuesta(
    res_id     int(10) auto_increment primary key,
    res_respst Varchar(45) no null,
    res_fchcrt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    res_perprt Varchar(45),
	res_comid     int(10)
);
CREATE TABLE tbl_usuario(	

	usu_id 	 		int(10) AUTO_INCREMENT PRIMARY KEY ,
	usu_nombre		varchar(60) NOT NULL,
	usu_aplldo		varchar(60) NOT NULL,
	usu_passwd		varchar(32) NOT NULL,
	usu_correo		varchar(99) NOT NULL,
	usu_ficid		int(10) NOT NULL,
    usu_rolid       int(10) NOT NULL,
    usu_estid       int(10) NOT NULL,
    usu_tipid       int(10) NOT NULL,
	
);

CREATE TABLE tbl_tipoid(
    tip_id     int(10) auto_increment primary key,
    tip_idntfc Varchar(30) not null
);

CREATE TABLE tbl_rol(
    rol_id     int(10) auto_increment primary key,
    rol_nombre Varchar(30) not null
);

CREATE TABLE tbl_estado(
    est_id     int(10) auto_increment primary key,
    est_nombre varchar(30) not null
);

CREATE TABLE tbl_aprendizficha(
    afi_id     int(10) auto_increment primary key,
    afi_passwd varchar(45) not null,
    afi_ficid  int(10)not null,
    afi_estid  int(10)not null,
    afi_rolid  int(10)not null
);

CREATE TABLE tbl_programaformacion(
    pfo_id     int(10) auto_increment primary key,
    pfo_versn varchar(45) not null,
    pfo_duracn varchar(45) not null,
    pfo_codpro varchar(45) not null,
	pfo_abrvtr	VARCHAR(10) NOT NULL,
    pfo_nompro varchar(45) not null,
    pfo_estid  int(10)not null,
    pfo_tprid  int(10) not null
);


CREATE TABLE tbl_tipoprograma(
    tpr_id     int(10) auto_increment primary key,
    tpr_nombre varchar(45) not null
);
/* AÑADIR LLAVES FORANEAS (HACER DESPUES DE CREAR TODAS LAS TABLAS) */ 

/*Material Apoyo*/ 
ALTER TABLE tbl_materialapoyo
ADD FOREIGN KEY(map_fasid)
REFERENCES tbl_fases(fas_id);

ALTER TABLE tbl_materialapoyo_ficha
ADD FOREIGN KEY(maf_mapid)
REFERENCES tbl_materialapoyo(map_id);

ALTER TABLE tbl_materialapoyo_ficha
ADD FOREIGN KEY(maf_ficid)
REFERENCES tbl_ficha(fic_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_pfoid)
REFERENCES tbl_programaformacion(pfo_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_tijid)
REFERENCES tbl_tipojornada(tij_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_modid)
REFERENCES tbl_modalidad(mod_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_tofid)
REFERENCES tbl_tipooferta(tof_id);

ALTER TABLE tbl_horario
ADD FOREIGN KEY(hor_ficid)
REFERENCES tbl_ficha(fic_id);

ALTER TABLE tbl_anuncio
ADD FOREIGN KEY(anu_ficid)
REFERENCES tbl_ficha(fic_id);

ALTER TABLE tbl_anuncio
ADD FOREIGN KEY(anu_usuid)
REFERENCES tbl_usuario(usu_id);

/*tbl_foro*/
 
alter table tbl_foro
add foreign key (for_ficid)
references tbl_ficha(fic_id);

/*tbl_comentario*/

alter table tbl_comentario
add foreign key (com_forid)
references tbl_foro(for_id);
/*tbl_respuesta*/

alter table tbl_respuesta
add foreign key (res_comid)
references tbl_foro(for_id);
/*tbl_usuario*/

alter table tbl_usuario
add foreign key (usu_estid)
references tbl_estado(est_id);

alter table tbl_usuario
add foreign key (usu_rolid)
references tbl_rol(rol_id);

alter table tbl_usuario
add foreign key (usu_ficid)
references tbl_ficha(fic_id);


/*tbl_aprendizficha*/

alter table tbl_aprendizficha
add foreign key (afi_ficid)
references tbl_ficha(fic_id);

alter table tbl_aprendizficha
add foreign key (afi_estid)
references tbl_estado(est_id);


alter table tbl_aprendizficha
add foreign key (afi_rolid)
references tbl_rol(rol_id);

/*tbl_programaformacion*/

alter table tbl_programaformacion
add foreign key (pfo_estid)
references tbl_estado(est_id);

alter table tbl_programaformacion
add foreign key (pfo_tprid)
references tbl_tipoprograma(tpr_id);

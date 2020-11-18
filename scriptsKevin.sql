CREATE TABLE tbl_foro(
    for_id     int(10) auto_increment primary key,
    for_titulo Varchar(45) not null,
    for_fchfin Date,
    for_fchini Date,
    for_descrp Varchar(600) not null,
    for_ficid  int(10) not null
);

CREATE TABLE tbl_participacion_foro(
    pfo_id     int(10) auto_increment primary key,
    pfo_respst Varchar(45) no null,
    pfo_fchcrt Date,
    pfo_prtpnt Varchar(45),
    pfo_forid  int(10)
);

CREATE TABLE tbl_usuario(
  	usu_id 	 		int(10) NOT NULL AUTO_INCREMENT,
	usu_usuari		varchar(60) NOT NULL,
	usu_passwd		varchar(32) NOT NULL,
	usu_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	usu_fchupd		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usu_ficid		int(10) NOT NULL,
    usu_rolid       int(10) NOT NULL,
    usu_estid       int(10) NOT NULL,
	usu_perid		int(10) NOT NULL,
	PRIMARY KEY 	(usu_id)
);

CREATE TABLE tbl_persona(	
	per_id 	 		int(10) NOT NULL AUTO_INCREMENT,
	per_nombre		varchar(60) NOT NULL,
	per_aplldo		varchar(60) NOT NULL,
	per_fchnac		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	per_dirccn		varchar(99) NOT NULL,
	per_correo		varchar(99) NOT NULL,
	per_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	per_fchupd		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    per_tusid       int(10) NOT NULL,
    per_tduid       int(10) NOT NULL,
	PRIMARY KEY 	(per_id)
);

CREATE TABLE tbl_tipo_documento_usuario(
    tdu_id     int(10) auto_increment primary key,
    tdu_idntfc Varchar(30) not null
);

CREATE TABLE tbl_telefono_usuario(
    tus_id      int(10) auto_increment primary key,
    tus_numero  Varchar(30) not null
);

CREATE TABLE tbl_rol(
    rol_id     int(10) auto_increment primary key,
    rol_nombre Varchar(30) not null
);

CREATE TABLE tbl_estado(
    est_id     int(10) auto_increment primary key,
    est_nombre varchar(30) not null
);

CREATE TABLE tbl_aprendiz_ficha(
    afi_id     int(10) auto_increment primary key,
    afi_passwd varchar(45) not null,
    afi_ficid  int(10)not null,
    afi_estid  int(10)not null,
    afi_accid  int(10)not null,
    afi_rolid  int(10)not null
);

CREATE TABLE tbl_acceso(
    acc_id     int(10) auto_increment primary key,
    acc_ingrss int(10) not null
);

CREATE TABLE tbl_programa_formacion(
    pfo_id     int(10) auto_increment primary key,
    pfo_vrsion varchar(45) not null,
    pfo_duracn varchar(45) not null,
    pfo_codpro varchar(45) not null,
    pfo_nompro varchar(45) not null,
    pfo_estid  int(10)not null,
    pfo_tprid  int(10) not null
);


CREATE TABLE tbl_tipo_programa(
    tpr_id     int(10) auto_increment primary key,
    tpr_nombre varchar(45) not null
);

/*tbl_foro*/
 
alter table tbl_foro
add foreign key (for_ficid)
references tbl_ficha(fic_id);

/*tbl_participacion_foro*/

alter table tbl_participacion_foro
add foreign key (pfo_forid)
references tbl_foro(for_id);

/*tbl_usuario*/

alter table tbl_usuario
add foreign key (usu_estid)
references TblEstado(IdEst);

alter table tbl_usuario
add foreign key (usu_rolid)
references TblRol(IdRol);

alter table tbl_usuario
add foreign key (usu_ficid)
references tbl_ficha(fic_id);

alter table tbl_usuario
add foreign key (usu_perid)
references tbl_persona(per_id);

/*tbl_persona*/

alter table tbl_persona
add foreign key (per_tusid)
references tbl_telefono_usuario(tus_id);

alter table tbl_persona
add foreign key (per_tduid)
references tbl_tipo_documento_usuario(tdu_id);

/*tbl_aprendiz_ficha*/

alter table tbl_aprendiz_ficha
add foreign key (afi_ficid)
references tbl_ficha(fic_id);

alter table tbl_aprendiz_ficha
add foreign key (afi_estid)
references tbl_estado(est_id);

alter table tbl_aprendiz_ficha
add foreign key (afi_accid)
references tbl_acceso(acc_id);

alter table tbl_aprendiz_ficha
add foreign key (afi_rolid)
references tbl_rol(rol_id);

/*tbl_programa_formacion*/

alter table tbl_programa_formacion
add foreign key (pfo_estid)
references tbl_estado(est_id);

alter table tbl_programa_formacion
add foreign key (pfo_tprid)
references tbl_tipo_programa(tpr_id);

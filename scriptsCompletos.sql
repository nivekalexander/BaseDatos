CREATE DATABASE maxlearning;

USE maxlearning; 

CREATE TABLE tbl_fases(
    fas_id	   Int(10) auto_increment PRIMARY KEY,
    fas_nombre Varchar(45) NOT NULL
);

CREATE TABLE tbl_materialapoyo(
    map_id	    Int(10) auto_increment PRIMARY KEY,
    map_titulo	Varchar(45) NOT NULL,
    map_fecpub	DATE NOT NULL DEFAULT CURRENT_DATE(),	
    map_descrp	Varchar(255) NULL,
    map_archurl Varchar(500) NOT NULL,
    map_icono Varchar(100) NOT NULL,
    map_fasid	Int(10) NOT NULL,
    map_usunumdnt  INT(15) NOT NULL
);

CREATE TABLE tbl_noticia (
    not_id int(10) PRIMARY KEY AUTO_INCREMENT,
    not_fech DATE NOT NULL DEFAULT CURRENT_DATE(),
    not_url varchar(500) NOT NULL
);
  


CREATE TABLE tbl_materialapoyo_ficha(
    maf_id	  Int(10) auto_increment PRIMARY KEY,
    maf_mapid Int(10) NOT NULL,
    maf_ficcodigo VARCHAR(60) NOT NULL
);

CREATE TABLE tbl_ficha(
  	
  	fic_codigo		VARCHAR(60) NOT NULL,
    fic_feccrn      date,
    fic_fecfn       date,
    fic_tijid       int(10) NOT NULL,
    fic_modid       int(10) NOT NULL,
    fic_tofid       int(10) NOT NULL,
    fic_pfoid       int(10) NOT NULL,
	PRIMARY KEY 	(fic_codigo)
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
    hor_triini DATE NOT NULL,		
    hor_trifin	Date NOT NULL,
    hor_trinum	Int(10) NOT NULL,
    hor_ficcodigo	VARCHAR(60) NOT NULL
);

CREATE TABLE tbl_anuncio(
    anu_id	    Int(10) auto_increment PRIMARY KEY,
    anu_titulo	Varchar(45) NOT NULL,
    anu_descrp	Varchar(2000) NULL,
    anu_feccrn	DATE NOT NULL DEFAULT CURRENT_DATE(),	
    anu_fecfn	Date NOT NULL,
    anu_ficcodigo	VARCHAR(60) NOT NULL,
    anu_usunumdnt	INT(15) NOT NULL
);


CREATE TABLE tbl_login(
    log_id 	 		int(10) NOT NULL AUTO_INCREMENT,
    log_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    log_usunumdnt		INT(15) NOT NULL,
    log_ficcodigo		VARCHAR(60) NOT NULL,
    PRIMARY KEY 	(log_id)
);

CREATE TABLE tbl_foro(
    for_id     int(10) auto_increment primary key,
    for_titulo Varchar(45) not null,
    for_fchfin DATE NOT NULL DEFAULT CURRENT_DATE(),
    for_fchini Date,
    for_descrp Varchar(2000) not null,
    for_ficcodigo  VARCHAR(60) NOT NULL
);

CREATE TABLE tbl_comentario(
    com_id     int(10) auto_increment primary key,
    com_respst Varchar(2000) not null,
    com_fchcrt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    com_perprt Varchar(45),
    com_forid  int(10)
);
CREATE TABLE tbl_respuesta(
    res_id     int(10) auto_increment primary key,
    res_respst Varchar(2000) not null,
    res_fchcrt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    res_perprt Varchar(45),
	res_comid     int(10)
);
CREATE TABLE tbl_usuario(	
    usu_numdnt      int(15) NOT NULL  PRIMARY KEY ,
	usu_nombre		varchar(60) NOT NULL,
	usu_aplldo		varchar(60) NOT NULL,
	usu_correo		varchar(99) NOT NULL,
    usu_passwd		varchar(32) NOT NULL,
	usu_ficcodigo	VARCHAR(60) NOT NULL,
    usu_rolid       int(10) NOT NULL,
    usu_estid       int(10) NOT NULL,
    usu_tipid       int(10) NOT NULL
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
    afi_usu    varchar (150) not null,
    afi_passwd varchar(45) not null,
    afi_ficcodigo  VARCHAR(60) NOT NULL,
    afi_estid  int(10)not null,
    afi_rolid  int(10)not null
);

CREATE TABLE tbl_programaformacion(
    pfo_id     int(10) auto_increment primary key,
    pfo_versn varchar(45) not null,
    pfo_duracn varchar(45) not null,
	pfo_abrvtr	VARCHAR(10) NOT NULL,
    pfo_nompro varchar(500) not null,
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
REFERENCES tbl_fases(fas_id) on delete cascade on update cascade;


ALTER TABLE tbl_materialapoyo
ADD FOREIGN KEY(map_usunumdnt)
REFERENCES tbl_usuario(usu_numdnt) on delete cascade on update cascade;

/*Material Apoyo - Ficha*/ 

ALTER TABLE tbl_materialapoyo_ficha
ADD FOREIGN KEY(maf_mapid)
REFERENCES tbl_materialapoyo(map_id) on delete cascade on update cascade;

ALTER TABLE tbl_materialapoyo_ficha
ADD FOREIGN KEY(maf_ficcodigo)
REFERENCES tbl_ficha(fic_codigo) on delete cascade on update cascade;

/*Material ficha*/
 
ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_pfoid)
REFERENCES tbl_programaformacion(pfo_id) on delete cascade on update cascade;

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_tijid)
REFERENCES tbl_tipojornada(tij_id) on delete cascade on update cascade;

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_modid)
REFERENCES tbl_modalidad(mod_id) on delete cascade on update cascade;

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_tofid)
REFERENCES tbl_tipooferta(tof_id) on delete cascade on update cascade;

/*Material horario*/

ALTER TABLE tbl_horario
ADD FOREIGN KEY(hor_ficcodigo)
REFERENCES tbl_ficha(fic_codigo) on delete cascade on update cascade;

/*Material anuncio*/

ALTER TABLE tbl_anuncio
ADD FOREIGN KEY(anu_ficcodigo)
REFERENCES tbl_ficha(fic_codigo) on delete cascade on update cascade;

ALTER TABLE tbl_anuncio
ADD FOREIGN KEY(anu_usunumdnt)
REFERENCES tbl_usuario(usu_numdnt) on delete cascade on update cascade;

/*tbl_foro*/
 
alter table tbl_foro
add foreign key (for_ficcodigo)
references tbl_ficha(fic_codigo) on delete cascade on update cascade;

/*tbl_comentario*/

alter table tbl_comentario
add foreign key (com_forid)
references tbl_foro(for_id) on delete cascade on update cascade;

/*tbl_respuesta*/

alter table tbl_respuesta
add foreign key (res_comid)
references tbl_comentario(com_id) on delete cascade on update cascade;

/*tbl_usuario*/

alter table tbl_usuario
add foreign key (usu_estid)
references tbl_estado(est_id) on delete cascade on update cascade;

alter table tbl_usuario
add foreign key (usu_tipid)    /*New*/
references tbl_tipoid(tip_id) on delete cascade on update cascade;
 
alter table tbl_usuario
add foreign key (usu_rolid)
references tbl_rol(rol_id) on delete cascade on update cascade;

alter table tbl_usuario
add foreign key (usu_ficcodigo)
references tbl_ficha(fic_codigo) on delete cascade on update cascade;


/*tbl_aprendizficha*/

alter table tbl_aprendizficha
add foreign key (afi_ficcodigo)
references tbl_ficha(fic_codigo) on delete cascade on update cascade;

alter table tbl_aprendizficha
add foreign key (afi_estid)
references tbl_estado(est_id) on delete cascade on update cascade;


alter table tbl_aprendizficha
add foreign key (afi_rolid)
references tbl_rol(rol_id) on delete cascade on update cascade;

/*tbl_programaformacion*/

alter table tbl_programaformacion
add foreign key (pfo_estid)
references tbl_estado(est_id) on delete cascade on update cascade;

alter table tbl_programaformacion
add foreign key (pfo_tprid)
references tbl_tipoprograma(tpr_id) on delete cascade on update cascade;

/*tbl_login*/

alter table tbl_login
add foreign key (log_usunumdnt)
references tbl_usuario(usu_numdnt) on delete cascade on update cascade;

alter table tbl_login
add foreign key (log_ficcodigo)
references tbl_ficha(fic_codigo) on delete cascade on update cascade;


INSERT INTO tbl_estado (est_nombre)
VALUES ('Activo'),('Inactivo');

INSERT INTO tbl_fases (fas_nombre)
VALUES ('Análisis'),('Planeación'),('Ejecución'),('Evaluación');

INSERT INTO tbl_modalidad (mod_nombre)
VALUES ('Presencial'),('Virtual');

INSERT INTO tbl_rol (rol_nombre)
VALUES ('Administrador'),('Instructor'),('Aprendiz');

INSERT INTO tbl_tipoid (tip_idntfc)
VALUES ('C.C'),('C.E'),('T.I');

INSERT INTO tbl_tipojornada (tij_nombre)
VALUES ('Diurna'),('Nocturna'),('Mixta');

INSERT INTO tbl_tipooferta (tof_nombre)
VALUES ('Abierta'),('Cerrada');


INSERT INTO tbl_tipoprograma (tpr_nombre)
VALUES ('Técnico'),('Tecnólogo'),('Especialización');

INSERT INTO `tbl_programaformacion` (`pfo_id`, `pfo_versn`, `pfo_duracn`, `pfo_abrvtr`, `pfo_nompro`, `pfo_estid`, `pfo_tprid`) 
VALUES (NULL, 'ref435123', '2 años', 'tadsi', 'tecnología en análisis de sistemas', '1', '2');

INSERT INTO `tbl_ficha` (`fic_codigo`, `fic_feccrn`, `fic_fecfn`, `fic_tijid`, `fic_modid`, `fic_tofid`, `fic_pfoid`) 
VALUES ('1907036', '2020-11-24', '2020-11-28', '1', '1', '1', '1');

INSERT INTO `tbl_usuario` ( `usu_nombre`, `usu_aplldo`,`usu_numdnt`, `usu_passwd`, `usu_correo`, `usu_ficcodigo`, `usu_rolid`, `usu_estid`, `usu_tipid`) 
VALUES ('Kevin Alexander', 'Garcia Romero','1004345279', '1234', 'nivekalexander.12@gmail.com', '1907036', '1', '1', '1'),
('Franklin', 'German Quihuang', '100764321', '1234', 'quihuang2017@gmail.com', '1907036', '1', '1', '1'), 
('Víctor Alfonso', 'Zapata Ocampo', '1001234567', '1234', 'victor.zapata8069@gmail.com', '1907036', '1', '1', '1'),
('Camilo', 'Carabali Balanta', '1003214567', '1234', 'valanya39@gmail.com', '1907036', '1', '1', '1');

INSERT INTO `tbl_anuncio` (`anu_id`, `anu_titulo`, `anu_descrp`, `anu_feccrn`, `anu_fecfn`, `anu_ficcodigo`, `anu_usunumdnt`) 
VALUES (NULL, 'el queso es barato', 'este es un anuncio para informar lo barato que es el queso', '2020-11-24', '2020-11-30', '1907036', '1004345279');

INSERT INTO `tbl_anuncio` (`anu_id`, `anu_titulo`, `anu_descrp`, `anu_feccrn`, `anu_fecfn`, `anu_ficcodigo`, `anu_usunumdnt`) 
VALUES (NULL, 'Las palomas vuelan', 'Las palomas solo saben volar,ates corrian pero la evolucion les dio alas', '2020-11-24', '2020-11-30', '1907036', '1001234567');

DELIMITER //
CREATE PROCEDURE `LOGIN`(IN `USER` CHAR(50), IN `PASS` CHAR(50)) 
BEGIN 

        DECLARE USU CHAR(50);
                DECLARE ROL	CHAR(50);
                DECLARE FIC	CHAR(50);
                DECLARE IDUSU INT(10);
                DECLARE IDFIC INT(10);
                DECLARE CON INT unsigned;

                SELECT usu_correo, usu_rolid , usu_ficcodigo ,usu_numdnt  ,fic_codigo  INTO @USU,@ROL,@FIC,@IDUSU,@IDFIC FROM tbl_usuario
                    
                    INNER JOIN tbl_ficha on usu_ficcodigo=fic_codigo

                WHERE usu_correo=USER and usu_passwd=PASS;

                SELECT COUNT(log_id) INTO @CON FROM tbl_login WHERE log_ficcodigo=@IDFIC;

                IF @CON<6 AND @IDUSU>0 THEN
                    INSERT INTO tbl_login (log_usunumdnt,log_ficcodigo) values (@IDUSU,@IDFIC);
                    SET @RES="SI";
                ELSE
                    SET @RES="NO";
                END IF;

                SELECT @USU AS 'User',@FIC AS 'Ficha',@RES  AS 'Login',@ROL AS 'Rol',@IDUSU AS 'Idusu';

END //
DELIMITER ;


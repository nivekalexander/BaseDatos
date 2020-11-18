CREATE TABLE tbl_fases_material_apoyo(
    fma_id	   Int(10) auto_increment PRIMARY KEY,
    fma_nombre Varchar(45) NOT NULL
);

CREATE TABLE tbl_material_apoyo(
    map_id	    Int(10) auto_increment PRIMARY KEY,
    map_titulo	Varchar(45) NOT NULL,
    map_fchpub	Date NOT NULL,	
    map_descrp	Varchar(255) NULL,
    map_fmaid	Int(10) NOT NULL
);

CREATE TABLE tbl_material_apoyo_ficha(
    maf_id	  Int(10) auto_increment PRIMARY KEY,
    maf_mapid Int(10) NOT NULL,
    maf_ficid Int(10) NOT NULL
);

CREATE TABLE tbl_ficha(
  	fic_id 	 		int(10) NOT NULL AUTO_INCREMENT,
  	fic_codigo		VARCHAR(60) NOT NULL,
  	fic_progrm		VARCHAR(60) NOT NULL,
  	fic_abrvtr		VARCHAR(10) NOT NULL,
	fic_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	fic_fchupd		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,	
    fic_tjfid       int(10) NOT NULL,
    fic_mfiid       int(10) NOT NULL,
    fic_tofid       int(10) NOT NULL,
    fic_pfoid       int(10) NOT NULL,
	PRIMARY KEY 	(fic_id)
 );

CREATE TABLE tbl_tipo_jornada_ficha(
    tjf_id     Int(10) auto_increment PRIMARY KEY,
    tjf_nombre Varchar(45) NOT NULL
);

CREATE TABLE tbl_modalidad_ficha(
    mfi_id	    Int(10) auto_increment PRIMARY KEY,
    mfi_nombre	Varchar(45) NOT NULL
);

CREATE TABLE tbl_tipo_oferta_ficha(
    tof_id	     Int(10) auto_increment PRIMARY KEY,
    tof_nombre   Varchar(45) NOT NULL
);

CREATE TABLE tbl_horario(
    hor_id	Int(10) auto_increment PRIMARY KEY,
    hor_triini	Date NOT NULL,		
    hor_trifin	Date NOT NULL,
    hor_trinum	Int(10) NOT NULL,
    hor_ficid	Int(10) NOT NULL
);

CREATE TABLE tbl_anuncio(
    anu_id	    Int(10) auto_increment PRIMARY KEY,
    anu_titulo	Varchar(45) NOT NULL,
    anu_descrp	Varchar(255) NULL,
    anu_fchcrt	Date NOT NULL,	
    anu_fchfin	Date NOT NULL,
    anu_ficid	Int(10) NOT NULL,
    anu_usuid	Int(10) NOT NULL
);

/* AÑADIR LLAVES FORANEAS (HACER DESPUES DE CREAR TODAS LAS TABLAS) */ 

ALTER TABLE tbl_material_apoyo
ADD FOREIGN KEY(map_fmaid)
REFERENCES tbl_fases_material_apoyo(fma_id);

ALTER TABLE tbl_material_apoyo_ficha
ADD FOREIGN KEY(maf_mapid)
REFERENCES tbl_material_apoyo(map_id);

ALTER TABLE tbl_material_apoyo_ficha
ADD FOREIGN KEY(maf_ficid)
REFERENCES tbl_ficha(fic_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_pfoid)
REFERENCES tbl_programa_formacion(pfo_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_tjfid)
REFERENCES tbl_tipo_jornada_ficha(tjf_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_mfiid)
REFERENCES tbl_modalidad_ficha(mfi_id);

ALTER TABLE tbl_ficha
ADD FOREIGN KEY(fic_tofid)
REFERENCES tbl_tipo_oferta_ficha(tof_id);

ALTER TABLE tbl_horario
ADD FOREIGN KEY(hor_ficid)
REFERENCES tbl_ficha(fic_id);

ALTER TABLE tbl_anuncio
ADD FOREIGN KEY(anu_ficid)
REFERENCES tbl_ficha(fic_id);

ALTER TABLE tbl_anuncio
ADD FOREIGN KEY(anu_usuid)
REFERENCES tbl_usuario(usu_id);
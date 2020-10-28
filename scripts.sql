CREATE TABLE TblFases_MaterialApoyo(
    IdFases	Int(5) auto_increment PRIMARY KEY,
    FasNombre Varchar(45) NOT NULL
);

CREATE TABLE TblMaterialApoyo(
    IdMaterialApoyo	Int(5) auto_increment PRIMARY KEY,
    MatApoTitulo	Varchar(45) NOT NULL,
    MatApoFechaPublicacion	Date NOT NULL,	
    MatApoDescripcion	Varchar(255) NULL,
    TblFases_MaterialApoyo_idFases	Int(5) NOT NULL
);

CREATE TABLE TblMaterialApoyo_Ficha(
    IdMatApoFic	Int(5) auto_increment PRIMARY KEY,
    TblMaterialApoyo_idMaterialApoyo Int(5) NOT NULL,
    TblFicha_idFicha Int(5) NOT NULL
);

CREATE TABLE TblFicha(
    IdFicha	Int(5) auto_increment PRIMARY KEY,
    FicFechaInicio	Date NOT NULL,	
    FicFechaFin	Date NOT NULL,	
    FicNumeroFicha	Varchar(45) NOT NULL,
    TblTipoJornada_Ficha_idTipJor Int(5) NOT NULL,
    TblModalidad_Ficha_idMod Int(5) NOT NULL,
    TblTipoOferta_Ficha_idTipOfe Int(5) NOT NULL
);

CREATE TABLE TblTipoJornada_Ficha(
    IdTipJor Int(5) auto_increment PRIMARY KEY,
    TipJorNombre Varchar(45) NOT NULL
);

CREATE TABLE TblModalidad_Ficha(
    IdMod	Int(5) auto_increment PRIMARY KEY,
    ModNombre	Varchar(45) NOT NULL
);

CREATE TABLE TblTipoOferta_Ficha(
    IdTipOfe	Int(5) auto_increment PRIMARY KEY,
    TipOfeNombre	Varchar(45) NOT NULL
);

CREATE TABLE TblHorario(
    IdHorario	Int(5) auto_increment PRIMARY KEY,
    HorTrimestreInicio	Date NOT NULL,		
    HorTrimestreFin	Date NOT NULL,
    HorTrimestreNum	Int(5) NOT NULL,
    TblFicha_idFicha	Int(5) NOT NULL
);

CREATE TABLE TblAnuncio(
    IdAnu	Int(5) auto_increment PRIMARY KEY,
    AnuTitulo	Varchar(45) NOT NULL,
    AnuDescripcion	Varchar(255) NULL,
    AnuFechaCreacion	Date NOT NULL,	
    AnuFechaFIn	Date	NOT NULL,
    TblDisponibilidad_idDis	Int(5) NOT NULL,
    TblFicha_idFicha4	Int(5) NOT NULL,
    TblUsuario_idUsu	Int(15) NOT NULL
);

CREATE TABLE TblDisponibilidad(
    IdDis	Int(5) auto_increment PRIMARY KEY,
    DisTipo	Varchar(45) NOT NULL
);

/* AÑADIR LLAVES FORANEAS (HACER DESPUES DE CREAR TODAS LAS TABLAS) */ 

ALTER TABLE TblMaterialApoyo
ADD FOREIGN KEY(TblFases_MaterialApoyo_idFases)
REFERENCES TblFases_MaterialApoyo(IdFases);

ALTER TABLE TblMaterialApoyo_Ficha
ADD FOREIGN KEY(TblMaterialApoyo_idMaterialApoyo)
REFERENCES TblMaterialApoyo(IdMaterialApoyo);

ALTER TABLE TblMaterialApoyo_Ficha
ADD FOREIGN KEY(TblFicha_idFicha)
REFERENCES TblFicha(IdFicha);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblTipoJornada_Ficha_idTipJor)
REFERENCES TblTipoJornada_Ficha(IdTipJor);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblModalidad_Ficha_idMod)
REFERENCES TblModalidad_Ficha(IdMod);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblTipoOferta_Ficha_idTipOfe)
REFERENCES TblTipoOferta_Ficha(IdTipOfe);

ALTER TABLE TblHorario
ADD FOREIGN KEY(TblFicha_idFicha)
REFERENCES TblFicha(IdFicha);

ALTER TABLE TblAnuncio
ADD FOREIGN KEY(TblDisponibilidad_idDis)
REFERENCES TblDisponibilidad(IdDis);

ALTER TABLE TblAnuncio
ADD FOREIGN KEY(TblFicha_idFicha)
REFERENCES TblFicha(IdFicha);

ALTER TABLE TblAnuncio
ADD FOREIGN KEY(TblUsuario_idUsu)
REFERENCES TblUsuario(IdUsu);
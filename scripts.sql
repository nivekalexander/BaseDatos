CREATE TABLE TblFases_TblMaterialApoyo(
    IdFases	Int(5) auto_increment PRIMARY KEY,
    FasNombre Varchar(45) NOT NULL
);

CREATE TABLE TblMaterialApoyo(
    IdMaterialApoyo	Int(5) auto_increment PRIMARY KEY,
    MatApoTitulo	Varchar(45) NOT NULL,
    MatApoFechaPublicacion	Date NOT NULL,	
    MatApoDescripcion	Varchar(255) NULL,
    TblFases_TblMaterialApoyo_IdFases	Int(5) NOT NULL
);

CREATE TABLE TblMaterialApoyo_Ficha(
    IdMatApoFic	Int(5) auto_increment PRIMARY KEY,
    TblMaterialApoyo_IdMaterialApoyo Int(5) NOT NULL,
    TblFicha_IdFicha Int(5) NOT NULL
);

CREATE TABLE TblFicha(
    IdFicha	Int(5) auto_increment PRIMARY KEY,
    FicFechaInicio	Date NOT NULL,	
    FicFechaFin	Date NOT NULL,	
    FicNumeroFicha	Varchar(45) NOT NULL,
    TblProgramaFormacion_IdProFor Int(5) NOT NULL,
    TblTipoJornada_TblFicha_IdTipJor Int(5) NOT NULL,
    TblModalidad_TblFicha_IdMod Int(5) NOT NULL,
    TblTipoOferta_TblFicha_IdTipOfe Int(5) NOT NULL
);

CREATE TABLE TblTipoJornada_TblFicha(
    IdTipJor Int(5) auto_increment PRIMARY KEY,
    TipJorNombre Varchar(45) NOT NULL
);

CREATE TABLE TblModalidad_TblFicha(
    IdMod	Int(5) auto_increment PRIMARY KEY,
    ModNombre	Varchar(45) NOT NULL
);

CREATE TABLE TblTipoOferta_TblFicha(
    IdTipOfe	Int(5) auto_increment PRIMARY KEY,
    TipOfeNombre	Varchar(45) NOT NULL
);

CREATE TABLE TblHorario(
    IdHorario	Int(5) auto_increment PRIMARY KEY,
    HorTrimestreInicio	Date NOT NULL,		
    HorTrimestreFin	Date NOT NULL,
    HorTrimestreNum	Int(5) NOT NULL,
    TblFicha_IdFicha	Int(5) NOT NULL
);

CREATE TABLE TblAnuncio(
    IdAnu	Int(5) auto_increment PRIMARY KEY,
    AnuTitulo	Varchar(45) NOT NULL,
    AnuDescripcion	Varchar(255) NULL,
    AnuFechaCreacion	Date NOT NULL,	
    AnuFechaFIn	Date	NOT NULL,
    TblDisponibilidad_IdDis	Int(5) NOT NULL,
    TblFicha_IdFicha	Int(5) NOT NULL,
    TblUsuario_UsuNumeroID	Int(15) NOT NULL
);

CREATE TABLE TblDisponibilidad(
    IdDis	Int(5) auto_increment PRIMARY KEY,
    DisTipo	Varchar(45) NOT NULL
);

/* AÑADIR LLAVES FORANEAS (HACER DESPUES DE CREAR TODAS LAS TABLAS) */ 

ALTER TABLE TblMaterialApoyo
ADD FOREIGN KEY(TblFases_TblMaterialApoyo_IdFases)
REFERENCES TblFases_TblMaterialApoyo(IdFases);

ALTER TABLE TblMaterialApoyo_TblFicha
ADD FOREIGN KEY(TblMaterialApoyo_IdMaterialApoyo)
REFERENCES TblMaterialApoyo(IdMaterialApoyo);

ALTER TABLE TblMaterialApoyo_TblFicha
ADD FOREIGN KEY(TblFicha_IdFicha)
REFERENCES TblFicha(IdFicha);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblProgramaFormacion_IdProFor)
REFERENCES TblProgramaFormacion(IdProFor);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblTipoJornada_TblFicha_IdTipJor)
REFERENCES TblTipoJornada_TblFicha(IdTipJor);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblModalidad_TblFicha_IdMod)
REFERENCES TblModalidad_TblFicha(IdMod);

ALTER TABLE TblFicha
ADD FOREIGN KEY(TblTipoOferta_TblFicha_IdTipOfe)
REFERENCES TblTipoOferta_TblFicha(IdTipOfe);

ALTER TABLE TblHorario
ADD FOREIGN KEY(TblFicha_IdFicha)
REFERENCES TblFicha(IdFicha);

ALTER TABLE TblAnuncio
ADD FOREIGN KEY(TblDisponibilidad_IdDis)
REFERENCES TblDisponibilidad(IdDis);

ALTER TABLE TblAnuncio
ADD FOREIGN KEY(TblFicha_IdFicha)
REFERENCES TblFicha(IdFicha);

ALTER TABLE TblAnuncio
ADD FOREIGN KEY(TblUsuario_UsuNumeroID)
REFERENCES TblUsuario(UsuNumeroID);
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
)
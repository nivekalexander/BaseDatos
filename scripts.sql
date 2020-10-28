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
)
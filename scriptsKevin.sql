create table TblForo(
IdForo int(5) auto_increment primary key,
ForTitulo varchar(45) not null,
ForFechaFin date,
ForFechaInicio date,
ForDescripcion varchar(600) not null,
TblFicha_IdFicha int(5)not null,
TblDisponibilidad_IdDis int(5)not null
);



create table TblParticipacionForo(

IdParFor int (5) auto_increment primary key,
ParForRespuesta varchar(45) no null,
ParForFecha date,
ParForParticipante varchar(45),
TblForo_IdForo int(5)

);



create table TblUsuario(

    UsuNumeroID int(15) not null primary key,
    UsuFechaCreación date,
    UsuNombre1 varchar(45) not null,
    UsuNombre2 varchar(45) not null,
    UsuApellido1 varchar(45) not null,
    UsuApellido2 varchar(45) not null,
    UsuClave varchar(75) not null,
    TblEstado_IdEst int(5) not null,
    TblRol_IdRol int(5) not null,
    TblTelefono_TblUsuario_IdTel int(5) not null,
    TblTipDocUsu_TblUsuario_IdTipDoc int(5) not null

);


create table TblTipDocUsu_TblUsuario(
    IdTipDoc int(5) auto_increment,
    TipDocIdentificacion varchar(30) not null

);
create table TblTelefono_TblUsuario(

    IdTel int(5) auto_increment,
    TelUsuario varchar(30) not null

);

create table TblRol(

    IdRol int(5) auto_increment,
    RolNombre varchar(30)not null

);

create table TblEstado(

    IdEst int(5) auto_increment,
    EstNombre varchar(30) not null

);
create table TblAprendizFicha(

    IdAprFic int(5) auto_increment,
    IdAprFicClave varchar(45) not null,
    TblFicha_IdFicha int(5)not null,
    TblEstado_IdEst int(5)not null,
    TblAcceso_IdAcc int(5)not null,
    TblRol_IdRol int(5)not null
);



create table TblAcceso(

    IdAcc  int(5) auto_increment,
    AccIngresos int(10) not null

);

create table TblProgramaFormacion(

    IdProFor int(5) auto_increment,
    ProForVersion varchar(45) not null,
    ProForDuracion varchar(45) not null,
    ProForCodPrograma varchar(45) not null,
    ProForNomPrograma varchar(45) not null,
    TblEstado_IdEst int(5)not null,
    TblTipoPrograma_TblProgramaFormacion_IdTipPrograma int(5) not null

);


create table TblTipoPrograma_TblProgramaFormacion(

    IdTipPrograma int(5) auto_increment
    TipPrograma varchar(45) not null

);


/*TblForo*/

alter table TblForo
add foreign key (TblDisponibilidad_IdDis)
references TblDisponibilidad(IdDis);
 
alter table TblForo
add foreign key (TblFicha_IdFicha)
references TblFicha(IdFicha);

/*TblParticipacionForo*/

alter table TblParticipacionForo
add foreign key (TblForo_IdForo)
references TblForo(IdForo);

/*TblUsuario*/

alter table TblUsuario
add foreign key (TblEstado_IdEst)
references TblEstado(IdEst);

alter table TblUsuario
add foreign key (TblRol_IdRol)
references TblRol(IdRol);

alter table TblUsuario
add foreign key (TblTelefono_TblUsuario_IdTel)
references TblTelefono_TblUsuario(IdTel);

alter table TblUsuario
add foreign key (TblTipDocUsu_TblUsuario_IdTipDoc)
references TblTipDocUsu_TblUsuario(IdTipDoc);

/*TblAprendizFicha*/

alter table TblAprendizFicha
add foreign key (TblFicha_IdFicha)
references TblFicha(IdFicha);

alter table TblAprendizFicha
add foreign key (TblEstado_IdEst)
references TblEstado(IdEst);

alter table TblAprendizFicha
add foreign key (TblAcceso_IdAcc)
references TblAcceso(IdAcc);

alter table TblAprendizFicha
add foreign key (TblRol_IdRol)
references TblRol(IdRol);

/*TblProgramaFormacion*/

alter table TblProgramaFormacion
add foreign key (TblEstado_IdEst)
references TblEstado(IdEst);

alter table TblProgramaFormacion
add foreign key (TblTipoPrograma_TblProgramaFormacion_IdTipPrograma)
references TblTipoPrograma_TblProgramaFormacion(IdTipPrograma);

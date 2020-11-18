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



CREATE TABLE tbl_usuario
  (
  	usu_id 	 		int(10) NOT NULL AUTO_INCREMENT,
	usu_usuari		varchar(60) NOT NULL,
	usu_passwd		varchar(32) NOT NULL,
	usu_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	usu_fchupd		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	usu_ficid		int(10) NOT NULL,
	usu_perid		int(10) NOT NULL,
	PRIMARY KEY 	(usu_id)
  );

CREATE TABLE tbl_persona
  (	
	per_id 	 		int(10) NOT NULL AUTO_INCREMENT,
	per_nombre		varchar(60) NOT NULL,
	per_aplldo		varchar(60) NOT NULL,
	per_fchnac		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	per_dirccn		varchar(99) NOT NULL,
	per_correo		varchar(99) NOT NULL,
	per_telfno		varchar(20) NOT NULL,
	per_fchcrt		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	per_fchupd		TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	per_areid		int(10) NOT NULL,
	PRIMARY KEY 	(per_id)
  );


create table TblTipDocUsu_TblUsuario(
    IdTipDoc int(5) auto_increment primary key,
    TipDocIdentificacion varchar(30) not null

);
create table TblTelefono_TblUsuario(

    IdTel int(5) auto_increment primary key,
    TelUsuario varchar(30) not null

);

create table TblRol(

    IdRol int(5) auto_increment primary key,
    RolNombre varchar(30)not null

);

create table TblEstado(

    IdEst int(5) auto_increment primary key,
    EstNombre varchar(30) not null

);
create table TblAprendizFicha(

    IdAprFic int(5) auto_increment primary key,
    IdAprFicClave varchar(45) not null,
    TblFicha_IdFicha int(5)not null,
    TblEstado_IdEst int(5)not null,
    TblAcceso_IdAcc int(5)not null,
    TblRol_IdRol int(5)not null
);



create table TblAcceso(

    IdAcc  int(5) auto_increment primary key,
    AccIngresos int(10) not null

);

create table tbl_programa_formacion(

    pfo_id int(5) auto_increment primary key,
    ProForVersion varchar(45) not null,
    ProForDuracion varchar(45) not null,
    ProForCodPrograma varchar(45) not null,
    ProForNomPrograma varchar(45) not null,
    TblEstado_IdEst int(5)not null,
    TblTipoPrograma_TblProgramaFormacion_IdTipPrograma int(5) not null

);


create table TblTipoPrograma_TblProgramaFormacion(

    IdTipPrograma int(5) auto_increment primary key,
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

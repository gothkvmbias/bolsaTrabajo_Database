CREATE DATABASE SSBolsa
GO
USE SSBolsa
GO

CREATE TABLE Solicitante(
	Sol_ID			int						PRIMARY KEY		IDENTITY(1,1),
	Sol_Nombre		varchar(90),
	Sol_Edad		int,
	Sol_Telefono	varchar(15), --int
	Sol_Ciudad		varchar(30),
	Sol_Estado		varchar(35),
	Sol_Colonia		varchar(45),			
	Sol_Escolaridad	varchar(40)		NULL,	--filtrado de la escolaridad definido por niveles
	Sol_EsEscuela	varchar(40)		NULL,	--filtrado de la escuela definido por nombres (para que usen todos el mismo nombre) (?
	Sol_Tattoo		bit,
	Sol_TatUb		varchar(100)	NULL,	--si se va a poner directamente la ubicación o se pondrá un filtrado en alguna tabla (?
	Sol_EstCiv		varchar(30),
	Sol_Hijos		int,
	--no se que tan necesario sera tener en cuenta la edad de los hijos, en ese caso se debe crear una tabla HIJOS para almacenar los posibles hijos que tenga el solicitante
	Sol_Deudas			bit,
	Sol_Enfermedades	bit,
	Sol_EnEspecif		varchar(100)	NULL,	--lo mismo, si filtraremos enfermedades o usaremos una descripcion simple CAMPO EXTRA
	Sol_Infonavit		varchar(20),
	Sol_SS				bit,
	Sol_NSSS			int				NULL,	--CAMPO EXTRA
	Sol_Fonacot			bit,
	Sol_Propiedad		varchar(20),
	Sol_Licencia		bit,
	Sol_TipoLic			varchar(10)		NULL,
	Sol_Auto			bit,
	Sol_Manejo			varchar(15),
	Sol_Motocicleta		bit,
	Sol_OtroVehi		varchar(30)		NULL,	--lo mismo, si sera filtrado por diferentes vehiculos
);

CREATE TABLE Experiencia(
	Exp_Folio		int					PRIMARY KEY		IDENTITY(1,1),
	ExpSector		varchar(50),			--filtrado de los sectores de trabajo
	ExpEmpresa		varchar(50),			--empresas filtradas
	ExpArea			varchar(30),			--filtrado de las areas
	Puesto			varchar(40),			--filtrado de los puestos
	ExpTiempo		int,					--en años, supongo

	--creo que estos campos de aqui van separados, pero depende si se van a contar diferentes lugares de experiencia o todo se contara en un mismo bloque de texto.
	ExpMaquinaria	varchar(50)		NULL,	--una descripcion o un filtrado de la maquinaria (?
	ExpSoftware		varchar(60)		NULL,	--lo mismo de arriba
);

CREATE TABLE Sol_Idiomas(
	SI_Sol_ID		int,
	SI_Idioma		varchar(30),
	SI_Porcentaje	int,

	FOREIGN KEY	(SI_Sol_ID)		REFERENCES	Solicitante(Sol_ID)
);

CREATE TABLE Sol_Experiencia(
	SE_Sol_ID		int,
	SE_Exp			int,

	FOREIGN KEY	(SE_Sol_ID)		REFERENCES	Solicitante(Sol_ID),
	FOREIGN KEY	(SE_Exp)		REFERENCES	Experiencia(Exp_Folio)
);



SET ECHO ON

drop table CATEGORIE cascade constraints ;
drop table PLANTE cascade constraints ;
drop table UTILISATEUR cascade constraints ;
drop table DATE_ cascade constraints ;
drop table INFO cascade constraints ;
drop table ACTUELLE_PLANTE cascade constraints ;

-- ============================================================
--   Table : CATEGORIE                                            
-- ============================================================
create table CATEGORIE
(
    ID_CATEGORIE        	INTEGER                not null,
    NOM_CATEGORIE       	VARCHAR2(20)           not null,	
    constraint PK_CATEGORIE primary key (ID_CATEGORIE)
)
;
-- ============================================================
--   Table : PLANTE                                              
-- ============================================================
create table PLANTE
(
    ID_PLANTE           	INTEGER                not null,
    NOM_PLANTE          	VARCHAR(20)	       not null,
    ID_CATEGORIE        	INTEGER                not null,
    DESCRIPTION_PLANTE  	VARCHAR(100)           not null,
    TMPERATURE_PLANTE   	NUMBER(2)              not null,
    HUMIDITE_PLANTE     	NUMBER(3)              not null,
    LUMINOSITE_PLANTE   	NUMBER(3)              not null,
    FLORAISON_PLANTE    	VARCHAR2(20)           not null,
    constraint PK_PLANTE primary key (ID_PLANTE)
)
;
-- ============================================================
--   Table : UTILISATEUR                                              
-- ============================================================
create table UTILISATEUR
(
    ID_UTILISATEUR              INTEGER                not null,
    PRENOM_UTILISATEUR          VARCHAR(20)            not null,
    NOM_UTILISATEUR             VARCHAR(20)            not null,
    constraint PK_UTILISATEUR primary key (ID_UTILISATEUR)
)
;
-- ============================================================
--   Table : DATE_                                              
-- ============================================================
create table DATE_
(
    ID_DATE      	        INTEGER                not null,
    JOUR         	        DATE                   not null,
    constraint PK_DATE_ primary key (ID_DATE)
)
;
-- ============================================================
--   Table : INFO                                              
-- ============================================================
create table INFO
(
    ID_INFO          	    	INTEGER                not null,
    TEMPERATURE     	   	    NUMBER(2)              not null,
    HUMIDITE_PLANTE  	        NUMBER(3)              not null,
    constraint PK_INFO primary key (ID_INFO)
)
;
-- ============================================================
--   Table : ACTUELLE_PLANTE                                              
-- ============================================================
create table ACTUELLE_PLANTE
(
    ID_UTILISATEUR              INTEGER                not null,
    ID_PLANTE           	    INTEGER                not null,
    ID_INFO          	    	INTEGER                not null,
    ID_DATE          	    	INTEGER                not null,
    constraint PK_ACTUELLE_PLANTE primary key (ID_UTILISATEUR,ID_PLANTE,ID_INFO,ID_DATE)
)
;

alter table PLANTE
    add constraint FK_PLANTE foreign key  (ID_CATEGORIE)
       references CATEGORIE (ID_CATEGORIE)
/
alter table ACTUELLE_PLANTE
    add constraint FK_ACTUELLE_PLANTE foreign key  (ID_UTILISATEUR)
       references UTILISATEUR (ID_UTILISATEUR)
/
alter table ACTUELLE_PLANTE
    add constraint FK_ACTUELLE_PLANTE2 foreign key  (ID_PLANTE)
       references PLANTE (ID_PLANTE)
/
alter table ACTUELLE_PLANTE
    add constraint FK_ACTUELLE_PLANTE3 foreign key  (ID_INFO)
       references INFO (ID_INFO)
/
alter table ACTUELLE_PLANTE
    add constraint FK_ACTUELLE_PLANTE4 foreign key  (ID_DATE)
       references DATE_ (ID_DATE)
/


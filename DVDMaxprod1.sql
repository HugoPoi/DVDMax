-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 9.1.5              
-- * Generator date: Feb 14 2012              
-- * Generation date: Thu Feb 14 14:46:25 2013 
-- * LUN file: C:\Users\Hugo\Documents\ESGI\Conception BDD\Projet_DVDMax\DVDMAXmcd1.lun 
-- * Schema: dvdmax/1 
-- ********************************************* 


-- Database Section
-- ________________ 

create database dvdmax;
use dvdmax;


-- Tables Section
-- _____________ 

create table adresse (
     ID_adr int not null auto_increment,
     ID_cli int,
     adresse varchar(1000) not null,
     ville varchar(250) not null,
     cp varchar(5) not null,
     pays varchar(250) not null,
     numtel varchar(250) not null,
     constraint ID_ID primary key (ID_adr),
     constraint FKlivrerclient_ID unique (ID_cli));

create table boutique (
     ID_bou int not null auto_increment,
     ID_adr int not null,
     nom varchar(250) not null,
     email varchar(350) not null,
     constraint ID_ID primary key (ID_bou),
     constraint FKboutique_adresse_ID unique (ID_adr));

create table categorie (
     ID_cat int not null auto_increment,
     libelle varchar(250) not null,
     description varchar(2000) not null,
     constraint ID_ID primary key (ID_cat));

create table categorie_event (
     ID_cat int not null,
     ID_eve int not null,
     constraint ID_categorie_event_ID primary key (ID_eve, ID_cat));

create table categorie_film (
     ID_cat int not null,
     ID_fil int not null,
     constraint ID_categorie_film_ID primary key (ID_fil, ID_cat));

create table client (
     ID_cli int not null auto_increment,
     ID_adr int,
     nom varchar(250) not null,
     prenom varchar(250) not null,
     birthdate date not null,
     email varchar(350) not null,
     date_inscrit date not null,
     constraint ID_ID primary key (ID_cli),
     constraint FKfacturerclient_ID unique (ID_adr));

create table commande (
     ID_com int not null auto_increment,
     etat varchar(250) not null,
     date_commande date not null,
     num_transporteur varchar(350) not null,
     ID_cli int not null,
     ID_tra int not null,
     constraint ID_ID primary key (ID_com));

create table detail_commande (
     quantite int not null,
     ID_pro int not null,
     ID_com int not null);

create table distribuer (
     ID_dis int not null,
     ID_fil int not null,
     constraint ID_distribuer_ID primary key (ID_fil, ID_dis));

create table distributeur (
     ID_dis int not null auto_increment,
     nom varchar(250) not null,
     constraint ID_ID primary key (ID_dis));

create table event (
     ID_eve int not null auto_increment,
     nom varchar(250) not null,
     date date not null,
     description varchar(2000) not null,
     constraint ID_ID primary key (ID_eve));

create table event_personne (
     ID_eve int not null,
     ID_per int not null,
     constraint ID_event_personne_ID primary key (ID_per, ID_eve));

create table facture (
     ID_com int not null,
     date_facture date not null,
     montant float(1) not null,
     constraint FKfacturer_ID primary key (ID_com));

create table fidelite (
     ID_fid int not null auto_increment,
     minpurchase float(1) not null,
     minperiod int not null,
     discountpercent float(1) not null,
     datedebut date not null,
     datefin date not null,
     constraint ID_ID primary key (ID_fid));

create table fidelite_client (
     ID_cli int not null,
     ID_fid int not null,
     constraint ID_fidelite_client_ID primary key (ID_fid, ID_cli));

create table film (
     ID_fil int not null auto_increment,
     titre varchar(350) not null,
     date_sortie date not null,
     duree float(1) not null,
     constraint ID_ID primary key (ID_fil));

create table jouer (
     ID_fil int not null,
     ID_per int not null,
     constraint ID_jouer_ID primary key (ID_fil, ID_per));

create table mot_cle (
     ID_mot int not null auto_increment,
     motcle varchar(250) not null,
     constraint ID_ID primary key (ID_mot));

create table motcle_identifier (
     ID_fil int not null,
     ID_mot int not null,
     constraint ID_motcle_identifier_ID primary key (ID_fil, ID_mot));

create table newsletter (
     ID_new int not null auto_increment,
     libelle char(1) not null,
     description varchar(2000) not null,
     constraint ID_ID primary key (ID_new));

create table offrepromo (
     ID_off int not null auto_increment,
     datedebut date not null,
     datefin date not null,
     libelle varchar(250) not null,
     pourcentage float(1) not null,
     constraint ID_ID primary key (ID_off));

create table personne (
     ID_per int not null auto_increment,
     nom varchar(250) not null,
     prenom varchar(250) not null,
     datenaissance date not null,
     constraint ID_ID primary key (ID_per));

create table produire (
     ID_fil int not null,
     ID_per int not null,
     constraint ID_produire_ID primary key (ID_fil, ID_per));

create table produit (
     ID_pro int not null auto_increment,
     price float(1) not null,
     stock int not null,
     ID_sup int not null,
     ID_off int not null,
     ID_fil int not null,
     constraint ID_ID primary key (ID_pro));

create table realiser (
     ID_fil int not null,
     ID_per int not null,
     constraint ID_realiser_ID primary key (ID_fil, ID_per));

create table s_inscrire (
     ID_cli int not null,
     ID_new int not null,
     constraint ID_s_inscrire_ID primary key (ID_new, ID_cli));

create table se_produire (
     ID_bou int not null,
     ID_eve int not null,
     constraint ID_se_produire_ID primary key (ID_eve, ID_bou));

create table support (
     ID_sup int not null auto_increment,
     libelle char(1) not null,
     constraint ID_ID primary key (ID_sup));

create table theme_newsletter (
     ID_cat int not null,
     ID_new int not null,
     constraint ID_theme_newsletter_ID primary key (ID_cat, ID_new));

create table transporteur (
     ID_tra int not null auto_increment,
     ID_adr int not null,
     nom varchar(250) not null,
     email varchar(250) not null,
     constraint ID_ID primary key (ID_tra),
     constraint FKtransp_adresse_ID unique (ID_adr));


-- Constraints Section
-- ___________________ 

alter table adresse add constraint FKlivrerclient_FK
     foreign key (ID_cli)
     references client (ID_cli);

-- Not implemented
-- alter table boutique add constraint ID_CHK
--     check(exists(select * from se_produire
--                  where se_produire.ID_bou = ID_bou)); 

alter table boutique add constraint FKboutique_adresse_FK
     foreign key (ID_adr)
     references adresse (ID_adr);

alter table categorie_event add constraint FKcat_eve
     foreign key (ID_eve)
     references event (ID_eve);

alter table categorie_event add constraint FKcat_cat_1_FK
     foreign key (ID_cat)
     references categorie (ID_cat);

alter table categorie_film add constraint FKcat_fil
     foreign key (ID_fil)
     references film (ID_fil);

alter table categorie_film add constraint FKcat_cat_FK
     foreign key (ID_cat)
     references categorie (ID_cat);

alter table client add constraint FKfacturerclient_FK
     foreign key (ID_adr)
     references adresse (ID_adr);

-- Not implemented
-- alter table commande add constraint ID_CHK
--     check(exists(select * from detail_commande
--                  where detail_commande.ID_com = ID_com)); 

alter table commande add constraint FKpasser_commande_FK
     foreign key (ID_cli)
     references client (ID_cli);

alter table commande add constraint FKlivrer_commande_FK
     foreign key (ID_tra)
     references transporteur (ID_tra);

alter table detail_commande add constraint FKproduit_commander_FK
     foreign key (ID_pro)
     references produit (ID_pro);

alter table detail_commande add constraint FKcommander_FK
     foreign key (ID_com)
     references commande (ID_com);

alter table distribuer add constraint FKdis_fil
     foreign key (ID_fil)
     references film (ID_fil);

alter table distribuer add constraint FKdis_dis_FK
     foreign key (ID_dis)
     references distributeur (ID_dis);

alter table event_personne add constraint FKeve_per
     foreign key (ID_per)
     references personne (ID_per);

alter table event_personne add constraint FKeve_eve_FK
     foreign key (ID_eve)
     references event (ID_eve);

alter table facture add constraint FKfacturer_FK
     foreign key (ID_com)
     references commande (ID_com);

alter table fidelite_client add constraint FKfid_fid
     foreign key (ID_fid)
     references fidelite (ID_fid);

alter table fidelite_client add constraint FKfid_cli_FK
     foreign key (ID_cli)
     references client (ID_cli);

-- Not implemented
-- alter table film add constraint ID_CHK
--     check(exists(select * from categorie_film
--                  where categorie_film.ID_fil = ID_fil)); 

-- Not implemented
-- alter table film add constraint ID_CHK
--     check(exists(select * from distribuer
--                  where distribuer.ID_fil = ID_fil)); 

-- Not implemented
-- alter table film add constraint ID_CHK
--     check(exists(select * from motcle_identifier
--                  where motcle_identifier.ID_fil = ID_fil)); 

-- Not implemented
-- alter table film add constraint ID_CHK
--     check(exists(select * from produit
--                  where produit.ID_fil = ID_fil)); 

alter table jouer add constraint FKjou_per_FK
     foreign key (ID_per)
     references personne (ID_per);

alter table jouer add constraint FKjou_fil
     foreign key (ID_fil)
     references film (ID_fil);

-- Not implemented
-- alter table mot_cle add constraint ID_CHK
--     check(exists(select * from motcle_identifier
--                  where motcle_identifier.ID_mot = ID_mot)); 

alter table motcle_identifier add constraint FKmot_mot_FK
     foreign key (ID_mot)
     references mot_cle (ID_mot);

alter table motcle_identifier add constraint FKmot_fil
     foreign key (ID_fil)
     references film (ID_fil);

alter table produire add constraint FKpro_per_FK
     foreign key (ID_per)
     references personne (ID_per);

alter table produire add constraint FKpro_fil
     foreign key (ID_fil)
     references film (ID_fil);

alter table produit add constraint FKsupport_produit_FK
     foreign key (ID_sup)
     references support (ID_sup);

alter table produit add constraint FKpromotion_FK
     foreign key (ID_off)
     references offrepromo (ID_off);

alter table produit add constraint FKproduit_film_FK
     foreign key (ID_fil)
     references film (ID_fil);

alter table realiser add constraint FKrea_per_FK
     foreign key (ID_per)
     references personne (ID_per);

alter table realiser add constraint FKrea_fil
     foreign key (ID_fil)
     references film (ID_fil);

alter table s_inscrire add constraint FKs_i_new
     foreign key (ID_new)
     references newsletter (ID_new);

alter table s_inscrire add constraint FKs_i_cli_FK
     foreign key (ID_cli)
     references client (ID_cli);

alter table se_produire add constraint FKse__eve
     foreign key (ID_eve)
     references event (ID_eve);

alter table se_produire add constraint FKse__bou_FK
     foreign key (ID_bou)
     references boutique (ID_bou);

-- Not implemented
-- alter table support add constraint ID_CHK
--     check(exists(select * from produit
--                  where produit.ID_sup = ID_sup)); 

alter table theme_newsletter add constraint FKthe_new_FK
     foreign key (ID_new)
     references newsletter (ID_new);

alter table theme_newsletter add constraint FKthe_cat
     foreign key (ID_cat)
     references categorie (ID_cat);

alter table transporteur add constraint FKtransp_adresse_FK
     foreign key (ID_adr)
     references adresse (ID_adr);


-- Index Section
-- _____________ 

create unique index ID_IND
     on adresse (ID_adr);

create unique index FKlivrerclient_IND
     on adresse (ID_cli);

create unique index ID_IND
     on boutique (ID_bou);

create unique index FKboutique_adresse_IND
     on boutique (ID_adr);

create unique index ID_IND
     on categorie (ID_cat);

create unique index ID_categorie_event_IND
     on categorie_event (ID_eve, ID_cat);

create index FKcat_cat_1_IND
     on categorie_event (ID_cat);

create unique index ID_categorie_film_IND
     on categorie_film (ID_fil, ID_cat);

create index FKcat_cat_IND
     on categorie_film (ID_cat);

create unique index ID_IND
     on client (ID_cli);

create unique index FKfacturerclient_IND
     on client (ID_adr);

create unique index ID_IND
     on commande (ID_com);

create index FKpasser_commande_IND
     on commande (ID_cli);

create index FKlivrer_commande_IND
     on commande (ID_tra);

create index FKproduit_commander_IND
     on detail_commande (ID_pro);

create index FKcommander_IND
     on detail_commande (ID_com);

create unique index ID_distribuer_IND
     on distribuer (ID_fil, ID_dis);

create index FKdis_dis_IND
     on distribuer (ID_dis);

create unique index ID_IND
     on distributeur (ID_dis);

create unique index ID_IND
     on event (ID_eve);

create unique index ID_event_personne_IND
     on event_personne (ID_per, ID_eve);

create index FKeve_eve_IND
     on event_personne (ID_eve);

create unique index FKfacturer_IND
     on facture (ID_com);

create unique index ID_IND
     on fidelite (ID_fid);

create unique index ID_fidelite_client_IND
     on fidelite_client (ID_fid, ID_cli);

create index FKfid_cli_IND
     on fidelite_client (ID_cli);

create unique index ID_IND
     on film (ID_fil);

create unique index ID_jouer_IND
     on jouer (ID_fil, ID_per);

create index FKjou_per_IND
     on jouer (ID_per);

create unique index ID_IND
     on mot_cle (ID_mot);

create unique index ID_motcle_identifier_IND
     on motcle_identifier (ID_fil, ID_mot);

create index FKmot_mot_IND
     on motcle_identifier (ID_mot);

create unique index ID_IND
     on newsletter (ID_new);

create unique index ID_IND
     on offrepromo (ID_off);

create unique index ID_IND
     on personne (ID_per);

create unique index ID_produire_IND
     on produire (ID_fil, ID_per);

create index FKpro_per_IND
     on produire (ID_per);

create unique index ID_IND
     on produit (ID_pro);

create index FKsupport_produit_IND
     on produit (ID_sup);

create index FKpromotion_IND
     on produit (ID_off);

create index FKproduit_film_IND
     on produit (ID_fil);

create unique index ID_realiser_IND
     on realiser (ID_fil, ID_per);

create index FKrea_per_IND
     on realiser (ID_per);

create unique index ID_s_inscrire_IND
     on s_inscrire (ID_new, ID_cli);

create index FKs_i_cli_IND
     on s_inscrire (ID_cli);

create unique index ID_se_produire_IND
     on se_produire (ID_eve, ID_bou);

create index FKse__bou_IND
     on se_produire (ID_bou);

create unique index ID_IND
     on support (ID_sup);

create unique index ID_theme_newsletter_IND
     on theme_newsletter (ID_cat, ID_new);

create index FKthe_new_IND
     on theme_newsletter (ID_new);

create unique index ID_IND
     on transporteur (ID_tra);

create unique index FKtransp_adresse_IND
     on transporteur (ID_adr);


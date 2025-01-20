
insert into LesEmployes values (tgardien('Verdier', 'Noumea', tspecialites('fauve'), ens_cages()));
insert into LesEmployes values (tgardien('Desmoulins', 'Ushuaia', tspecialites('fauve','fosse','petits oiseaux'), ens_cages()));
insert into LesEmployes values (tgardien('Jouanot', 'Papeete', tspecialites('fosse','aquarium','grand aquarium'), ens_cages()));

insert into LesEmployes values (tgardien('Martins', 'Paris', tspecialites('fauve'), ens_cages(ref lescages(11), ref lescages(12))));
insert into LesEmployes values (tgardien('Labbe', 'Lyon', tspecialites('fauve'), ens_cages(ref lescages(11), ref lescages(12))));
insert into LesEmployes values (tgardien('Lachaize', 'Marseille', tspecialites('fauve'), ens_cages(ref lescages(1), ref lescages(11), ref lescages(12))));
insert into LesEmployes values (tgardien('Huard', 'Nice', tspecialites('fosse'), ens_cages(ref lescages(1))));
insert into LesEmployes values (tgardien('STMarcel', 'Toulouse', tspecialites(), ens_cages()));

insert into LesCages values (11 , 'fauve', 10 );
insert into LesCages values (1  , 'fosse', 1 );
insert into LesCages values (2  , 'aquarium', 1 );
insert into LesCages values (3  , 'petits oiseaux', 2 );
insert into LesCages values (4  , 'grand aquarium', 1 );
insert into LesCages values (12 , 'fauve', 10 );

insert into LesAnimaux values ('Charly', 'male', 'lion', 'fauve', 'Kenya', 2018, (select lacage from lescages where nocage=12), ens_maladies(tmaladie(to_date('11092023','DDMMYYYY'),'rage de dents'), tmaladie(to_date('05122022','DDMMYYYY'),'grippe')));
insert into LesAnimaux values ('Arthur', 'male', 'ours', 'fosse', 'France', 2020, (select lacage from lescages where nocage=1), ens_maladies());
insert into LesAnimaux values ('Chloe', 'femelle', 'pie', 'petits oiseaux', 'France', 2019, (select lacage from lescages where nocage=3), ens_maladies(tmaladie(to_date('20102022','DDMMYYYY'),'grippe')));
insert into LesAnimaux values ('Milou', 'male', 'leopard', 'fauve', 'France', 2016, (select lacage from lescages where nocage=11), ens_maladies(tmaladie(to_date('10012021','DDMMYYYY'),'angine')));
insert into LesAnimaux values ('Tintin', 'male', 'leopard', 'fauve', 'France', 2017, (select lacage from lescages where nocage=11), ens_maladies());
insert into LesAnimaux values ('Charlotte', 'femelle', 'lion', 'fauve', 'Kenya', 2021, (select lacage from lescages where nocage=12), ens_maladies());


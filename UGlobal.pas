unit UGlobal;

interface

var
    AddTitle : string = 'Enregistrement';
    UpdateTitle : string = 'Modification';
    DeleteTitle : string = 'Supression';
    EnUpTitle : string = 'Fin';
    ControlTitle : string = 'Contr�le';
    ValidateTitle : string = 'Validation';

    AddContext : string = 'add';
    UpdateContext : string = 'update';
    DeleteContext : string = 'delete';
    EndUpContext : string = 'End';
    ControlContext : string = 'control';
    ValidatContext : string = 'validat';

    ReplaceContext : string = 'replace';

    //BUTON CAPTION

    AddBtnCaption : string = 'Enregister';
    UpdateBtnCaption : string = 'Modifier';
    DeleteBtnCaption : string = 'Supprimer';
    ControlBtnCaption : string = 'Contr�ler';
    EndBtnCaption : string = 'Fin';
    ValidatBtnCaption : string = 'Valider';


    //Mode
    // Ce mode definit
    ModeEdit : string = 'edit';
    ModeControl : string = 'control';
    ModeValid : string = 'valide';

    //Mode Liste escale
    ModeRapport : string = 'rapport';
    ModeFactPal : string = 'facture_pal';
    ModeFactInt : string = 'facture_int';

    ModeEditTitle : string = 'Saisie';
    ModeControlTitle : string = 'Contr�le';
    ModeValidTitle : string = 'Validation';



    //Context d'edition des donn�es. Soit pour un DBLookup ou un formulaire

    LookUpContext : string = 'LookUp';
    FormContext : string = 'Form';



    //VARIABLE REQUETE SQL


    //REQUETE DE RECHERCHE DE REGLEMENT AVEC INFORMATION SUR LA FACTURE LIEE
    init_query_select_reg : string = ' SELECT R.id_regle, R.date_regle,F.id_factures_pal, F.ref_facture_pal, T.code_type_fact, F.date_emise_facture_pal, F.date_ech_facture_pal, '#13+
                                      ' FLOOR (F.montant_facture_pal * 655.957) AS montant_xof ,  '#13+
                                      ' R.montant_regle, FLOOR (F.montant_facture_pal * 655.957)- R.montant_regle as solde , S.nom_consignataire as cons_reg, C.nom_consignataire as cons_fact, S.id_consignataire as id_cons_reg, C.id_consignataire as id_cons_fact, '#13+
                                      ' case WHEN R.date_control_regle is null THEN '''' ELSE ''O''	end as control, '#13+
                                      ' case WHEN R.date_validate_regle is null THEN '''' ELSE ''O''	end AS validation '#13+
                                      ' FROM reglement R   '#13+
                                      ' INNER JOIN facture_pal F ON R.facture_regle=F.id_factures_pal  '#13+
                                      ' INNER JOIN type_facture T ON F.type_facture=T.id_type_fact  '#13+
                                      ' INNER JOIN consignataire C ON F.consignataire_facture_pal = C.id_consignataire  '#13+
                                      ' INNER JOIN consignataire S ON R.consignataire_regle = S.id_consignataire  '#13+
                                      ' WHERE R.id_regle IS NOT NULL '#13+
                                     '' ;


     // REQUETE DE RECHERCHE d'UN ESCALE POUR FACTURATION
    init_query_select_escale : string = 'SELECT * ,case WHEN facturable_obs=TRUE THEN ''F'' ELSE ''N''	end as statut , '#13+
                                       ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                                       ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                                       ' case WHEN rapport= True THEN ''O'' ELSE ''''	end as rapport_esc ,  '#13+
                                       ' po.libelle_port as orgine ,pd.libelle_port as destination '#13+
                                       ' FROM escale E  '#13+
                                       'INNER JOIN port as po on E.port_orgine=po.id_port '#13+
                                       'INNER JOIN observation o ON E.observation = o.id_obs '#13+
                                       'LEFT JOIN port as pd on E.port_dest=pd.id_port '#13+
                                       'INNER JOIN user as us on E. user_create=us.id_user '#13+
                                       'LEFT JOIN user as uc on E.user_control=uc.id_user '#13+
                                       'LEFT JOIN user as uv on E.user_validate=uv.id_user '#13+
                                       'INNER JOIN consignataire C on E.consignataire=C.id_consignataire '#13+
                                       'INNER JOIN navire  N on E.navire=N.id_navire '#13+
                                       'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                                       'INNER JOIN exercice Z on E.exercice=Z.id_exercice '#13+
                                       'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                                       ' WHERE E.id is not null ';

    //REQUETE DE RECHERCHE DUNE FACTURE POUR REGLEMENT AVEC INFOS SUR REGLEMENT TOTAL DE LA FACTURE SELECTIONNEE
    init_query_select_fact : string =   ' SELECT *, IFNULL(SUM(R.montant_regle), 0)  AS mont_regle , L.montant_xof - IFNULL(SUM(R.montant_regle), 0) AS mont_solde ,'#13+
                                        ' CASE WHEN L.montant_xof -IFNULL(SUM(R.montant_regle), 0) = 0 THEN ''R'' '#13+
                                        ' WHEN (L.montant_xof -IFNULL(SUM(R.montant_regle), 0) > 0) AND (IFNULL(SUM(R.montant_regle), 0)> 0)  THEN ''P'' '#13+
                                        ' ELSE ''I'' END AS st_fact '#13+
                                        ' FROM ( SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact,  R.ref AS ref_nav, N.nom_navire, N.id_navire, P.code_type_nav, P.id_type_nav, F.ref_facture_pal, T.code_type_fact, T.id_type_fact, '#13+
                                        ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, '#13+
                                        ' FLOOR (montant_facture_pal * 655.957) as montant_xof, '#13+
                                        ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                                        ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                                        ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                                        ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                                        ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation, '#13+
                                        ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut  '#13+
                                        ' FROM facture_pal F '#13+
                                        ' LEFT JOIN rade R on F.rade_facture_pal=R.id '#13+
                                        ' INNER JOIN exercice Z ON R.exercice = Z.id_exercice '#13+
                                        ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                                        ' INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                                        ' INNER JOIN navire N on R.navire=N.id_navire '#13+
                                        ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav '#13+
                                        ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                                        ' UNION '#13+
                                        ' SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact, E.ref as ref_nav,  N.nom_navire, N.id_navire, P.code_type_nav, P.id_type_nav, F.ref_facture_pal, T.code_type_fact, T.id_type_fact, '#13+
                                        ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) AS montant_reel, '#13+
                                        ' FLOOR (montant_facture_pal * 655.957) as montant_xof, '#13+
                                        ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                                        ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                                        ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                                        ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                                        ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation,'#13+
                                        ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut  '#13+
                                        ' FROM facture_pal F '#13+
                                        ' LEFT JOIN escale E on F.escale_facture_pal=E.id '#13+
                                        ' INNER JOIN exercice Z ON E.exercice = Z.id_exercice '#13+
                                        ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                                        ' INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                                        ' INNER JOIN navire N on E.navire=N.id_navire '#13+
                                        ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav '#13+
                                        ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                                        ' ) AS L '#13+
                                        ' LEFT JOIN reglement R on L.id_factures_pal=R.facture_regle '#13+
                                        ' WHERE L.id_factures_pal IS NOT NULL '#13+
                                        '';




    init_query_select_rade : string =  'SELECT * ,CONCAT(R.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_ex,  DATEDIFF( R.fin , R.debut)+1 AS sejour, CEILING((DATEDIFF( R.fin , R.debut)+1)/X.nombre_jour_taux_rade) as qte, '#13+
                                       ' us.login_user as user_saisie , uc.login_user as user_control , uv.login_user as user_validation,  '#13+
                                       ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                                       ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                                       ' case WHEN facturer_int = False THEN ''N''  ELSE ''O''	end as fact_int , '#13+
                                       ' case WHEN facturer_pal = False THEN ''N''  ELSE ''O''	end as fact_pal  '#13+
                                       ' FROM rade R '#13+
                                       'INNER JOIN user as us on R. user_create=us.id_user '#13+
                                       'LEFT JOIN user as uc on R.user_control=uc.id_user '#13+
                                       'LEFT JOIN user as uv on R.user_validate=uv.id_user '#13+
                                       'INNER JOIN consignataire C on R.consignataire=C.id_consignataire '#13+
                                       'INNER JOIN navire  N on R.navire=N.id_navire '#13+
                                       'INNER JOIN exercice Z on R.exercice=Z.id_exercice '#13+
                                       'INNER JOIN taux_rade X on R.taux_rade=X.id_taux_rade '#13+
                                       'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                                        '  WHERE R.id is not null ';


    // ETAT FACTURES PAL
    title_etat_fact_PAL : string = 'LISTE DES FACTURES PAL ';

    init_query_fact_PAL : string = 'SELECT * FROM ( '#13+
                                      ' SELECT *, CASE WHEN W.montant_xof= W.mont_regle THEN ''R'' WHEN (W.mont_regle>0) AND (W.mont_solde= 0)  THEN ''P'' ELSE ''I'' END AS st_fact  '#13+
                                      ' FROM (SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact, CONCAT(E.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_nav, '#13+
                                      ' N.nom_navire, N.id_navire, P.id_type_nav, P.code_type_nav, CASE WHEN P.libelle_type_nav IS NULL THEN ''INCONNU'' ELSE P.libelle_type_nav	END AS type_nav_real,  '#13+
                                      ' F.ref_facture_pal, T.id_type_fact, T.code_type_fact, T.libelle_type_fact, J.id_cat, J.code_cat_fact, J.libelle_cat_fact, F.rapport_control, F.rapport_validate,'#13+
                                      ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) AS montant_reel, '#13+
                                      ' FLOOR (montant_facture_pal * 655.957) as montant_xof, FLOOR (montant_facture_pal * 655.957)  - IFNULL(SUM(G.montant_regle), 0) AS mont_solde , IFNULL(SUM(G.montant_regle), 0) as mont_regle ,'#13+
                                      ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                                      ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                                      ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                                      ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                                      ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation, '#13+
                                      ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut '#13+
                                      ' FROM facture_pal F '#13+
                                      ' LEFT JOIN escale E on F.escale_facture_pal=E.id'#13+
                                      ' INNER JOIN exercice Z ON E.exercice = Z.id_exercice '#13+
                                      ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                                      ' INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                                      ' INNER JOIN navire N on E.navire=N.id_navire'#13+
                                      ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav '#13+
                                      ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                                      ' INNER JOIN categorie_fact J on T.categorie=J.id_cat '#13+
                                      ' LEFT JOIN reglement G on F.id_factures_pal=G.facture_regle '#13+
                                      ' GROUP BY F.id_factures_pal '#13+
                                      ' UNION '#13+
                                      ' SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact,  CONCAT(R.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_nav , '#13+
                                      ' N.nom_navire, N.id_navire, P.id_type_nav, P.code_type_nav, CASE WHEN P.libelle_type_nav IS NULL THEN ''INCONNU'' ELSE P.libelle_type_nav	END AS type_nav_real,  '#13+
                                      ' F.ref_facture_pal, T.id_type_fact, T.code_type_fact, T.libelle_type_fact, J.id_cat, J.code_cat_fact, J.libelle_cat_fact, F.rapport_control, F.rapport_validate,'#13+
                                      ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, '#13+
                                      ' FLOOR (montant_facture_pal * 655.957) as montant_xof, IFNULL(SUM(G.montant_regle), 0) as mont_regle , FLOOR (montant_facture_pal * 655.957)  - IFNULL(SUM(G.montant_regle), 0) AS mont_solde , '#13+
                                      ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                                      ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                                      ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                                      ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                                      ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation, '#13+
                                      ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut '#13+
                                      ' FROM facture_pal F '#13+
                                      ' LEFT JOIN rade R on F.rade_facture_pal=R.id  '#13+
                                      ' INNER JOIN exercice Z ON R.exercice = Z.id_exercice '#13+
                                      ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                                      ' INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                                      ' INNER JOIN navire N on R.navire=N.id_navire '#13+
                                      ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav  '#13+
                                      ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                                      ' INNER JOIN categorie_fact J on T.categorie=J.id_cat '#13+
                                      ' LEFT JOIN reglement G on F.id_factures_pal=G.facture_regle '#13+
                                      ' GROUP BY F.id_factures_pal '#13+
                                      ' )  AS W '#13+
                                      ' WHERE W.id_factures_pal is not null '#13+
                                      ' ) as L WHERE L.id_factures_pal is not null '#13+
                                      ' ';

    init_query_fact_PAL_sum : string ='SELECT %s , COUNT(id_factures_pal) as nb_fact , SUM(L.montant_xof) as mt_fact, SUM(L.mont_regle) as mt_regle , SUM(L.montant_xof) - SUM(L.mont_regle) as mt_solde '#13+
                                      ' FROM (SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact, CONCAT(E.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_nav, '#13+
                                      ' N.nom_navire, N.id_navire, P.id_type_nav, P.code_type_nav, CASE WHEN P.libelle_type_nav IS NULL THEN ''INCONNU'' ELSE P.libelle_type_nav	END AS type_nav_real,  '#13+
                                      ' F.ref_facture_pal, T.id_type_fact, T.code_type_fact, T.libelle_type_fact, J.id_cat, J.code_cat_fact, J.libelle_cat_fact, F.rapport_control, F.rapport_validate,'#13+
                                      ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) AS montant_reel, '#13+
                                      ' FLOOR (montant_facture_pal * 655.957) as montant_xof, FLOOR (montant_facture_pal * 655.957)  - IFNULL(SUM(G.montant_regle), 0) AS mont_solde , IFNULL(SUM(G.montant_regle), 0) as mont_regle ,'#13+
                                      ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                                      ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                                      ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                                      ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                                      ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation, '#13+
                                      ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut '#13+
                                      ' FROM facture_pal F '#13+
                                      ' LEFT JOIN escale E on F.escale_facture_pal=E.id'#13+
                                      ' INNER JOIN exercice Z ON E.exercice = Z.id_exercice '#13+
                                      ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                                      ' INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                                      ' INNER JOIN navire N on E.navire=N.id_navire'#13+
                                      ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav '#13+
                                      ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                                      ' INNER JOIN categorie_fact J on T.categorie=J.id_cat '#13+
                                      ' LEFT JOIN reglement G on F.id_factures_pal=G.facture_regle '#13+
                                      ' GROUP BY F.id_factures_pal '#13+
                                      ' UNION '#13+
                                      ' SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact,  CONCAT(R.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_nav , '#13+
                                      ' N.nom_navire, N.id_navire, P.id_type_nav, P.code_type_nav, CASE WHEN P.libelle_type_nav IS NULL THEN ''INCONNU'' ELSE P.libelle_type_nav	END AS type_nav_real,  '#13+
                                      ' F.ref_facture_pal, T.id_type_fact, T.code_type_fact, T.libelle_type_fact, J.id_cat, J.code_cat_fact, J.libelle_cat_fact, F.rapport_control, F.rapport_validate,'#13+
                                      ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, '#13+
                                      ' FLOOR (montant_facture_pal * 655.957) as montant_xof, IFNULL(SUM(G.montant_regle), 0) as mont_regle , FLOOR (montant_facture_pal * 655.957)  - IFNULL(SUM(G.montant_regle), 0) AS mont_solde , '#13+
                                      ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                                      ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                                      ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                                      ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                                      ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation, '#13+
                                      ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut '#13+
                                      ' FROM facture_pal F '#13+
                                      ' LEFT JOIN rade R on F.rade_facture_pal=R.id  '#13+
                                      ' INNER JOIN exercice Z ON R.exercice = Z.id_exercice '#13+
                                      ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                                      ' INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                                      ' INNER JOIN navire N on R.navire=N.id_navire '#13+
                                      ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav  '#13+
                                      ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                                      ' INNER JOIN categorie_fact J on T.categorie=J.id_cat '#13+
                                      ' LEFT JOIN reglement G on F.id_factures_pal=G.facture_regle '#13+
                                      ' GROUP BY F.id_factures_pal '#13+
                                      ' )  AS L WHERE L.id_factures_pal is not null '#13+
                                      ' ';



    //REGLEMENT REPORT INIT QUERY
    init_query_reg : string =' SELECT* FROM ( SELECT R.id_regle, R.date_regle,F.id_factures_pal, F.ref_facture_pal, N.nom_navire, N.id_navire, Y.libelle_type_nav, Y.code_type_nav, Y.id_type_nav, R.rapport_control, R.rapport_validate, R.exercice, '#13+
                              ' I.libelle_cat_fact, I.code_cat_fact, I.id_cat, T.libelle_type_fact, T.code_type_fact, T.id_type_fact, F.date_emise_facture_pal, F.date_ech_facture_pal, '#13+
                              ' FLOOR (F.montant_facture_pal * 655.957) AS montant_xof , '#13+
                              ' R.montant_regle, FLOOR (F.montant_facture_pal * 655.957)- R.montant_regle as solde , S.nom_consignataire as cons_reg, C.nom_consignataire as cons_fact, C.id_consignataire as id_cons_fact, S.id_consignataire as id_cons_reg, '#13+
                              ' case WHEN Y.libelle_type_nav is null THEN ''INCONNU'' ELSE Y.libelle_type_nav	end as type_nav_real,  '#13+
                              'case WHEN R.montant_regle = FLOOR (F.montant_facture_pal * 655.957) THEN ''T'' ELSE ''P''	end as st_reg, '#13+
                              ' case WHEN R.date_control_regle is null THEN '''' ELSE ''O''	end as control,  '#13+
                              ' case WHEN R.date_validate_regle is null THEN '''' ELSE ''O''	end AS validation  '#13+
                              ' FROM reglement R '#13+
                              ' INNER JOIN exercice Z ON R.exercice = z.id_exercice '#13+
                              ' INNER JOIN facture_pal F ON R.facture_regle=F.id_factures_pal '#13+
                              ' INNER JOIN type_facture T ON F.type_facture=T.id_type_fact '#13+
                              ' INNER JOIN categorie_fact I ON T.categorie=I.id_cat '#13+
                              ' INNER JOIN consignataire C ON F.consignataire_facture_pal = C.id_consignataire '#13+
                              ' INNER JOIN consignataire S ON R.consignataire_regle = S.id_consignataire '#13+
                              ' LEFT JOIN escale E ON F.escale_facture_pal = E.id '#13+
                              ' LEFT JOIN rade D ON F.rade_facture_pal = D.id '#13+
                              ' LEFT JOIN navire N ON E.navire = N.id_navire OR D.navire = N.id_navire '#13+
                              ' LEFT JOIN type_navire Y ON N.type_navire=Y.id_type_nav ) as X  '#13+
                              ' WHERE X.id_regle is not null ';

    init_query_reg_sum : string =   ' SELECT %s , COUNT(id_regle) as nb_reg , SUM(R.montant_regle) as mt_reg, '#13+
                                    ' case WHEN Y.libelle_type_nav is null THEN ''INCONNU'' ELSE Y.libelle_type_nav	end as type_nav_real  '#13+
                                    ' FROM reglement R '#13+
                                    ' INNER JOIN facture_pal F ON R.facture_regle=F.id_factures_pal '#13+
                                    ' INNER JOIN type_facture T ON F.type_facture=T.id_type_fact '#13+
                                    ' INNER JOIN categorie_fact I ON T.categorie=I.id_cat '#13+
                                    ' INNER JOIN consignataire C ON F.consignataire_facture_pal = C.id_consignataire '#13+
                                    ' INNER JOIN consignataire S ON R.consignataire_regle = S.id_consignataire '#13+
                                    ' LEFT JOIN escale E ON F.escale_facture_pal = E.id '#13+
                                    ' LEFT JOIN rade D ON F.rade_facture_pal = D.id '#13+
                                    ' LEFT JOIN navire N ON E.navire = N.id_navire OR D.navire = N.id_navire '#13+
                                    ' LEFT JOIN type_navire Y ON N.type_navire=Y.id_type_nav '#13+
                                    ' WHERE R.id_regle IS NOT NULL '#13+
                                    '  ';


implementation


end.

unit UFactPALEmise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  uniButton, uniPanel, uniGUIBaseClasses, Vcl.Menus, uniMainMenu, uniBitBtn,
  uniMenuButton, uniImageList;

type
  TFFactPalEmise = class(TUniForm)
    MainContainer: TUniContainerPanel;
    PanOp: TUniPanel;
    BtnDel: TUniButton;
    BtnUpdate: TUniButton;
    EdSearch: TUniEdit;
    UniLabel1: TUniLabel;
    BtnValidate: TUniButton;
    BtnControl: TUniButton;
    DBGrid: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    PopupMenu_add: TUniPopupMenu;
    E1: TUniMenuItem;
    R1: TUniMenuItem;
    UniMenuButton1: TUniMenuButton;
    UniImageList1: TUniImageList;
    PanRowCount: TUniPanel;
    procedure R1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure E1Click(Sender: TObject);
    procedure BtnControlClick(Sender: TObject);
    procedure DBGridSelectionChange(Sender: TObject);
    procedure BtnValidateClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure DBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure EdSearchChange(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateLoadDataFactRade;
    procedure UpdateLoadDataFactEscale;
  public
    { Public declarations }
    procedure ShowData;
  end;

function FFactPalEmise: TFFactPalEmise;

var
    filter, search, init_query, query, fact_query:string;
    exercice_filter :string;
    title :string = 'Facture Emises|PAL';
    title_rade :string = 'Facture Emises Rade|PAL';
    title_escale :string = 'Facture Emises Escale|PAL';
    FrmMode, FrmModeTitle : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEditFactEscPal, UEditFactRadePal, UGlobal,
  UFunction, UProject_Function, UEditFactEscalePal, ULoadData, UEditEscale;

function FFactPalEmise: TFFactPalEmise;
begin
  Result := TFFactPalEmise(DM.GetFormInstance(TFFactPalEmise));
end;

procedure TFFactPalEmise.UpdateLoadDataFactEscale;
begin
    //UPDATE CHECK VARIABLES
   FEditFactEscalePal.id_fact :=DM.QCheck.FieldValues['id_factures_pal'];
   FEditFactEscalePal.imma_fact :=DM.QCheck.FieldValues['ref_facture_pal'];
   FEditFactEscalePal.id_esc :=DM.QCheck.FieldValues['id_esc'];

   //UPDATE LOAD_DATA
   //INFOS ACCOSTAGE
   FEditFactEscalePal.EdRefPort.Text :=DM.QCheck.FieldValues['num_port'];
   FEditFactEscalePal.EdNavire.Text :=DM.QCheck.FieldValues['nom_navire'];
   FEditFactEscalePal.EdPoste.Text :=DM.QCheck.FieldValues['code_pq'];
   FEditFactEscalePal.EdRefInt.Text :=DM.QCheck.FieldValues['reference'];
   FEditFactEscalePal.EdConsignataire.Text :=DM.QCheck.FieldValues['cons_nav'];
   FEditFactEscalePal.EdAccost.Text :=DM.QCheck.FieldValues['date_accost'];

    //INFOS FACT
   FEditFactEscalePal.EdNumFact.Text :=DM.QCheck.FieldValues['ref_facture_pal'];
   FEditFactEscalePal.DBLConsignataire.KeyValue :=DM.QCheck.FieldValues['cons_fact'];
   FEditFactEscalePal.DBLTypeFact.KeyValue :=DM.QCheck.FieldValues['id_type_fact'];
   FEditFactEscalePal.EdMontFact.Text :=DM.QCheck.FieldValues['montant'];
   FEditFactEscalePal.EdComplement.Text :=DM.QCheck.FieldValues['complement'];
   FEditFactEscalePal.EdDateEmis.DateTime :=DM.QCheck.FieldValues['date_emise_facture_pal'];
   FEditFactEscalePal.EdDateTrans.DateTime :=DM.QCheck.FieldValues['date_trans_facture_pal'];
   FEditFactEscalePal.EdDateEch.DateTime :=DM.QCheck.FieldValues['date_ech_facture_pal'];
end;


procedure TFFactPalEmise.UpdateLoadDataFactRade;
begin
  //UPDATE CHECK VARIABLES
   FEditFactRadePal.id_fact :=DM.QCheck.FieldValues['id_factures_pal'];
   FEditFactRadePal.imma_fact :=DM.QCheck.FieldValues['ref_facture_pal'];
   FEditFactRadePal.id_rade :=DM.QCheck.FieldValues['id_rade'];

   //INFOS RADE
   FEditFactRadePal.EdNavire.Text :=DM.QCheck.FieldValues['nom_navire'];
   FEditFactRadePal.EdConsignataire.Text :=DM.QCheck.FieldValues['cons_nav'];
   FEditFactRadePal.Edarrive.Text :=DM.QCheck.FieldValues['debut'];
   FEditFactRadePal.Eddepart.Text :=DM.QCheck.FieldValues['fin'];
   FEditFactRadePal.EdRefInt.Text :=DM.QCheck.FieldValues['reference'];
   FEditFactRadePal.EdNbJours.Text :=DM.QCheck.FieldValues['sejour'];
   FEditFactRadePal.EdBase.Text :=DM.QCheck.FieldValues['nombre_jour_taux_rade'];
   FEditFactRadePal.EdQte.Text :=DM.QCheck.FieldValues['qte'];

    //INFOS FACT
   FEditFactRadePal.EdNumFact.Text :=DM.QCheck.FieldValues['ref_facture_pal'];
   FEditFactRadePal.DBLConsignataire.KeyValue :=DM.QCheck.FieldValues['cons_fact'];
   FEditFactRadePal.EdMontFact.Text :=DM.QCheck.FieldValues['montant'];
   FEditFactRadePal.EdDateEmis.DateTime :=DM.QCheck.FieldValues['date_emise_facture_pal'];
   FEditFactRadePal.EdDateTrans.DateTime :=DM.QCheck.FieldValues['date_trans_facture_pal'];
   FEditFactRadePal.EdDateEch.DateTime :=DM.QCheck.FieldValues['date_ech_facture_pal'];
end;

procedure TFFactPalEmise.ShowData;

begin
      filter:=' order by date_emise_facture_pal desc, ref_facture_pal desc ' ;

      if EdSearch.IsBlank then search:='' else

      search:=' AND (UPPER(F.ref_facture_pal) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND E.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT F.id_factures_pal,R.ref as reference, N.nom_navire, F.rapport_control, F.rapport_validate, F.ref_facture_pal, T.code_type_fact,'#13+
                   '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN rade R on F.rade_facture_pal=R.id '#13+
                   'INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                   'INNER JOIN navire N on R.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   ' '#13+

                     'UNION '#13+

                   'SELECT F.id_factures_pal,E.ref as reference, N.nom_navire, F.rapport_control, F.rapport_validate, F.ref_facture_pal, T.code_type_fact,'#13+
                    '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN escale E on F.escale_facture_pal=E.id '#13+
                   'INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                   ' INNER JOIN navire N on E.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                    '  ';
      query:=init_query + exercice_filter+ search+ filter;

      ExQuery(DM.DQ_Grid_FactPal, query);
//      DM.DQ_Grid_FactPal.Close;
//      DM.DQ_Grid_FactPal.SQL.Clear;
//      DM.DQ_Grid_FactPal.SQL.Text := query;
//      DM.DQ_Grid_FactPal.Open;
end;



procedure TFFactPalEmise.UniFormShow(Sender: TObject);
begin
  PanTitle.Caption := FrmPanTitle(title, FrmModeTitle, LibExerciceInst);
  ShowData;
end;

procedure TFFactPalEmise.BtnControlClick(Sender: TObject);
begin
    with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM facture_pal where id_factures_pal=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;
           ExecSQL;
           Open;
           end;

    if DM.QStand.FieldValues['escale_facture_pal'] <> null then
    begin
        FEditFactEscalePal.Caption := FrmEditTitle(title, ControlTitle);

        FEditFactEscalePal.ShowModal;
        FEditFactEscalePal.BtnSave.Caption := ControlBtnCaption;
        FEditFactEscalePal.BtnSave.IconCls := 'check2';
        FEditFactEscalePal.FmContext := ControlContext;

        //REQUETE DE SELECTION DE LA FACTURE AVEC INFORMATION COMPLEMENTAIRE - ESCALE
        fact_query:='SELECT F.id_factures_pal,F.ref_facture_pal, E.id as id_esc, E.ref as reference, E.num_port, E.date_accost, N.id_navire, N.nom_navire, Q.code_pq, F.ref_facture_pal, T.id_type_fact,'#13+
                    '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.id_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN escale E on F.escale_facture_pal=E.id '#13+
                   'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                   'INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                   ' INNER JOIN navire N on E.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   'AND F.id_factures_pal ='+DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;

        ExQuery(DM.QCheck, fact_query)  ;

        if DM.QCheck.RecordCount > 0 then
           begin
               FEditFactEscalePal.ShowModal;
               UpdateLoadDataFactEscale;

               //DISABLE CONTROLS
               FEditFactEscalePal.edRechAccost.DateTime := 0;
               FEditFactEscalePal.Group_rech.Enabled:= False;

               FEditFactEscalePal.Group_infos.Enabled:= False;

               FEditFactEscalePal.Group_fact.Enabled:= False;

           end
    end

    else

    begin
        FEditFactRadePal.Caption := FrmEditTitle(title, ControlTitle);

        FEditFactRadePal.ShowModal;
        FEditFactRadePal.BtnSave.Caption := ControlBtnCaption;
        FEditFactRadePal.BtnSave.IconCls := 'check2';
        FEditFactRadePal.FmContext := ControlContext;

         //REQUETE DE SELECTION DE LA FACTURE AVEC INFORMATION COMPLEMENTAIRE - RADE
        fact_query:= 'SELECT F.id_factures_pal, F.ref_facture_pal, R.id as id_rade, R.ref as reference, R.debut, R.fin, X.nombre_jour_taux_rade,  N.id_navire, N.nom_navire, F.ref_facture_pal, T.id_type_fact,'#13+
                    ' DATEDIFF( R.fin , R.debut)+1 AS sejour, CEILING((DATEDIFF( R.fin , R.debut)+1)/X.nombre_jour_taux_rade) as qte, '#13+
                   '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.id_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN rade R on F.rade_facture_pal=R.id '#13+
                   'INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                   'INNER JOIN navire N on R.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   'INNER JOIN taux_rade X on R.taux_rade=X.id_taux_rade '#13+
                   'AND F.id_factures_pal ='+DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;

        ExQuery(DM.QCheck, fact_query)  ;

         if DM.QCheck.RecordCount > 0 then
           begin
               FEditFactRadePal.ShowModal;

               UpdateLoadDataFactRade;

               //DISABLE CONTROLS
               FEditFactRadePal.edRechArrive.DateTime := 0;
               FEditFactRadePal.Group_rech.Enabled:= False;

               FEditFactRadePal.Group_infos.Enabled:= False;

               FEditFactRadePal.Group_fact.Enabled:= False;

           end;
    end;

end;

procedure TFFactPalEmise.BtnUpdateClick(Sender: TObject);
begin
      with DM.QStand do
           begin
               close;
               SQL.Clear;
               sql.add('SELECT * FROM facture_pal where id_factures_pal=:id ');
               Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;
               ExecSQL;
               Open;
           end;

    if DM.QStand.FieldValues['escale_facture_pal'] <> null then
    begin
        FEditFactEscalePal.Caption := FrmEditTitle(title, UpdateTitle);

        FEditFactEscalePal.ShowModal;
        FEditFactEscalePal.BtnSave.Caption := UpdateBtnCaption;
        FEditFactEscalePal.BtnSave.IconCls := 'compose';
        FEditFactEscalePal.FmContext := UpdateContext;

        //REQUETE DE SELECTION DE LA FACTURE AVEC INFORMATION COMPLEMENTAIRE - ESCALE
        fact_query:='SELECT F.id_factures_pal, E.id as id_esc, E.ref as reference, E.num_port, E.date_accost, N.id_navire, N.nom_navire, Q.code_pq, F.ref_facture_pal, T.id_type_fact,'#13+
                    '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.id_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN escale E on F.escale_facture_pal=E.id '#13+
                   'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                   'INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                   ' INNER JOIN navire N on E.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   'AND F.id_factures_pal ='+DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;

        ExQuery(DM.QCheck, fact_query)  ;

        if DM.QCheck.RecordCount > 0 then
           begin
               FEditFactEscalePal.ShowModal;
               UpdateLoadDataFactEscale;

               //DISABLE CONTROLS
               FEditFactEscalePal.edRechAccost.DateTime := 0;

           end
    end

    else

    begin
        FEditFactRadePal.Caption := FrmEditTitle(title, UpdateTitle);

        FEditFactRadePal.ShowModal;
        FEditFactRadePal.BtnSave.Caption := UpdateBtnCaption;
        FEditFactRadePal.BtnSave.IconCls := 'compose';
        FEditFactRadePal.FmContext := UpdateContext;

         //REQUETE DE SELECTION DE LA FACTURE AVEC INFORMATION COMPLEMENTAIRE - RADE
        fact_query:= 'SELECT F.id_factures_pal, R.id as id_rade, R.ref as reference, R.debut, R.fin, X.nombre_jour_taux_rade,  N.id_navire, N.nom_navire, F.ref_facture_pal, T.id_type_fact,'#13+
                    ' DATEDIFF( R.fin , R.debut)+1 AS sejour, CEILING((DATEDIFF( R.fin , R.debut)+1)/X.nombre_jour_taux_rade) as qte, '#13+
                   '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.id_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN rade R on F.rade_facture_pal=R.id '#13+
                   'INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                   'INNER JOIN navire N on R.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   'INNER JOIN taux_rade X on R.taux_rade=X.id_taux_rade '#13+
                   'AND F.id_factures_pal ='+DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;
        ExQuery(DM.QCheck, fact_query)  ;

         if DM.QCheck.RecordCount > 0 then
           begin
               FEditFactRadePal.ShowModal;
               UpdateLoadDataFactRade;

               //DISABLE CONTROLS
               FEditFactRadePal.edRechArrive.DateTime := 0;

           end;
    end;
end;

procedure TFFactPalEmise.BtnValidateClick(Sender: TObject);
begin
  with DM.QStand do
           begin
               close;
               SQL.Clear;
               sql.add('SELECT * FROM facture_pal where id_factures_pal=:id ');
               Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;
               ExecSQL;
               Open;
           end;

    if DM.QStand.FieldValues['escale_facture_pal'] <> null then
    begin
        FEditFactEscalePal.Caption := FrmEditTitle(title, ValidateTitle);

        FEditFactEscalePal.ShowModal;
        FEditFactEscalePal.BtnSave.Caption := ValidatBtnCaption;
        FEditFactEscalePal.BtnSave.IconCls := 'check';
        FEditFactEscalePal.FmContext := ValidatContext;

        //REQUETE DE SELECTION DE LA FACTURE AVEC INFORMATION COMPLEMENTAIRE - ESCALE
        fact_query:='SELECT F.id_factures_pal, E.id as id_esc, E.ref as reference, E.num_port, E.date_accost, N.id_navire, N.nom_navire, Q.code_pq, F.ref_facture_pal, T.id_type_fact,'#13+
                    'F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.id_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN escale E on F.escale_facture_pal=E.id '#13+
                   'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                   'INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                   ' INNER JOIN navire N on E.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   'AND F.id_factures_pal ='+DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;

        ExQuery(DM.QCheck, fact_query)  ;

        if DM.QCheck.RecordCount > 0 then
           begin
               FEditFactEscalePal.ShowModal;
               UpdateLoadDataFactEscale;

               //DISABLE CONTROLS
               FEditFactEscalePal.edRechAccost.DateTime := 0;
               FEditFactEscalePal.Group_rech.Enabled:= False;

               FEditFactEscalePal.Group_infos.Enabled:= False;

               FEditFactEscalePal.Group_fact.Enabled:= False;

           end
    end

    else

    begin
        FEditFactRadePal.Caption := FrmEditTitle(title, ValidateTitle);

        FEditFactRadePal.ShowModal;
        FEditFactRadePal.BtnSave.Caption := ValidatBtnCaption;
        FEditFactRadePal.BtnSave.IconCls := 'check';
        FEditFactRadePal.FmContext := ValidatContext;

         //REQUETE DE SELECTION DE LA FACTURE AVEC INFORMATION COMPLEMENTAIRE - RADE
        fact_query:= 'SELECT F.id_factures_pal, R.id as id_rade, R.ref as reference, R.debut, R.fin, X.nombre_jour_taux_rade,  N.id_navire, N.nom_navire, F.ref_facture_pal, T.id_type_fact,'#13+
                    ' DATEDIFF( R.fin , R.debut)+1 AS sejour, CEILING((DATEDIFF( R.fin , R.debut)+1)/X.nombre_jour_taux_rade) as qte, '#13+
                   '  F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) as montant_reel, FLOOR (montant_facture_pal * 655.957) as montant_xof,'#13+
                   ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.id_consignataire as cons_fact, K.nom_consignataire as cons_nav, '#13+
                   ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                   ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end as validation '#13+
                   ' FROM facture_pal F  '#13+
                   'INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire'#13+
                   'LEFT JOIN rade R on F.rade_facture_pal=R.id '#13+
                   'INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                   'INNER JOIN navire N on R.navire=N.id_navire '#13+
                   'INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                   'INNER JOIN taux_rade X on R.taux_rade=X.id_taux_rade '#13+
                   'AND F.id_factures_pal ='+DBGrid.DataSource.DataSet.FieldByName('id_factures_pal').AsString;
        ExQuery(DM.QCheck, fact_query)  ;

         if DM.QCheck.RecordCount > 0 then
           begin
               FEditFactRadePal.ShowModal;

               UpdateLoadDataFactRade;

               //DISABLE CONTROLS
               FEditFactRadePal.edRechArrive.DateTime := 0;
               FEditFactRadePal.Group_rech.Enabled:= False;

               FEditFactRadePal.Group_infos.Enabled:= False;

               FEditFactRadePal.Group_fact.Enabled:= False;

           end;
    end;
end;

procedure TFFactPalEmise.DBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
      if DBGrid.DataSource.DataSet.FieldByName('rapport_control').AsInteger = 1 then
      Attribs.Color:= clWebLemonChiffon
    else
    if DBGrid.DataSource.DataSet.FieldByName('rapport_validate').AsInteger = 1 then
      Attribs.Color:= clWebLightSalmon
    else
end;

procedure TFFactPalEmise.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
  PanRowCount.Caption := IntToStr(DBGrid.DataSource.DataSet.RecordCount) ;

 if  DBGrid.DataSource.DataSet.RecordCount=0 then
      begin
            BtnUpdate.Enabled:=False;
            BtnDel.Enabled:=False;
            BtnControl.Enabled:=False;
            BtnValidate.Enabled:=False;
      end
    else
       begin
          BtnUpdate.Enabled:=true;
         // BtnDel.Enabled:=true;
          BtnControl.Enabled:=true;
          BtnValidate.Enabled:=true;
       end;
end;

procedure TFFactPalEmise.DBGridSelectionChange(Sender: TObject);
begin
if DBGrid.DataSource.DataSet.FieldByName('control').AsString = '' then
    begin
        BtnControl.Enabled:=True;
        BtnValidate.Enabled:=False;
    end
    else
    begin
        BtnControl.Enabled:=False;
        BtnValidate.Enabled:=True;

    end;

if DBGrid.DataSource.DataSet.FieldByName('validation').AsString <> '' then
    begin
       BtnValidate.Enabled:=False;
    end
  else
end;

procedure TFFactPalEmise.E1Click(Sender: TObject);
begin
    FEditFactEscalePal.FmContext := AddContext;
    FEditFactEscalePal.Caption := FrmEditTitle(title_escale, AddTitle);
    FEditFactEscalePal.ShowModal;
end;

procedure TFFactPalEmise.EdSearchChange(Sender: TObject);
begin
    ShowData;
end;

procedure TFFactPalEmise.R1Click(Sender: TObject);
begin
    FEditFactRadePal.FmContext := AddContext;
    FEditFactRadePal.Caption := FrmEditTitle(title_rade, AddTitle);
    FEditFactRadePal.ShowModal;
end;

end.

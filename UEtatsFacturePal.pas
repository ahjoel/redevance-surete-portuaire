unit UEtatsFacturePal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet, uniButton, uniComboBox, uniMultiItem, uniDBComboBox,
  uniDBLookupComboBox, uniLabel, uniDateTimePicker, uniGroupBox, uniPanel,
  uniBasicGrid, uniDBGrid, uniGUIBaseClasses, uniGridExporters;

type
  TFEtatsFacturePal = class(TUniForm)
    MainContainer: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel2: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    GBPeriode_Em: TUniGroupBox;
    EdPeriode1_Em: TUniDateTimePicker;
    EdPeriode2_Em: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    GBConsignataire_Fact: TUniGroupBox;
    DBLConsignataire_Fact: TUniDBLookupComboBox;
    GBTypeFact: TUniGroupBox;
    GBNavire: TUniGroupBox;
    DBLNavire: TUniDBLookupComboBox;
    UniPanel3: TUniPanel;
    BtnRecherche: TUniButton;
    BtnReinitialise: TUniButton;
    UniContainerPanel2: TUniContainerPanel;
    BtnExport: TUniButton;
    BtnPrint: TUniButton;
    PanRowCount: TUniPanel;
    frxDBDataset: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset_sum: TfrxDBDataset;
    DBGrid: TUniDBGrid;
    GBConsignataire_Nav: TUniGroupBox;
    DBLConsignataire_Nav: TUniDBLookupComboBox;
    GBPeriode_Ech: TUniGroupBox;
    EdPeriode1_Ech: TUniDateTimePicker;
    EdPeriode2_Ech: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    GBFacturable: TUniGroupBox;
    CBComplement: TUniComboBox;
    GBTypeNav: TUniGroupBox;
    DBLTypeNavire: TUniDBLookupComboBox;
    GBStatut: TUniGroupBox;
    CBStatut: TUniComboBox;
    DBLCatFact: TUniDBLookupComboBox;
    DBLTypeFact: TUniDBLookupComboBox;
    procedure UniFormShow(Sender: TObject);
    procedure BtnReinitialiseClick(Sender: TObject);
    procedure BtnRechercheClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure DBLCatFactChangeValue(Sender: TObject);
  private
    { Private declarations }
    procedure ClearData;
  public
    { Public declarations }
    procedure ShowData;
  end;

function FEtatsFacturePal: TFEtatsFacturePal;

var
    filter, search, init_query, query:string;
    exercice_filter, filter_periode_em, filter_periode_ech , filter_consign_fact, filter_consign_nav, filter_TypeNav, filter_CatFact, filter_TypeFact, filter_compl, filter_navire, filter_obs, filter_facturable, filter_fact_pal, filter_fact_int, filter_statut :string;
    group_filter : string;

//  REPORT TITLES VARIABLES
    title_report, title_main, title_periode_em, title_periode_ech, title_consign_fact, title_consign_nav, title_typeNav, title_CatFact, title_TypeFact, title_compl, title_navire, title_obs, title_statut, title_factPAL, title_factInt : string;

//  REQUETE POUR SELECTION DES SOUS TYPE DE FACTURE
    query_TypeFact : string;


implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ULoadData, UFunction, UProject_Function,
  UGlobal, UPrintOptionFactPal;

function FEtatsFacturePal: TFEtatsFacturePal;
begin
  Result := TFEtatsFacturePal(DM.GetFormInstance(TFEtatsFacturePal));
end;
procedure TFEtatsFacturePal.ShowData;
begin
  filter:=' ORDER BY L.date_emise_facture_pal DESC, L.id_factures_pal DESC ' ;

  //FILTRE SUR PERIODE  EMMISSION
      if (EdPeriode1_Em.DateTime <> 0) and (EdPeriode1_Em.DateTime <> 0) then
          begin
            filter_periode_em := ' AND (DATE(L.date_emise_facture_pal) between '''+ msqlDateTime(EdPeriode1_Em) +'''and '''+ msqlDateTime(EdPeriode2_Em) +''')'  ;
            title_periode_em :=  'ENTRE LE '+ EdPeriode1_Em.Text+ ' ET LE '+ EdPeriode2_Em.Text
          end
      else
         begin
             filter_periode_em := ''  ;
             title_periode_em :='' ;
         end;

  //FILTRE SUR PERIODE  ECHEANCE
      if (EdPeriode1_Ech.DateTime <> 0) and (EdPeriode1_Ech.DateTime <> 0) then
          begin
            filter_periode_Ech := ' AND (DATE(L.date_ech_facture_pal) between '''+ msqlDateTime(EdPeriode1_Ech) +'''and '''+ msqlDateTime(EdPeriode2_Ech) +''')'  ;
            title_periode_Ech :=  'ENTRE LE '+ EdPeriode1_Ech.Text+ ' ET LE '+ EdPeriode1_Ech.Text
          end
      else
         begin
             filter_periode_Ech := ''  ;
             title_periode_Ech :='' ;
         end;

    //FILTRE CONSIGNATAIRE   FACTURE
     if DBLConsignataire_Fact.KeyValue = null then
          begin
              filter_consign_fact := '';
              title_consign_fact := '';
          end
      else
          begin
              filter_consign_fact := ' AND L.id_cons_fact ='+ IntToStr(DBLConsignataire_Fact.KeyValue) ;
              title_consign_fact := ' DU CONSIGNATAIRE '+ DBLConsignataire_Fact.Text;
          end;

     //FILTRE CONSIGNATAIRE   NAVIRE
     if DBLConsignataire_Nav.KeyValue = null then
          begin
              filter_consign_nav := '';
              filter_consign_nav := '';
          end
      else
          begin
              filter_consign_nav := ' AND L.id_cons_nav ='+ IntToStr(DBLConsignataire_Nav.KeyValue) ;
              title_consign_nav := DBLConsignataire_Nav.Text;
          end;


     //FILTRE TYPE FAMILLE ESCALE OU RADE
      if DBLCatFact.KeyValue=null  then
          begin
              filter_CatFact := '';
              title_CatFact := '';
          end
      else
          begin
              filter_CatFact :=' AND C.id_cat ='+ IntToStr(DBLCatFact.KeyValue);
              title_CatFact := DBLCatFact.Text;
          end;


       //FILTRE TYPE FACTURE
       if DBLTypeFact.KeyValue=null  then
          begin
              filter_TypeFact := '';
              title_TypeFact := '';
          end
      else
          begin
              filter_TypeFact :=' AND L.id_type_fact ='+ IntToStr(DBLTypeFact.KeyValue);
              title_TypeFact := DBLTypeFact.Text;
          end;

       //FILTRE NAVIRE
      if DBLNavire.KeyValue=null  then
          begin
              filter_navire := '';
              title_navire := '';
          end
      else
          begin
              filter_navire :=' AND L.id_navire ='+ IntToStr(DBLNavire.KeyValue);
              title_navire := DBLNavire.Text;
          end;


        //FILTRE TYPE NAVIRE
      if DBLTypeNavire.KeyValue=null  then
          begin
              filter_TypeNav := '';
              title_typeNav := '';
          end
      else
          begin
              filter_TypeNav :=' AND L.id_type_nav ='+ IntToStr(DBLTypeNavire.KeyValue);
              title_typeNav := DBLTypeNavire.Text;
          end;


      //FILTRE COMPLEMENT
      if  CBComplement.Text = '' then
          begin
             filter_compl := '';
             title_compl := '';
          end
      else if CBComplement.Text = 'OUI' then
          begin
              filter_compl :=' AND L.complement > 0';
              title_compl := 'OUI';
          end
      else if CBComplement.Text = 'NON' then
          begin
            filter_compl :=' AND L.complement = 0';
            title_compl := 'NON';
          end;

      //FILTRE STATUT
      case CBStatut.ItemIndex of
          -1 : begin
                filter_statut := '' ;
                title_statut := '' ;
              end;

          0 : begin
                filter_statut := ' AND L.statut_fact = ''N'' ' ;
                title_statut := ' IMPAY�ES ' ;
              end;

          1: begin
                filter_statut := ' AND L.statut_fact = ''R'' ' ;
                title_statut := ' REGL�ES ' ;
              end;

          2 : begin
                filter_statut := ' AND L.statut_fact = ''P'' ' ;
                title_statut := ' PARTIELEMENT REGL�ES ' ;
              end;
      end;

      query:=init_query_etat_fact_PAL + filter_periode_em  + filter_consign_fact + filter_consign_nav + filter_CatFact + filter_TypeFact + filter_periode_ech + filter_navire + filter_TypeNav +filter_compl + filter_statut + filter;
      title_report := title_etat_fact_PAL + title_periode_em + title_consign_fact;

      ExQuery(DM.DQ_Grid_FactPal, query )

end;

procedure TFEtatsFacturePal.UniFormShow(Sender: TObject);
begin
    LoadDBLConsignataire;
    LoadDBLNavire;
    LoadDBLTypeNavire;
    LoadDBLInstallationPort;
    LoadDBLCatFact;
    ClearData;
    DM.DQ_Grid_Escale.Close;
end;

procedure TFEtatsFacturePal.BtnPrintClick(Sender: TObject);
begin
  if ( (query.IsEmpty = True)OR (DBGrid.DataSource.DataSet.RecordCount=0)) then
          begin
              MessageDlg('Aucune Donn�e � Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
        begin
            FPrintOptionFactPAL.ShowModal;
        end;
end;

procedure TFEtatsFacturePal.BtnRechercheClick(Sender: TObject);
begin
    if EdPeriode1_Em.DateTime = 0 then
        begin
           MessageDlg('Veuillez renseigner une periode d''�mmission ',mtWarning,[mbok]);
           EdPeriode1_Em.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
    else
     if EdPeriode2_Em.DateTime = 0 then
        begin
           MessageDlg('Veuillez renseigner une periode d''�mmission ',mtWarning,[mbok]);
           EdPeriode2_Em.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
    else
        ShowData;
end;

procedure TFEtatsFacturePal.BtnReinitialiseClick(Sender: TObject);
begin
    ClearData;

end;

procedure TFEtatsFacturePal.ClearData;
  begin
      EdPeriode1_Em.DateTime := 0;
      EdPeriode2_Em.DateTime := 0;
      EdPeriode1_Ech.DateTime := 0;
      EdPeriode2_Ech.DateTime := 0;
      DBLConsignataire_Fact.KeyValue := null;
      DBLConsignataire_Nav.KeyValue := null;
      DBLCatFact.KeyValue := null;
      DBLTypeFact.KeyValue := null;
      DBLNavire.KeyValue := null;
      CBComplement.ItemIndex := -1;
      PanRowCount.Caption := '0';
      query:= '' ;
      DBGrid.DataSource.DataSet.Close;
  end;


procedure TFEtatsFacturePal.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
PanRowCount.Caption := IntToStr(DBGrid.DataSource.DataSet.RecordCount) ;
end;

procedure TFEtatsFacturePal.DBLCatFactChangeValue(Sender: TObject);
begin
  if DBLCatFact.KeyValue <> null then
      begin
        DBLDataLoad(DM.DQ_DBL_TypeFact,'SELECT * FROM type_facture T, categorie_fact C WHERE T.categorie=C.id_cat AND T.categorie=' + IntToStr(DBLCatFact.KeyValue));
//        DM.DQ_DBL_TypeFact.Close;
//        DM.DQ_DBL_TypeFact.SQL.Clear;
//        DM.DQ_DBL_TypeFact.SQL.Text := 'SELECT * FROM type_facture T, categorie_fact C WHERE T.categorie=C.id_cat AND T.categorie=' + IntToStr(DBLCatFact.KeyValue);
//        DM.DQ_DBL_TypeFact.sql.SaveToFile('D:\look.sql');
//        DM.DQ_DBL_TypeFact.Open;

      end
        else
      begin
        DM.DQ_DBL_TypeFact.Close;
      end;
end;

end.

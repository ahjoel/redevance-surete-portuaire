unit UEtatsReglement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet, uniBasicGrid, uniDBGrid, uniComboBox, uniButton, uniMultiItem,
  uniDBComboBox, uniDBLookupComboBox, uniLabel, uniDateTimePicker, uniGroupBox,
  uniPanel, uniGUIBaseClasses;

type
  TFEtatsReglement = class(TUniForm)
    MainContainer: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel2: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    GBPeriode_Em: TUniGroupBox;
    EdPeriode1_Reg: TUniDateTimePicker;
    EdPeriode2_Reg: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    GBConsignataire_Fact: TUniGroupBox;
    DBLConsignataire_Fact: TUniDBLookupComboBox;
    GBTypeFact: TUniGroupBox;
    DBLCatFact: TUniDBLookupComboBox;
    DBLTypeFact: TUniDBLookupComboBox;
    GBNavire: TUniGroupBox;
    DBLNavire: TUniDBLookupComboBox;
    UniPanel3: TUniPanel;
    BtnRecherche: TUniButton;
    BtnReinitialise: TUniButton;
    GBConsignataire_Nav: TUniGroupBox;
    DBLConsignataire_Reg: TUniDBLookupComboBox;
    GBPeriode_Ech: TUniGroupBox;
    EdPeriode1_Fact: TUniDateTimePicker;
    EdPeriode2_Fact: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    GBFacturable: TUniGroupBox;
    CBStatut: TUniComboBox;
    GBTypeNav: TUniGroupBox;
    DBLTypeNavire: TUniDBLookupComboBox;
    UniContainerPanel2: TUniContainerPanel;
    BtnExport: TUniButton;
    BtnPrint: TUniButton;
    PanRowCount: TUniPanel;
    frxDBDataset: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset_sum: TfrxDBDataset;
    DBGrid: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure BtnRechercheClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnReinitialiseClick(Sender: TObject);
    procedure DBLCatFactChange(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure CBStatutChangeValue(Sender: TObject);
  private
    { Private declarations }
    procedure ClearData;
  public
    { Public declarations }
    procedure ShowData;
  end;

function FEtatsReglement: TFEtatsReglement;

var
    statut : string ;
    filter, search, init_query, query:string;
    exercice_filter, filter_periode_reg , filter_periode_fact, filter_consign_reg, filter_consign_fact, filter_cat_fact, filter_type_fact,  filter_TypeNave, filter_navire, filter_statut :string;

     //REPORT TITLES VARIABLES
    title_report, title_main, title_periode_reg, title_periode_fact, title_consign_reg, title_consign_fact, title_cat_fact, title_type_fact, title_typeNav, title_navire, title_statut : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, ULoadData, UFunction, UReport,
  UPrintOptionReglement;

function FEtatsReglement: TFEtatsReglement;
begin
  Result := TFEtatsReglement(DM.GetFormInstance(TFEtatsReglement));
end;

procedure TFEtatsReglement.UniFormShow(Sender: TObject);
begin
    LoadDBLConsignataire;
    LoadDBLTypeNavire;
    LoadDBLNavire;
    LoadDBLCatFact;
    ClearData;

end;

procedure TFEtatsReglement.ShowData;
  begin

     filter:=' order by date_regle desc ' ;

        //FILTRE SUR PERIODE REG
      if (EdPeriode1_Reg.DateTime <> 0) and (EdPeriode2_Reg.DateTime <> 0) then
          begin
            filter_periode_reg := ' AND (DATE(date_regle) between '''+ msqlDateTime(EdPeriode1_Reg) +'''and '''+ msqlDateTime(EdPeriode2_Reg) +''')';
            title_periode_reg :=  'ENTRE LE '+ EdPeriode1_Reg.Text+ ' ET LE '+ EdPeriode2_Reg.Text
          end
      else
         begin
             filter_periode_reg := ''  ;
             title_periode_reg :='' ;
         end;

     //FILTRE CONSIGNATAIRE REGLEMENT
     if DBLConsignataire_Reg.KeyValue = null then
          begin
              filter_consign_reg := '';
              title_consign_reg := '';
          end
      else
          begin
              filter_consign_reg := ' AND id_cons_reg ='+ IntToStr(DBLConsignataire_Reg.KeyValue) ;
              title_consign_reg := ' DU CONSIGNATAIRE '+ DBLConsignataire_Reg.Text;
          end;

      //FILTRE CONSIGNATAIRE FACTURE
     if DBLConsignataire_Fact.KeyValue = null then
          begin
              filter_consign_fact := '';
              title_consign_fact := '';
          end
      else
          begin
              filter_consign_fact := ' AND id_cons_fact ='+ IntToStr(DBLConsignataire_Fact.KeyValue) ;
              title_consign_fact := DBLConsignataire_Fact.Text;
          end;

       //FILTRE CATEGORIE FACTURE
     if DBLCatFact.KeyValue = null then
          begin
              filter_cat_fact := '';
              title_cat_fact := '';
          end
      else
          begin
              filter_cat_fact := ' AND id_cat ='+ IntToStr(DBLCatFact.KeyValue) ;
              title_cat_fact := DBLCatFact.Text;
          end;

        //FILTRE TYPE FACTURE
     if DBLTypeFact.KeyValue = null then
          begin
              filter_type_fact := '';
              title_type_fact := '';
          end
      else
          begin
              filter_type_fact := ' AND id_type_fact ='+ IntToStr(DBLTypeFact.KeyValue) ;
              title_type_fact := DBLTypeFact.Text;
          end;

         //FILTRE SUR PERIODE FACTURE
      if (EdPeriode1_Fact.DateTime <> 0) and (EdPeriode2_Fact.DateTime <> 0) then
          begin
            filter_periode_fact := ' AND (DATE(date_emise_facture_pal) between '''+ msqlDateTime(EdPeriode1_Fact) +'''and '''+ msqlDateTime(EdPeriode2_Fact) +''')';
            title_periode_fact :=  EdPeriode1_Fact.Text+ ' - '+ EdPeriode2_Fact.Text
          end
      else
         begin
             filter_periode_fact := ''  ;
             title_periode_fact :='' ;
         end;

      //FILTRE TYPE NAVIRE
      if DBLTypeNavire.KeyValue = null then
          begin
              filter_TypeNave := '' ;
              title_typeNav := '';
          end
      else
          begin
              filter_TypeNave := ' AND id_type_nav ='+IntToStr(DBLTypeNavire.KeyValue);
              title_typeNav := DBLTypeNavire.Text;
          end;

      //FILTRE NAVIRE
      if DBLNavire.KeyValue=null  then
          begin
              filter_navire := '';
              title_navire := '';
          end
      else
          begin
              filter_navire :=' AND id_navire ='+ IntToStr(DBLNavire.KeyValue);
              title_navire := DBLNavire.Text;
          end;

       //FILTRE STATUT
      if CBStatut.ItemIndex=-1  then
          begin
              filter_statut := '';
              title_statut := '';
          end
      else
          begin
              filter_statut := statut;
              title_statut := CBStatut.Text;
          end;


      title_main := 'ETAT DES REGLEMENTS ';

      query:=init_query_reg + filter_periode_reg + filter_periode_fact + filter_consign_reg + filter_consign_fact + filter_periode_fact + filter_cat_fact+ filter_type_fact + filter_TypeNave + filter_navire + filter_statut + filter;
      title_report := title_main + title_periode_reg + title_consign_reg;

      ExQuery(DM.DQ_Grid_Reglement, query);

//      DM.DQ_Grid_Rade.Close;
//      DM.DQ_Grid_Rade.SQL.Clear;
//      DM.DQ_Grid_Rade.SQL.Text := query;
//      DM.DQ_Grid_Rade.sql.SaveToFile('D:\Now2.sql');
//      DM.DQ_Grid_Rade.Open;

  end;

procedure TFEtatsReglement.BtnPrintClick(Sender: TObject);
begin
    if ( (query.IsEmpty = True)OR (DBGrid.DataSource.DataSet.RecordCount=0)) then
          begin
              MessageDlg('Aucune Donn�e � Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
        begin
            FPrintOptionReglement.ShowModal;
        end;
end;

procedure TFEtatsReglement.BtnRechercheClick(Sender: TObject);
begin
if EdPeriode1_Reg.DateTime = 0 then
        begin
           MessageDlg('Veuillez renseigner une periode',mtWarning,[mbok]);
           EdPeriode1_Reg.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
    else
     if EdPeriode2_Reg.DateTime = 0 then
        begin
           MessageDlg('Veuillez renseigner une periode',mtWarning,[mbok]);
           EdPeriode2_Reg.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
    else
        ShowData;
end;

procedure TFEtatsReglement.BtnReinitialiseClick(Sender: TObject);
begin
    ClearData ;
end;

procedure TFEtatsReglement.CBStatutChangeValue(Sender: TObject);
begin

  if CBStatut.ItemIndex = -1 then
     statut := ''
  else
     begin
        case CBStatut.ItemIndex of
          0 : statut:=' AND st_reg = ''P'' ';

          1 :statut:=' AND st_reg = ''T'' ';
        end;
     end;
end;

procedure TFEtatsReglement.ClearData;
  begin
      EdPeriode1_Reg.DateTime := 0;
      EdPeriode2_Reg.DateTime := 0;
      EdPeriode1_Fact.DateTime := 0;
      EdPeriode2_Fact.DateTime := 0;
      DBLConsignataire_Fact.KeyValue := null;
      DBLConsignataire_Reg.KeyValue := null;
      DBLTypeNavire.KeyValue := null;
      DBLNavire.KeyValue := null;
      PanRowCount.Caption := '0';
      query:= '' ;
      DM.DQ_Grid_Reglement.Close;
  end;

procedure TFEtatsReglement.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
    PanRowCount.Caption := IntToStr(DBGrid.DataSource.DataSet.RecordCount) ;
end;

procedure TFEtatsReglement.DBLCatFactChange(Sender: TObject);
begin
  if DBLCatFact.KeyValue <> null then
      begin
        DBLDataLoad(DM.DQ_DBL_TypeFact,'SELECT * FROM categorie_fact C , type_facture T WHERE T.categorie=C.id_cat AND T.categorie =' + IntToStr(DBLCatFact.KeyValue));
      end
      else
      begin
        DM.DQ_DBL_TypeFact.Close;
        DBLTypeFact.KeyValue := null ;
      end;
end;

end.

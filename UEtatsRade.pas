unit UEtatsRade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxClass, frxDBSet, frxExportBaseDialog,
  frxExportPDF, uniBasicGrid, uniDBGrid, uniButton, uniComboBox, uniMultiItem,
  uniDBComboBox, uniDBLookupComboBox, uniLabel, uniDateTimePicker, uniGroupBox,
  uniPanel, uniGUIBaseClasses;

type
  TFEtatsRade = class(TUniForm)
    MainContainer: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    GBPeriode: TUniGroupBox;
    EdPeriode1: TUniDateTimePicker;
    EdPeriode2: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    GBConsignataire: TUniGroupBox;
    DBLConsignataire: TUniDBLookupComboBox;
    GBTypeNav: TUniGroupBox;
    DBLTypeNavire: TUniDBLookupComboBox;
    GBFacturePAL: TUniGroupBox;
    CBFacturePAL: TUniComboBox;
    GBFactureInt: TUniGroupBox;
    CBFactureInt: TUniComboBox;
    GBNavire: TUniGroupBox;
    DBLNavire: TUniDBLookupComboBox;
    UniPanel3: TUniPanel;
    BtnRecherche: TUniButton;
    BtnReinitialise: TUniButton;
    UniContainerPanel2: TUniContainerPanel;
    BtnExport: TUniButton;
    BtnPrint: TUniButton;
    PanRowCount: TUniPanel;
    DBGrid: TUniDBGrid;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    frxDBDataset_sum: TfrxDBDataset;
    UniButton1: TUniButton;
    procedure BtnReinitialiseClick(Sender: TObject);
    procedure BtnRechercheClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ClearData;
  public
    { Public declarations }
    procedure ShowData;
  end;

function FEtatsRade: TFEtatsRade;
var
    filter, search, init_query, query:string;
    exercice_filter, filter_periode , filter_consign, filter_TypeNave, filter_navire, filter_fact_pal, filter_fact_int :string;

     //REPORT TITLES VARIABLES
    title_report, title_main, title_periode, title_consign, title_typeNav, title_navire, title_factPAL, title_factInt : string;


implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UFunction, UProject_Function, ULoadData,
  UReport, UPrintOptionRadeReport, UEtatsRadeTest, UniForm;

function FEtatsRade: TFEtatsRade;
begin
  Result := TFEtatsRade(DM.GetFormInstance(TFEtatsRade));
end;

procedure TFEtatsRade.BtnPrintClick(Sender: TObject);
begin
   if ( (query.IsEmpty = True)OR (DBGrid.DataSource.DataSet.RecordCount=0)) then
          begin
              MessageDlg('Aucune Donn�e � Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
        begin
            FPrintOptionRadeReport.ShowModal;
        end;
end;

procedure TFEtatsRade.BtnRechercheClick(Sender: TObject);
begin
    if EdPeriode1.DateTime = 0 then
        begin
           MessageDlg('Veuillez renseigner une periode',mtWarning,[mbok]);
           EdPeriode1.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
    else
     if EdPeriode2.DateTime = 0 then
        begin
           MessageDlg('Veuillez renseigner une periode',mtWarning,[mbok]);
           EdPeriode2.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
    else
        ShowData;
end;

procedure TFEtatsRade.BtnReinitialiseClick(Sender: TObject);
begin
    ClearData;
    query := '' ;
    DBGrid.DataSource.DataSet.Close;
end;

procedure TFEtatsRade.ClearData;
  begin
      EdPeriode1.DateTime := 0;
      EdPeriode2.DateTime := 0;
      DBLConsignataire.KeyValue := null;
      DBLTypeNavire.KeyValue := null;
      DBLNavire.KeyValue := null;
      CBFacturePAL.ItemIndex := -1;
      CBFactureInt.ItemIndex := -1;
      PanRowCount.Caption := '0';
      query:= '' ;
  end;
  procedure TFEtatsRade.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
    PanRowCount.Caption := IntToStr(DBGrid.DataSource.DataSet.RecordCount) ;
end;

procedure TFEtatsRade.ShowData;
  begin

     filter:=' order by ref desc , debut desc ' ;
        //FILTRE SUR PERIODE
      if (EdPeriode1.DateTime <> 0) and (EdPeriode1.DateTime <> 0) then
          begin
            filter_periode := ' AND (DATE(R.debut) between '''+ msqlDateTime(EdPeriode1) +'''and '''+ msqlDateTime(EdPeriode2) +''')';
            title_periode :=  'ENTRE LE '+ EdPeriode1.Text+ ' ET LE '+ EdPeriode2.Text
          end
      else
         begin
             filter_periode := ''  ;
             title_periode :='' ;
         end;

        //FILTRE CONSIGNATAIRE
     if DBLConsignataire.KeyValue = null then
          begin
              filter_consign := '';
              title_consign := '';
          end
      else
          begin
              filter_consign := ' AND R.consignataire ='+ IntToStr(DBLConsignataire.KeyValue) ;
              title_consign := ' DU CONSIGNATAIRE '+ DBLConsignataire.Text;
          end;

      //FILTRE TYPE NAVIRE
      if DBLTypeNavire.KeyValue = null then
          begin
              filter_TypeNave := '' ;
              title_typeNav := '';
          end
      else
          begin
              filter_TypeNave := ' AND N.type_navire ='+IntToStr(DBLTypeNavire.KeyValue);
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
              filter_navire :=' AND R.navire ='+ IntToStr(DBLNavire.KeyValue);
              title_navire := DBLNavire.Text;
          end;

      //FILTRE FACTURE PAL
       if  CBFacturePAL.Text = '' then
          begin
             filter_fact_pal := '';
             title_factPAL := '';
          end
      else if CBFacturePAL.Text = 'OUI' then
          begin
             filter_fact_pal :=' AND facturer_pal = TRUE';
             title_factPAL := 'OUI';
          end
      else if CBFacturePAL.Text = 'NON' then
          begin
            filter_fact_pal :=' AND facturer_pal = FALSE';
            title_factPAL := 'NON';
          end;




      //FILTRE FACTURE INTERNE
      if  CBFactureInt.Text = '' then
          begin
              filter_fact_int := '';
              title_factInt := '';
          end
      else if CBFactureInt.Text = 'OUI' then
          begin
              filter_fact_int :=' AND facturer_int = TRUE';
              title_factInt := 'OUI';
          end
      else if CBFactureInt.Text = 'NON' then
          begin
              filter_fact_int :=' AND facturer_int = FALSE';
              title_factInt := 'NON';
          end;

      exercice_filter := ' AND R.exercice='''+ IdExerciceInst +'''';


     init_query:= 'SELECT * ,CONCAT(R.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_ex,  DATEDIFF( R.fin , R.debut)+1 AS sejour, CEILING((DATEDIFF( R.fin , R.debut)+1)/X.nombre_jour_taux_rade) as qte, '#13+
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
                    ' WHERE R.id is not null ';

      title_main := 'ETAT DES NAVIRES EN RADE ';

      query:=init_query + filter_periode  + filter_consign + filter_TypeNave + filter_navire  +filter_fact_pal + filter_fact_int + filter;
      title_report := title_main + title_periode + title_consign;

      ExQuery(DM.DQ_Grid_Rade, query);
//      DM.DQ_Grid_Rade.Close;
//      DM.DQ_Grid_Rade.SQL.Clear;
//      DM.DQ_Grid_Rade.SQL.Text := query;
//      DM.DQ_Grid_Rade.sql.SaveToFile('D:\Now2.sql');
//      DM.DQ_Grid_Rade.Open;

  end;

procedure TFEtatsRade.UniButton1Click(Sender: TObject);
begin
 UniForm2.ShowModal;
end;

procedure TFEtatsRade.UniFormShow(Sender: TObject);
begin
    LoadDBLConsignataire;
    LoadDBLTypeNavire;
    LoadDBLNavire;
    ClearData;
    DM.DQ_Grid_Rade.Close;
end;

end.

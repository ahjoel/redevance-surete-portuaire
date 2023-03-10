unit UEtatsEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGroupBox, uniPanel, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniLabel, uniDateTimePicker, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniRadioGroup, uniButton, uniStatusBar,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TFEtatsEscale = class(TUniForm)
    MainContainer: TUniContainerPanel;
    DBGrid: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    GBPeriode: TUniGroupBox;
    EdPeriode1: TUniDateTimePicker;
    EdPeriode2: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    GBConsignataire: TUniGroupBox;
    DBLConsignataire: TUniDBLookupComboBox;
    GBInstaPost: TUniGroupBox;
    DBLInstallationPort: TUniDBLookupComboBox;
    GBObs: TUniGroupBox;
    DBLObs: TUniDBLookupComboBox;
    GBTypeNav: TUniGroupBox;
    DBLTypeNavire: TUniDBLookupComboBox;
    GBFacturable: TUniGroupBox;
    CBFacturable: TUniComboBox;
    DBLPostQuai: TUniDBLookupComboBox;
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
    frxDBDataset: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset_sum: TfrxDBDataset;
    frxReport_group: TfrxReport;
    UniPanel2: TUniPanel;
    procedure UniFormShow(Sender: TObject);
    procedure DBLInstallationPortChange(Sender: TObject);
    procedure BtnRechercheClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnReinitialiseClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
  private
    { Private declarations }
    procedure ClearData;
  public
    { Public declarations }
    procedure ShowData;
  end;

function FEtatsEscale: TFEtatsEscale;

var
    filter, search, init_query, query:string;
    exercice_filter, filter_periode , filter_consign, filter_TypeNave, filter_IP, filter_poste, filter_navire, filter_obs, filter_facturable, filter_fact_pal, filter_fact_int :string;
    group_filter : string;


    //REPORT TITLES VARIABLES
    title_report, title_main, title_periode, title_consign, title_typeNav, title_instPort, title_postQuai, title_navire, title_obs, title_statut, title_factPAL, title_factInt : string;


implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, ULoadData, UFunction, UReport,
  UPrintOptionEscaleReport;

function FEtatsEscale: TFEtatsEscale;
begin
  Result := TFEtatsEscale(DM.GetFormInstance(TFEtatsEscale));
end;

procedure TFEtatsEscale.BtnReinitialiseClick(Sender: TObject);
begin
    ClearData;
    DBGrid.DataSource.DataSet.Close;
end;

procedure TFEtatsEscale.ClearData;
  begin
      EdPeriode1.DateTime := 0;
      EdPeriode2.DateTime := 0;
      DBLConsignataire.KeyValue := null;
      DBLTypeNavire.KeyValue := null;
      DBLInstallationPort.KeyValue := null;
      DBLPostQuai.KeyValue := null;
      DBLNavire.KeyValue := null;
      DBLObs.KeyValue := null;
      CBFacturable.ItemIndex := -1;
      CBFacturePAL.ItemIndex := -1;
      CBFactureInt.ItemIndex := -1;
      PanRowCount.Caption := '0';
      query:= '' ;
  end;


procedure TFEtatsEscale.UniFormShow(Sender: TObject);
begin
    LoadDBLConsignataire;
    LoadDBLTypeNavire;
    LoadDBLInstallationPort;
    LoadDBLObs;
    LoadDBLNavire;
    ClearData;
    DM.DQ_Grid_Escale.Close;


end;


procedure TFEtatsEscale.BtnPrintClick(Sender: TObject);
begin

if ( (query.IsEmpty = True)OR (DBGrid.DataSource.DataSet.RecordCount=0)) then
          begin
              MessageDlg('Aucune Donn?e ? Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
        begin
            FPrintOptionEscaleReport.ShowModal;
        end;
end;

procedure TFEtatsEscale.BtnRechercheClick(Sender: TObject);
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

procedure TFEtatsEscale.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
    PanRowCount.Caption := IntToStr(DBGrid.DataSource.DataSet.RecordCount) ;
end;

procedure TFEtatsEscale.DBLInstallationPortChange(Sender: TObject);
begin
      if DBLInstallationPort.KeyValue <> null then
      begin
        DBLDataLoad(DM.DQ_DBL_PQ,'SELECT * FROM poste_quai P, installation_port I WHERE P.ip_pq=I.id_ip AND  P.ip_pq=' + IntToStr(DBLInstallationPort.KeyValue));
      end
      else
      begin
        DM.DQ_DBL_PQ.Close;
      end;
end;

procedure TFEtatsEscale.ShowData;
  begin
     filter:=' order by ref desc , date_accost desc ' ;

      //FILTRE SUR PERIODE
      if (EdPeriode1.DateTime <> 0) and (EdPeriode1.DateTime <> 0) then
          begin
            filter_periode := ' AND (DATE(E.date_accost) between '''+ msqlDateTime(EdPeriode1) +'''and '''+ msqlDateTime(EdPeriode2) +''')'  ;
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
              filter_consign := ' AND E.consignataire ='+ IntToStr(DBLConsignataire.KeyValue) ;
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

      //FILTRE INSTALLATION PORTUAIRE
      if DBLInstallationPort.KeyValue = null then
          begin
              filter_IP := '';
              title_instPort := '';
          end
      else
          begin
              filter_IP := ' AND Q.ip_pq ='+ IntToStr(DBLInstallationPort.KeyValue);
              title_instPort := DBLInstallationPort.Text;
          end;

      //FILTRE POSTE A QUAI
      if DBLPostQuai.KeyValue=null then
          begin
             filter_poste := '';
             title_postQuai := '';
          end
      else
          begin
              filter_poste :=' AND E.post_quai ='+ IntToStr(DBLPostQuai.KeyValue);
              title_postQuai :=  DBLPostQuai.Text;
          end;

      //FILTRE NAVIRE
      if DBLNavire.KeyValue=null  then
          begin
              filter_navire := '';
              title_navire := '';
          end
      else
          begin
              filter_navire :=' AND E.navire ='+ IntToStr(DBLNavire.KeyValue);
              title_navire := DBLNavire.Text;
          end;


      //FILTRE OBSERVATION
       if DBLObs.KeyValue=null  then
          begin
              filter_obs := '';
              title_obs := '';
          end
      else
          begin
              filter_obs :=' AND E.observation ='+ IntToStr(DBLObs.KeyValue);
              title_obs := DBLObs.Text;
          end;


      //FILTRE FACTURABLE
      if  CBFacturable.Text = '' then
          begin
             filter_facturable := '';
             title_statut := '';
          end
      else if CBFacturable.Text = 'OUI' then
          begin
              filter_facturable :=' AND facturable_obs = TRUE';
              title_statut := 'OUI';
          end
      else if CBFacturable.Text = 'NON' then
          begin
            filter_facturable :=' AND facturable_obs = FALSE';
            title_statut := 'NON';
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



      //exercice_filter := ' AND E.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT * , CONCAT(E.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_ex, case WHEN facturable_obs=TRUE THEN ''F'' ELSE ''N''	end as statut , '#13+
                   ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                   ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                   ' case WHEN facturer_int = ''''  THEN ''N''  ELSE ''O''	end as fact_int , '#13+
                   ' case WHEN facturer_pal = '''' THEN ''N''  ELSE ''O''	end as fact_pal , '#13+
                   ' case WHEN rapport= True THEN ''O'' ELSE ''''	end as rapport_esc ,  '#13+
                   ' po.libelle_port as orgine ,pd.libelle_port as destination , '#13+
                   ' us.login_user as user_saisie , uc.login_user as user_control , uv.login_user as user_validation '#13+
                   ' FROM escale E  '#13+
                   'INNER JOIN port as po on E.port_orgine=po.id_port '#13+
                   'LEFT JOIN port as pd on E.port_dest=pd.id_port '#13+
                   'INNER JOIN user as us on E. user_create=us.id_user '#13+
                   'LEFT JOIN user as uc on E.user_control=uc.id_user '#13+
                   'LEFT JOIN user as uv on E.user_validate=uv.id_user '#13+
                   'INNER JOIN consignataire C on E.consignataire=C.id_consignataire '#13+
                   'INNER JOIN navire  N on E.navire=N.id_navire '#13+
                   'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                   'INNER JOIN installation_port I on Q.ip_pq=I.id_ip '#13+
                   'INNER JOIN exercice Z on E.exercice=Z.id_exercice '#13+
                   'INNER JOIN observation O on E.observation=O.id_obs '#13+
                   'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                    ' WHERE E.id is not null ';


      title_main := 'ETAT DES NAVIRES ACCOSTES ';

      query:=init_query + filter_periode  + filter_IP + filter_poste + filter_consign + filter_TypeNave + filter_navire + filter_facturable +filter_fact_pal + filter_fact_int+ filter_obs + exercice_filter + filter;
      title_report := title_main + title_periode + title_consign;

      ExQuery(DM.DQ_Grid_Escale, query )
//      DM.DQ_Grid_Escale.Close;
//      DM.DQ_Grid_Escale.SQL.Clear;
//      DM.DQ_Grid_Escale.SQL.Text := query;
//      //DM.DQ_Grid_Escale.sql.SaveToFile('D:\Now.sql');
//      DM.DQ_Grid_Escale.Open;

  end;



end.

unit UReglement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  uniButton, uniPanel, uniGUIBaseClasses;

type
  TFReglements = class(TUniForm)
    MainContainer: TUniContainerPanel;
    PanOp: TUniPanel;
    BtnDel: TUniButton;
    BtnUpdate: TUniButton;
    BtnAdd: TUniButton;
    EdSearch: TUniEdit;
    UniLabel1: TUniLabel;
    BtnValidate: TUniButton;
    BtnControl: TUniButton;
    DBGrid: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel2: TUniPanel;
    PanRowCount: TUniPanel;
    procedure BtnAddClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure EdSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
  end;

function FReglements: TFReglements;
var
    filter, search, init_query, query:string;
    exercice_filter :string;
    title :string = 'REGLEMENT';
    FrmMode, FrmModeTitle : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEditReglement, UGlobal, UFunction,
  UProject_Function;

function FReglements: TFReglements;
begin
  Result := TFReglements(DM.GetFormInstance(TFReglements));
end;

procedure TFReglements.DBGridRecordCount(Sender: TUniDBGrid;
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

procedure TFReglements.EdSearchChange(Sender: TObject);
begin
    ShowData;
end;

procedure TFReglements.ShowData;
  begin
      filter:=' order by date_regle desc  ' ;

      if EdSearch.IsBlank then search:='' else

      search:=' AND (UPPER(F.ref_facture_pal) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND R.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT R.id_regle, R.date_regle,F.id_factures_pal, F.ref_facture_pal, T.code_type_fact, F.date_emise_facture_pal,  '#13+
                   ' FLOOR (F.montant_facture_pal * 655.957) AS montant_xof , '#13+
                   ' R.montant_regle, S.nom_consignataire as cons_f, C.nom_consignataire as cons_r, '#13+
                   ' case WHEN R.date_control_regle is null THEN '''' ELSE ''O''	end as control,  '#13+
                   ' case WHEN R.date_validate_regle is null THEN '''' ELSE ''O''	end AS validation'#13+
                   ' FROM reglement R  '#13+
                   ' INNER JOIN facture_pal F ON R.facture_regle=F.id_factures_pal '#13+
                   ' INNER JOIN type_facture T ON F.type_facture=T.id_type_fact '#13+
                   ' INNER JOIN consignataire C ON F.consignataire_facture_pal = C.id_consignataire '#13+
                   ' INNER JOIN consignataire S ON R.consignataire_regle = S.id_consignataire '#13+
                   ' WHERE R.id_regle IS NOT NULL ';

      query:=init_query + exercice_filter + search+ filter;

      DM.DQ_Grid_Reglement.Close;
      DM.DQ_Grid_Reglement.SQL.Clear;
      DM.DQ_Grid_Reglement.SQL.Text := query;
      DM.DQ_Grid_Reglement.Open;
  end;

procedure TFReglements.UniFormShow(Sender: TObject);
begin
    ShowData;
end;

procedure TFReglements.BtnAddClick(Sender: TObject);
begin
    FEditReglement.EditContext := FormContext;
    FEditReglement.FmContext := AddContext;

    FEditReglement.Caption := FrmEditTitle(title, AddTitle);
    FEditReglement.ShowModal;
end;

end.

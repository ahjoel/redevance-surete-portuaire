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
    procedure BtnControlClick(Sender: TObject);
    procedure DBGridSelectionChange(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure BtnValidateClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateLoadData;
  public
    { Public declarations }
    procedure ShowData;
  end;

function FReglements: TFReglements;
var
    filter, search, init_query, query, query_fact:string;
    exercice_filter :string;
    title :string = 'REGLEMENTS';
    FrmMode, FrmModeTitle : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEditReglement, UGlobal, UFunction,
  UProject_Function, UEditRade, ULoadData;

function FReglements: TFReglements;
begin
  Result := TFReglements(DM.GetFormInstance(TFReglements));
end;

procedure TFReglements.UpdateLoadData;
begin
    //UPDATE CHECK VARIABLES
   FEditReglement.id_reg :=DM.QStand.FieldValues['id_regle'];
   FEditReglement.id_fact :=DM.QCheck.FieldValues['id_factures_pal'];

   //UPDATE LOAD_DATA FACTURE
   FEditReglement.EdFacture.Text := DM.QCheck.FieldValues['ref_fact'];
   FEditReglement.EdConsignataire.Text := DM.QCheck.FieldValues['cons_fact'];
   FEditReglement.EdEmmissionFact.Text := DM.QCheck.FieldValues['date_emise_facture_pal'];
   FEditReglement.EdEcheanceFact.Text := DM.QCheck.FieldValues['date_ech_facture_pal'];
   FEditReglement.EdTypeFact.Text := DM.QCheck.FieldValues['code_type_fact'];
   FEditReglement.EdMontantFact.Text := DM.QCheck.FieldValues['montant_xof'];
   FEditReglement.EdMontReg.Text := DM.QCheck.FieldValues['mont_regle'];
   FEditReglement.EdMontSolde.Text := DM.QCheck.FieldValues['mont_solde'];


   FEditReglement.EdReg.Text :=DM.QStand.FieldValues['montant_regle'];
   FEditReglement.EdDateReg.Text :=DM.QStand.FieldValues['date_regle'];
   FEditReglement.DBLConsignataire.KeyValue := DM.QStand.FieldValues['id_cons_reg'];

end;

procedure TFReglements.BtnControlClick(Sender: TObject);
begin
  FEditReglement.Caption := FrmEditTitle(title, ControlTitle);

    FEditReglement.ShowModal;
    FEditReglement.BtnSave.Caption := ControlBtnCaption;
    FEditReglement.BtnSave.IconCls := 'check2';
    FEditReglement.FmContext := ControlContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add(init_query_select_reg + ' AND R.id_regle ='+DBGrid.DataSource.DataSet.FieldByName('id_regle').AsString);
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
                // REQUETE DE RECUPERATION DES INFORMATION DE LA FACTURE
               query_fact := init_query_select_fact + ' AND L.id_factures_pal= '+DM.QStand.FieldByName('id_factures_pal').AsString;
               ExQuery(DM.QCheck, query_fact);

               FEditReglement.ShowModal;


               UpdateLoadData;

               //ENABLE DATA


               //DISABLE CONTROLS
               FEditReglement.edRechDateEm.DateTime := 0;
               FEditReglement.Group_rech.Enabled:= False;

               FEditReglement.Group_infos.Enabled:= False;

               FEditReglement.Group_reg.Enabled:= False;

           end

           else
end;

procedure TFReglements.BtnUpdateClick(Sender: TObject);
begin
    FEditReglement.Caption := FrmEditTitle(title, UpdateTitle);

    FEditReglement.ShowModal;
    FEditReglement.FmContext := UpdateContext;
    FEditReglement.BtnSave.Caption := UpdateBtnCaption;
    FEditReglement.BtnSave.IconCls := 'compose';


     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add(init_query_select_reg + ' AND R.id_regle ='+DBGrid.DataSource.DataSet.FieldByName('id_regle').AsString);
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
                // REQUETE DE RECUPERATION DES INFORMATION DE LA FACTURE
               query_fact := init_query_select_fact + ' AND L.id_factures_pal= '+DM.QStand.FieldByName('id_factures_pal').AsString;
               ExQuery(DM.QCheck, query_fact);

               FEditReglement.ShowModal;

               UpdateLoadData;

           end

           else
end;

procedure TFReglements.BtnValidateClick(Sender: TObject);
begin
    FEditReglement.Caption := FrmEditTitle(title, ValidateTitle);

    FEditReglement.ShowModal;
    FEditReglement.BtnSave.Caption := ValidatBtnCaption;
    FEditReglement.BtnSave.IconCls := 'check';
    FEditReglement.FmContext := ValidatContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add(init_query_select_reg + ' AND R.id_regle ='+DBGrid.DataSource.DataSet.FieldByName('id_regle').AsString);
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
                // REQUETE DE RECUPERATION DES INFORMATION DE LA FACTURE
               query_fact := init_query_select_fact + ' AND L.id_factures_pal= '+DM.QStand.FieldByName('id_factures_pal').AsString;
               ExQuery(DM.QCheck, query_fact);

               FEditReglement.ShowModal;


               UpdateLoadData;

               //ENABLE DATA


               //DISABLE CONTROLS
               FEditReglement.edRechDateEm.DateTime := 0;
               FEditReglement.Group_rech.Enabled:= False;

               FEditReglement.Group_infos.Enabled:= False;

               FEditReglement.Group_reg.Enabled:= False;

           end

           else
end;

procedure TFReglements.DBGridDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
 if DBGrid.DataSource.DataSet.FieldByName('rapport_control').AsInteger = 1 then
      Attribs.Color:= clWebLemonChiffon
    else
    if DBGrid.DataSource.DataSet.FieldByName('rapport_validate').AsInteger = 1 then
      Attribs.Color:= clWebLightSalmon
    else
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

procedure TFReglements.DBGridSelectionChange(Sender: TObject);
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

procedure TFReglements.EdSearchChange(Sender: TObject);
begin
    ShowData;
end;

procedure TFReglements.ShowData;
  begin
      filter:=' order by X.date_regle desc  ' ;

      if EdSearch.IsBlank then search:='' else

      search:=' AND (UPPER(X.ref_facture_pal) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND X.exercice='''+ IdExerciceInst +'''';

      query:=init_query_reg + exercice_filter + search+ filter;

      DM.DQ_Grid_Reglement.Close;
      DM.DQ_Grid_Reglement.SQL.Clear;
      DM.DQ_Grid_Reglement.SQL.Text := query;
      DM.DQ_Grid_Reglement.Open;
  end;

procedure TFReglements.UniFormShow(Sender: TObject);
begin
    PanTitle.Caption := FrmPanTitle(title, FrmModeTitle, LibExerciceInst);
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

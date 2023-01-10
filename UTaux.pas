unit UTaux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniLabel, uniEdit, uniPanel,
  uniGUIBaseClasses, uniPageControl, uniDateTimePicker;

type
  TFTaux = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    PageOperation: TUniTabSheet;
    PageRade: TUniTabSheet;
    PanTitle: TUniPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    BtnAddTauxOpe: TUniButton;
    BtnUpdateTauxOpe: TUniButton;
    BtnDeleteTauxOpe: TUniButton;
    DBGrid_TauxOpe: TUniDBGrid;
    UniContainerPanel3: TUniContainerPanel;
    UniPanel4: TUniPanel;
    BtnAddTauxRade: TUniButton;
    BtnUpdateTauxRade: TUniButton;
    BtnDeleteTauxRade: TUniButton;
    DBGrid_TauxRade: TUniDBGrid;
    BtnEndTauxOpe: TUniButton;
    BtnEndTauxRade: TUniButton;
    UniPanel1: TUniPanel;
    procedure UniFormShow(Sender: TObject);
    procedure DBGrid_TauxOpeRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure DBGrid_TauxRadeRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure BtnAddTauxOpeClick(Sender: TObject);
    procedure BtnEndTauxOpeClick(Sender: TObject);
    procedure BtnAddTauxRadeClick(Sender: TObject);
    procedure BtnEndTauxRadeClick(Sender: TObject);
    procedure DBGrid_TauxRadeSelectionChange(Sender: TObject);
    procedure DBGrid_TauxOpeDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure DBGrid_TauxRadeDrawColumnCell(Sender: TObject; ACol,
      ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
  private
    { Private declarations }
    procedure UpdateLoadDataMarch;
    procedure UpdateLoadDataRade;
  public
    { Public declarations }
    procedure ShowDataTauxOpe;
    procedure ClearDataTauxOpe;

    procedure ShowDataTauxRade;
    procedure ClearDataTauxRade;

    var
    id_TauxMarch, code_TauxMarch, lib_TauxMarch, debut_TauxMarch, fin_TauxMarch: string;
    id_TauxRade, code_TauxRade, lib_TauxRade, ip_TauxRade, debut_TauxRade, fin_TauxRade : string;
    FmContextTauxMarch : string;
    FmContextTauxRade: string;


  end;

function FTaux: TFTaux;

var
    filter_TauxMarch, search_TauxMarch, init_query_TauxMarch, query_TauxMarch:string;
    title_TauxMarch :string = 'Taux Opérations';

    filter_TauxRade, search_TauxRade, init_query_TauxRade, query_TauxRade:string;
    title_TauxRade :string = 'Taux Rade';

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, UDataLaod, UGlobal, UFunction,
  UEditTauxMarchandise, UEditTauxRade;

function FTaux: TFTaux;
begin
  Result := TFTaux(DM.GetFormInstance(TFTaux));
end;


procedure TFTaux.UpdateLoadDataMarch;
begin
    //UPDATE CHECK VARIABLES
   FEditTauxMarchandise.id_TauxMarch :=DM.QStand.FieldValues['id'];
   FEditTauxMarchandise.ope_TauxMarch :=DM.QStand.FieldValues['operation_taux'];

   //UPDATE LOAD_DATA
   FEditTauxMarchandise.DBLOperation.KeyValue :=DM.QStand.FieldValues['operation_taux'];
   FEditTauxMarchandise.EdMontantTauxMarch.Text :=DM.QStand.FieldValues['taux_euro'];
   FEditTauxMarchandise.EdDateDebutTauxMarch.Text :=DM.QStand.FieldValues['date_debut'];

end;


procedure TFTaux.UpdateLoadDataRade;
begin
    //UPDATE CHECK VARIABLES
   FEditTauxRade.id_TauxRade :=DM.QStand.FieldValues['id_taux_rade'];

   //UPDATE LOAD_DATA
   FEditTauxRade.EdNbJours.Value :=DM.QStand.FieldValues['nombre_jour_taux_rade'];
   FEditTauxRade.EdMontantTaux.Text :=DM.QStand.FieldValues['montant_taux_rade'];
    FEditTauxRade.DBLTypeFact.KeyValue :=DM.QStand.FieldValues['type_fact'];
   FEditTauxRade.EdDebut.Text :=DM.QStand.FieldValues['debut_taux_rade'];

end;

procedure TFTaux.BtnAddTauxOpeClick(Sender: TObject);
begin
    FEditTauxMarchandise.EditContext := FormContext;
    FEditTauxMarchandise.FmContext := AddContext;

    FEditTauxMarchandise.Caption := FrmEditTitle(title_TauxMarch, AddTitle);

    FEditTauxMarchandise.EdDateFinTauxMarch.Visible := False;
    FEditTauxMarchandise.LbFin.Visible := False;

    FEditTauxMarchandise.EdDateDebutTauxMarch.UseSystemFormats:= True;
    FEditTauxMarchandise.ShowModal;
end;

procedure TFTaux.BtnAddTauxRadeClick(Sender: TObject);
begin
    FEditTauxRade.FmContext := AddContext;

    FEditTauxRade.Caption := FrmEditTitle(title_TauxRade, AddTitle);

    FEditTauxRade.EdFin.Visible := False;
    FEditTauxRade.LbFin.Visible := False;

    FEditTauxRade.ShowModal;
end;

procedure TFTaux.BtnEndTauxOpeClick(Sender: TObject);
begin
    FEditTauxMarchandise.FmContext := EndUpContext;

    FEditTauxMarchandise.Caption := FrmEditTitle(title_TauxMarch, EnUpTitle);

    FEditTauxMarchandise.EdDateFinTauxMarch.Visible := True;
    FEditTauxMarchandise.LbFin.Visible := True;


    FEditTauxMarchandise.BtnSave.Caption := EndBtnCaption;
    FEditTauxMarchandise.BtnSave.IconCls := 'retweet';


     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM taux_operation where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid_TauxOpe.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;
     if DM.QStand.RecordCount > 0 then
      begin
        FEditTauxMarchandise.ShowModal;
        UpdateLoadDataMarch;

        FEditTauxMarchandise.DBLOperation.ReadOnly:=True;
        FEditTauxMarchandise.EdDateDebutTauxMarch.ReadOnly:=True;
        FEditTauxMarchandise.EdMontantTauxMarch.ReadOnly:=True;


        FEditTauxMarchandise.DBLOperation.Color:=clWebLemonChiffon;
        FEditTauxMarchandise.EdDateDebutTauxMarch.Color:=clWebLemonChiffon;
        FEditTauxMarchandise.EdMontantTauxMarch.Color:=clWebLemonChiffon;
      end;

end;

procedure TFTaux.BtnEndTauxRadeClick(Sender: TObject);
begin
    FEditTauxRade.FmContext := EndUpContext;

    FEditTauxRade.Caption := FrmEditTitle(title_TauxRade, EnUpTitle);

    FEditTauxRade.EdFin.Visible := True;
    FEditTauxRade.LbFin.Visible := True;
    FEditTauxRade.EdFin.DateTime := 0;


    FEditTauxRade.BtnSave.Caption := EndBtnCaption;
    FEditTauxRade.BtnSave.IconCls := 'retweet';

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM taux_rade where id_taux_rade=:id ');
           Parameters.ParamByName('id').Value:= DBGrid_TauxRade.DataSource.DataSet.FieldByName('id_taux_rade').AsString;
           ExecSQL;
           Open;
           end;
     if DM.QStand.RecordCount > 0 then
      begin
        FEditTauxRade.ShowModal;
        UpdateLoadDataRade;

        FEditTauxRade.EdNbJours.ReadOnly:=True;
        FEditTauxRade.EdDebut.ReadOnly:=True;
        FEditTauxRade.EdMontantTaux.ReadOnly:=True;
        FEditTauxRade.DBLTypeFact.ReadOnly:=True;

        FEditTauxRade.EdNbJours.Color:=clWebLemonChiffon;
        FEditTauxRade.EdDebut.Color:=clWebLemonChiffon;
        FEditTauxRade.EdMontantTaux.Color:=clWebLemonChiffon;
        FEditTauxRade.DBLTypeFact.Color:=clWebLemonChiffon;

      end;


end;

procedure TFTaux.ClearDataTauxOpe;
  begin
//      DBLOperation.KeyValue := null;
//      EdMontantTauxOpe.Value := 0;
//      EdMinTauxOpe.Value := 0;
//      EdMaxTauxOpe.Value := 0;

  end;

procedure TFTaux.ClearDataTauxRade;
  begin
//      EdLibIP.Clear;
//      EdCodeIP.Clear;
  end;


procedure TFTaux.DBGrid_TauxOpeDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
    if DBGrid_TauxOpe.DataSource.DataSet.FieldByName('date_fin').AsString <> '' then
      Attribs.Color:= clWebLightSalmon
    else
end;

procedure TFTaux.DBGrid_TauxOpeRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
   if  DBGrid_TauxOpe.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateTauxOpe.Enabled:=true;
              BtnDeleteTauxOpe.Enabled:=true;
              BtnEndTauxOpe.Enabled:=true;
        end
      else
  if  DBGrid_TauxOpe.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateTauxOpe.Enabled:=False;
            BtnDeleteTauxOpe.Enabled:=False;
            BtnEndTauxOpe.Enabled:=False;
         end;
end;

procedure TFTaux.DBGrid_TauxRadeDrawColumnCell(Sender: TObject; ACol,
  ARow: Integer; Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin
 if DBGrid_TauxRade.DataSource.DataSet.FieldByName('fin_taux_rade').AsString <> '' then
      Attribs.Color:= clWebLightSalmon
    else
end;

procedure TFTaux.DBGrid_TauxRadeRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
   if  DBGrid_TauxRade.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateTauxRade.Enabled:=true;
              BtnDeleteTauxRade.Enabled:=true;
              BtnEndTauxRade.Enabled:=true;
        end
      else
  if  DBGrid_TauxRade.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateTauxRade.Enabled:=False;
            BtnDeleteTauxRade.Enabled:=False;
            BtnEndTauxRade.Enabled:=False;
         end;
end;

procedure TFTaux.DBGrid_TauxRadeSelectionChange(Sender: TObject);
begin
    if DBGrid_TauxRade.DataSource.DataSet.FieldByName('fin_taux_rade').AsString = '' then
    begin
        BtnUpdateTauxOpe.Enabled:=True;
        BtnEndTauxRade.Enabled:=True;
    end
    else
    begin
        BtnUpdateTauxOpe.Enabled:=False;
        BtnEndTauxRade.Enabled:=False;

    end;
end;

procedure TFTaux.ShowDataTauxOpe;
  begin
      filter_TauxMarch:=' order by T.date_debut';

      init_query_TauxMarch:= 'SELECT *, CONCAT( Y.libelle_type_march ," - ", A.libelle_action ) as libelle_ope FROM taux_operation T, operation O, action A, type_marchandise Y WHERE T.operation_taux = O.id_operation '#13+
                              'AND O.action=A.id_action AND O.type_marchandise=Y.id_type_march ';
      query_TauxMarch:=init_query_TauxMarch + search_TauxMarch+ filter_TauxMarch;

      DM.DQ_Grid_TauxOpe.Close;
      DM.DQ_Grid_TauxOpe.SQL.Clear;
      DM.DQ_Grid_TauxOpe.SQL.Text := query_TauxMarch;
      DM.DQ_Grid_TauxOpe.Open;
  end;

procedure TFTaux.ShowDataTauxRade;
  begin
      filter_TauxRade:=' order by debut_taux_rade desc';

      init_query_TauxRade:= 'SELECT * FROM taux_rade T, type_facture F WHERE T.type_fact=F.id_type_fact ' ;
      query_TauxRade:=init_query_TauxRade + search_TauxRade+ filter_TauxRade;

      DM.DQ_Grid_TauxRade.Close;
      DM.DQ_Grid_TauxRade.SQL.Clear;
      DM.DQ_Grid_TauxRade.SQL.Text := query_TauxRade;
      DM.DQ_Grid_TauxRade.Open;
  end;

procedure TFTaux.UniFormShow(Sender: TObject);
begin
  //Taux Marchandise
    FmContextTauxMarch := AddContext;

    DM.DQ_DBL_Ope.Close;
    DM.DQ_DBL_Ope.SQL.Clear;
    DM.DQ_DBL_Ope.SQL.Add('SELECT * , CONCAT( T.libelle_type_march ," - ", A.libelle_action ) as libelle '#13+
                           'FROM operation O, type_marchandise T, action A WHERE O.type_marchandise=T.id_type_march AND O.action=A.id_action');
    DM.DQ_DBL_Ope.Open;

    ShowDataTauxOpe;
//    EdDateDebutTauxMarch.DateTime :=StrToDate('') ;

    BtnAddTauxOpe.Caption := '';
    BtnUpdateTauxOpe.Caption := '';
    BtnDeleteTauxOpe.Caption := '';
    BtnEndTauxOpe.Caption := '';


//Taux Rade
    FmContextTauxRade := AddContext;

    ShowDataTauxRade;

    BtnAddTauxRade.Caption := '';
    BtnUpdateTauxRade.Caption := '';
    BtnDeleteTauxRade.Caption := '';
    BtnEndTauxRade.Caption := '';
end;

end.

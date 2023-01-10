unit UConsignataire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  uniButton, uniPanel, uniGUIBaseClasses;

type
  TFConsignataire = class(TUniForm)
    MainContainer: TUniContainerPanel;
    PanTitle: TUniPanel;
    PanOp: TUniPanel;
    BtnDel: TUniButton;
    BtnUpdate: TUniButton;
    BtnAdd: TUniButton;
    EdSearch: TUniEdit;
    UniLabel1: TUniLabel;
    DBGrid: TUniDBGrid;
    UniContainerPanel2: TUniContainerPanel;
    BtnExport: TUniButton;
    BtnPrint: TUniButton;
    PanRowCount: TUniPanel;
    procedure BtnAddClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure EdSearchChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
   procedure ShowData;

  end;


function FConsignataire: TFConsignataire;

var
    filter, search, init_query, query:string;
    title :string = 'Consignataire';



implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEditConsignataire, UGlobal, UFunction;

procedure TFConsignataire.BtnUpdateClick(Sender: TObject);
begin

    FEditConsignataire.Caption := FrmEditTitle(title, UpdateTitle);

    FEditConsignataire.ShowModal;
    FEditConsignataire.FmContext := UpdateContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM consignataire where id_consignataire=:id_consignataire ');
           Parameters.ParamByName('id_consignataire').Value:= DBGrid.DataSource.DataSet.FieldByName('id_consignataire').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditConsignataire.ShowModal;

               FEditConsignataire.id_cons:=DM.QStand.FieldValues['id_consignataire'];
               FEditConsignataire.code_cons :=DM.QStand.FieldValues['code_consignataire'];
               FEditConsignataire.nom_cons :=DM.QStand.FieldValues['nom_consignataire'];


               FEditConsignataire.EdCode.Text :=DM.QStand.FieldValues['code_consignataire'];
               FEditConsignataire.EdNom.Text :=DM.QStand.FieldValues['nom_consignataire'];
               FEditConsignataire.EdContacts.Text :=DM.QStand.FieldValues['contact_consignataire'];
               FEditConsignataire.EdAdresse.Text :=DM.QStand.FieldValues['adresse_consignataire'];
               FEditConsignataire.EdEmail.Text :=DM.QStand.FieldValues['email_consignataire'];
           end

           else


end;

procedure TFConsignataire.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
if  DM.DQ_Grid_Consignataire.RecordCount=0 then
      begin
            BtnUpdate.Enabled:=False;
            BtnDel.Enabled:=False;
      end
    else
       begin
          BtnUpdate.Enabled:=true;
          BtnDel.Enabled:=true;
       end;
end;

procedure TFConsignataire.EdSearchChange(Sender: TObject);
begin
  ShowData ;
end;

procedure TFConsignataire.ShowData;
  begin
      filter:=' order by nom_consignataire';

      if EdSearch.IsBlank then search:='' else
      search:=' AND (UPPER(nom_consignataire) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';


      init_query:= 'SELECT * FROM consignataire WHERE id_consignataire IS NOT NULL' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_Consignataire.Close;
      DM.DQ_Grid_Consignataire.SQL.Clear;
      DM.DQ_Grid_Consignataire.SQL.Text := query;
      DM.DQ_Grid_Consignataire.Open;

      PanRowCount.Caption := IntToStr(DM.DQ_Grid_Consignataire.RecordCount) ;

  end;




procedure TFConsignataire.UniFormShow(Sender: TObject);
begin
  ShowData();

end;

function FConsignataire: TFConsignataire;
begin
  Result := TFConsignataire(DM.GetFormInstance(TFConsignataire));
end;


procedure TFConsignataire.BtnAddClick(Sender: TObject);
begin
    FEditConsignataire.EditContext := FormContext;
    FEditConsignataire.FmContext := AddContext;

    FEditConsignataire.Caption := FrmEditTitle(title, AddTitle);
    FEditConsignataire.ShowModal;
end;

end.

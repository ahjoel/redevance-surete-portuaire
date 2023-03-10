unit UMarchandise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniLabel, uniEdit, uniPanel,
  uniGUIBaseClasses;

type
  TFMarchandise = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    EdCode: TUniEdit;
    EdLibelle: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    DBLType: TUniDBLookupComboBox;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    UniPanel2: TUniPanel;
    BtnAdd: TUniButton;
    BtnUpdate: TUniButton;
    BtnDelete: TUniButton;
    DBGrid: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
    var
    id_March, code_March, lib_March, type_March: string;
    FmContext : string;
  end;

function FMarchandise: TFMarchandise;
var
    filter, search, init_query, query:string;
    title :string = '';

implementation

{$R *.dfm}
uses
  MainModule, uniGUIApplication, ServerModule, UDataLaod, UFunction, UGlobal,
  UTypeMarchandise, Main;



function FMarchandise: TFMarchandise;
begin
  Result := TFMarchandise(DM.GetFormInstance(TFMarchandise));
end;

procedure TFMarchandise.BtnAddClick(Sender: TObject);
begin
FmContext := AddContext;
  EdCode.Clear;
  EdLibelle.Clear;
  DBLType.KeyValue := null;
  EdCode.JSInterface.JSCall('focus' ,[]);
end;

procedure TFMarchandise.BtnCancelClick(Sender: TObject);
begin
FmContext := AddContext;
  EdCode.Clear;
  EdLibelle.Clear;
  DBLType.KeyValue := null;
  EdCode.JSInterface.JSCall('focus' ,[]);
end;

procedure TFMarchandise.BtnSaveClick(Sender: TObject);
begin
//INSERT
  if FmContext = AddContext then
      begin

        if EdCode.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
                 EdCode.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from marchandise where code_marchandise=:code_marchandise');
                   Parameters.ParamByName('code_marchandise').Value:=EdCode.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Marchandise poss?de dej? ce Code',mtError,[mbok]);
                       EdCode.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdLibelle.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell?',mtWarning,[mbok]);
                 EdLibelle.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from marchandise where libelle_marchandise=:libelle_marchandise');
                   Parameters.ParamByName('libelle_marchandise').Value:=EdLibelle.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Marchandise poss?de dej? ce Libell?',mtError,[mbok]);
                       EdLibelle.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

              if DBLType.IsBlank then
                  begin
                     MessageDlg('Veuillez s?lectionner  le Type ',mtWarning,[mbok]);
                     DBLType.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
              else

              begin
                    MessageDlg('Voulez-vous enregister ?', mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('INSERT INTO marchandise (code_marchandise, libelle_marchandise, type_marchandise ) Values (:code, :libelle, :type  )');
                                                  Parameters.ParamByName('code').Value:= EdCode.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                                  Parameters.ParamByName('type').Value:= DBLType.KeyValue;
                                                  ExecSQL;
                                              end;
                                             EdCode.Clear;
                                             EdLibelle.Clear  ;
                                             DBLType.KeyValue:= null;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_marchandise) from marchandise');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu?',mtConfirmation,[mbok]);
                                             ShowData;
                                             DM.DQ_Grid_March.Locate('id_marchandise',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
  if FmContext = UpdateContext then
    begin
      if EdCode.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdCode.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCode.Text <> code_March) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from marchandise where code_marchandise=:code_marchandise');
                       Parameters.ParamByName('code_marchandise').Value:=EdCode.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Marchandise poss?de dej? ce Code',mtError,[mbok]);
                           EdCode.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdLibelle.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell?',mtWarning,[mbok]);
               EdLibelle.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibelle.Text <> lib_March) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from marchandise where libelle_marchandise=:libelle_marchandise');
                       Parameters.ParamByName('libelle_marchandise').Value:=EdLibelle.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Marchandise dej? ce Libell?',mtError,[mbok]);
                           EdLibelle.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        if DBLType.IsBlank then
            begin
               MessageDlg('Veuillez s?lectionner le Type',mtWarning,[mbok]);
               DBLType.JSInterface.JSCall('focus' ,[]);
               Abort;
            end;


        begin
              MessageDlg('Voulez-vous enregister les modifications ?', mtConfirmation, mbYesNo,
                    procedure(Sender: TComponent; Res: Integer)
                    begin
                      case Res of
                        mrYes :
                            begin
                                  with DM.QUpdate do
                                        begin
                                            SQL.Text := ('UPDATE marchandise SET code_marchandise=:code, libelle_marchandise=:libelle, type_marchandise=:type  WHERE id_marchandise=:id ');
                                            Parameters.ParamByName('id').Value:= id_March;
                                            Parameters.ParamByName('code').Value:= EdCode.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                            Parameters.ParamByName('type').Value:= DBLType.KeyValue;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu?e',mtConfirmation,[mbok]);
                                       ShowData;
                                       DM.DQ_Grid_March.Locate('id_marchandise',id_March,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFMarchandise.BtnUpdateClick(Sender: TObject);
begin
 FmContext := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM marchandise where id_marchandise=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_marchandise').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_March:=DM.QStand.FieldValues['id_marchandise'];
               code_March :=DM.QStand.FieldValues['code_marchandise'];
               lib_March :=DM.QStand.FieldValues['libelle_marchandise'];
               type_March :=DM.QStand.FieldValues['type_marchandise'];


               EdCode.Text :=DM.QStand.FieldValues['code_marchandise'];
               EdLibelle.Text :=DM.QStand.FieldValues['libelle_marchandise'];
               DBLType.KeyValue :=DM.QStand.FieldValues['type_marchandise'];
           end
end;

procedure TFMarchandise.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
  if  DBGrid.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdate.Enabled:=true;
              BtnDelete.Enabled:=true;
        end
      else
  if  DBGrid.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdate.Enabled:=False;
            BtnDelete.Enabled:=False;
         end;
end;

procedure TFMarchandise.ShowData;
  begin
      filter:=' order by libelle_marchandise';

      init_query:= 'SELECT * FROM marchandise M, type_marchandise T, unite_mesure U WHERE M.type_marchandise=T.id_type_march AND T.unite= U.id_unite ' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_March.Close;
      DM.DQ_Grid_March.SQL.Clear;
      DM.DQ_Grid_March.SQL.Text := query;
      DM.DQ_Grid_March.Open;
  end;

procedure TFMarchandise.UniFormShow(Sender: TObject);
begin
  DM.DQ_DBL_TM.Close;
  DM.DQ_DBL_TM.SQL.Clear;
  DM.DQ_DBL_TM.SQL.Add('SELECT * FROM type_marchandise WHERE id_type_march is not null order by libelle_type_march');
  DM.DQ_DBL_TM.Open;


FmContext := AddContext;

BtnAdd.Caption := '';
BtnUpdate.Caption := '';
BtnDelete.Caption := '';

ShowData;
end;

end.

unit UOperation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniLabel, uniEdit, uniPanel,
  uniGUIBaseClasses;

type
  TFOperation = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    EdLibelle: TUniEdit;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    UniPanel2: TUniPanel;
    BtnAdd: TUniButton;
    BtnUpdate: TUniButton;
    BtnDelete: TUniButton;
    DBGrid: TUniDBGrid;
    UniLabel4: TUniLabel;
    DBLType: TUniDBLookupComboBox;
    DBLAct: TUniDBLookupComboBox;
    procedure UniFormShow(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure DBLTypeChangeValue(Sender: TObject);
    procedure DBLActChangeValue(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
    var
    id_Ope, nature_Ope, Ope, OpeUp, action_Ope, type_March,Lib_Ope: string;
    FmContext : string;
  end;

function FOperation: TFOperation;
var
    filter, search, init_query, query:string;
    title :string = '';

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, UDataLaod, UFunction, UGlobal, ULoadData;




function FOperation: TFOperation;
begin
  Result := TFOperation(DM.GetFormInstance(TFOperation));
end;

procedure TFOperation.BtnAddClick(Sender: TObject);
begin
  FmContext := AddContext;
  DBLType.KeyValue := null;
  DBLAct.KeyValue := null;
  EdLibelle.Clear;
  DBLType.JSInterface.JSCall('focus' ,[]);
end;

procedure TFOperation.BtnCancelClick(Sender: TObject);
begin
  FmContext := AddContext;
  DBLType.KeyValue := null;
  DBLAct.KeyValue := null;
  EdLibelle.Clear;
  DBLType.JSInterface.JSCall('focus' ,[]);
end;

procedure TFOperation.BtnSaveClick(Sender: TObject);
begin
  //INSERT
  if FmContext = AddContext then
      begin
        if DBLType.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner le Type de Marchandise ',mtWarning,[mbok]);
                     DBLType.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
              else

        if DBLAct.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner le Mouvement ',mtWarning,[mbok]);
                     DBLAct.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
              else

        with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from operation where action=:action AND type_marchandise=:type_marchandise');
                   Parameters.ParamByName('action').Value:=DBLAct.KeyValue;
                   Parameters.ParamByName('type_marchandise').Value:=DBLType.KeyValue;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Op�ration D�ja repertori�e ',mtError,[mbok]);
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
                                                  SQL.Text := ('INSERT INTO operation (action, type_marchandise ) Values (:action, :type  )');
                                                  Parameters.ParamByName('action').Value:= DBLAct.KeyValue;
                                                  Parameters.ParamByName('type').Value:= DBLType.KeyValue;
                                                  ExecSQL;
                                              end;
                                             DBLType.KeyValue:= null;
                                             DBLAct.KeyValue:= null;
                                             EdLibelle.Clear  ;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_operation) from operation');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowData;
                                             DM.DQ_Grid_Ope.Locate('id_operation',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
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
      if DBLType.IsBlank then
            begin
               MessageDlg('Veuillez s�lectionner le Type de Marchandise',mtWarning,[mbok]);
               DBLType.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if DBLAct.IsBlank then
            begin
               MessageDlg('Veuillez s�lectionner l''Action',mtWarning,[mbok]);
               DBLAct.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;



       if (EdLibelle.Text <> Lib_Ope) then
           begin
                with  DM.QCheck do
                begin
                     close;
                     SQL.Clear;
                     sql.add('select * from operation where action=:action AND type_marchandise=:type_marchandise');
                     Parameters.ParamByName('action').Value:=DBLAct.KeyValue;
                     Parameters.ParamByName('type_marchandise').Value:=DBLType.KeyValue;
                     ExecSQL;
                     Open;
                end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Op�ration D�ja repertori�e ',mtError,[mbok]);
                           EdLibelle.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
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
                                            SQL.Text := ('UPDATE operation SET  type_marchandise=:type, action=:action  WHERE id_operation=:id ');
                                            Parameters.ParamByName('id').Value:= id_Ope;
                                            Parameters.ParamByName('type').Value:= DBLType.KeyValue;
                                            Parameters.ParamByName('action').Value:= DBLAct.KeyValue;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowData;
                                       DM.DQ_Grid_Ope.Locate('id_operation',id_Ope,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFOperation.BtnUpdateClick(Sender: TObject);
begin
FmContext := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * , CONCAT( T.libelle_type_march ," - ", A.libelle_action ) as libelle, CONCAT( T.code_type_march ," - ", A.code_action ) as code '#13+
                    'FROM operation O, type_marchandise T, action A WHERE O.type_marchandise=T.id_type_march AND O.action=A.id_action AND O.id_operation=:id' );
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_operation').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_Ope:=DM.QStand.FieldValues['id_operation'];
               Lib_Ope := DM.QStand.FieldValues['libelle'];
               action_Ope :=DM.QStand.FieldValues['action'];
               type_March :=DM.QStand.FieldValues['type_marchandise'];


               DBLAct.KeyValue :=DM.QStand.FieldValues['action'];
               DBLType.KeyValue :=DM.QStand.FieldValues['type_marchandise'];
               EdLibelle.Text := DM.QStand.FieldValues['libelle'];
           end
end;

procedure TFOperation.DBGridRecordCount(Sender: TUniDBGrid;
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

procedure TFOperation.DBLActChangeValue(Sender: TObject);
begin
EdLibelle.Text := FusionEdit(DBLType.Text, DBLAct.Text);
end;

procedure TFOperation.DBLTypeChangeValue(Sender: TObject);
begin
EdLibelle.Text := FusionEdit(DBLType.Text, DBLAct.Text);
end;

procedure TFOperation.ShowData;
  begin
      filter:=' order by libelle';

      init_query:= 'SELECT * , CONCAT( T.libelle_type_march ," - ", A.libelle_action ) as libelle, CONCAT( T.code_type_march ," - ", A.code_action ) as code '#13+
                    'FROM operation O, type_marchandise T, action A WHERE O.type_marchandise=T.id_type_march AND O.action=A.id_action' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_Ope.Close;
      DM.DQ_Grid_Ope.SQL.Clear;
      DM.DQ_Grid_Ope.SQL.Text := query;
      DM.DQ_Grid_Ope.Open;
  end;

procedure TFOperation.UniFormShow(Sender: TObject);
begin
  LoadDBLTypeMarchandise;

  //ACTION DBK
  LoadDBLAction;


FmContext := AddContext;

BtnAdd.Caption := '';
BtnUpdate.Caption := '';
BtnDelete.Caption := '';

ShowData;
end;

end.

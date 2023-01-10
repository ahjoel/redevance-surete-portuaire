unit UUniteMesure;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniBasicGrid,
  uniDBGrid, uniButton, uniLabel, uniEdit;

type
  TFUniteMesure = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    BtnAdd: TUniButton;
    BtnUpdate: TUniButton;
    BtnSave: TUniButton;
    BtnCancel: TUniButton;
    BtnDelete: TUniButton;
    EdCode: TUniEdit;
    EdDesc: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    DBGrid: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
    var
    id_UM, code_UM, desc_UM : string;
    FmContext : string;
  end;

function FUniteMesure: TFUniteMesure;

var
    filter, search, init_query, query:string;
    title :string = 'Unité Mesure';

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UFunction, UGlobal, UConsignataire, Main;

procedure TFUniteMesure.ShowData;
  begin
      filter:=' order by code_unite';

      init_query:= 'SELECT * FROM unite_mesure WHERE id_unite IS NOT NULL' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_UM.Close;
      DM.DQ_Grid_UM.SQL.Clear;
      DM.DQ_Grid_UM.SQL.Text := query;
      DM.DQ_Grid_UM.Open;
  end;

procedure TFUniteMesure.BtnAddClick(Sender: TObject);
begin
  FmContext := AddContext;
  EdCode.Clear;
  EdDesc.Clear;
  EdCode.JSInterface.JSCall('focus' ,[]);

end;

procedure TFUniteMesure.BtnCancelClick(Sender: TObject);
begin
  FmContext := AddContext;
  EdCode.Clear;
  EdDesc.Clear;
  EdCode.JSInterface.JSCall('focus' ,[]);
end;

procedure TFUniteMesure.BtnDeleteClick(Sender: TObject);
begin
   with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from unite_mesure U, type_marchandise T  where U.id_unite=T.unite AND  T.unite=:id_unite');
                   Parameters.ParamByName('id_unite').Value:=DBGrid.DataSource.DataSet.FieldByName('id_unite').AsString;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Donnée referencée, Suppression impossible',mtError,[mbok]);
                       Abort;
                   end
              else

              begin

                    MessageDlg('Voulez-vous Supprimer '+DBGrid.DataSource.DataSet.FieldByName('description_unite').AsString , mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('DELETE FROM unite_mesure WHERE id_unite=:id');
                                                  Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_unite').AsString;
                                                  ExecSQL;
                                              end;
                                             ShowData;
                                end
                            end ;
                          end
                        );
              end;
end;

procedure TFUniteMesure.BtnSaveClick(Sender: TObject);
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
                   sql.add('select * from unite_mesure where code_unite=:code_unite');
                   Parameters.ParamByName('code_unite').Value:=EdCode.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Unité de Mesure posséde dejà ce Code',mtError,[mbok]);
                       EdCode.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdDesc.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner la Description',mtWarning,[mbok]);
                 EdDesc.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from unite_mesure where description_unite=:description_unite');
                   Parameters.ParamByName('description_unite').Value:=EdDesc.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Unité de Mesure posséde dejà cette Description',mtError,[mbok]);
                       EdDesc.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO unite_mesure (code_unite, description_unite ) Values (:code, :Desc)');
                                                  Parameters.ParamByName('code').Value:= EdCode.Text;
                                                  Parameters.ParamByName('Desc').Value:= EdDesc.Text;
                                                  ExecSQL;
                                              end;
                                             EdCode.Clear;
                                             EdDesc.Clear  ;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_unite) from unite_mesure');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectué',mtConfirmation,[mbok]);
                                             ShowData;
                                             DM.DQ_Grid_UM.Locate('id_unite',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
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

      if (EdCode.Text <> code_UM) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from unite_mesure where code_unite=:code_unite');
                       Parameters.ParamByName('code_unite').Value:=EdCode.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Unité de Mesure posséde dejà ce Code',mtError,[mbok]);
                           EdCode.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdDesc.IsBlank then
            begin
               MessageDlg('Veuillez renseigner la Description',mtWarning,[mbok]);
               EdDesc.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdDesc.Text <> desc_UM) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from unite_mesure where description_unite=:description_unite');
                       Parameters.ParamByName('description_unite').Value:=EdDesc.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Unité de Mesure posséde dejà cette Description',mtError,[mbok]);
                           EdDesc.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        begin
              MessageDlg('Voulez-vous enregister les modifications ?', mtConfirmation, mbYesNo,
                    procedure(Sender: TComponent; Res: Integer)
                    begin
                      case Res of
                        mrYes :
                            begin
                                  with DM.QUpdate do
                                        begin
                                            SQL.Text := ('UPDATE unite_mesure SET code_unite=:code, description_unite=:nom WHERE id_unite=:id ');
                                            Parameters.ParamByName('id').Value:= id_UM;
                                            Parameters.ParamByName('code').Value:= EdCode.Text;
                                            Parameters.ParamByName('nom').Value:= EdDesc.Text;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectuée',mtConfirmation,[mbok]);
                                       ShowData;
                                       DM.DQ_Grid_UM.Locate('id_unite',id_UM,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end


end;

procedure TFUniteMesure.BtnUpdateClick(Sender: TObject);
begin
FmContext := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM unite_mesure where id_unite=:id_unite ');
           Parameters.ParamByName('id_unite').Value:= DBGrid.DataSource.DataSet.FieldByName('id_unite').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_UM:=DM.QStand.FieldValues['id_unite'];
               code_UM :=DM.QStand.FieldValues['code_unite'];
               desc_UM :=DM.QStand.FieldValues['description_unite'];


               EdCode.Text :=DM.QStand.FieldValues['code_unite'];
               EdDesc.Text :=DM.QStand.FieldValues['description_unite'];
           end
end;

procedure TFUniteMesure.DBGridRecordCount(Sender: TUniDBGrid;
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



function FUniteMesure: TFUniteMesure;
begin
  Result := TFUniteMesure(DM.GetFormInstance(TFUniteMesure));
end;

procedure TFUniteMesure.UniFormShow(Sender: TObject);
begin
FmContext := AddContext;

BtnAdd.Caption := '';
BtnUpdate.Caption := '';
BtnDelete.Caption := '';

ShowData;
end;

end.

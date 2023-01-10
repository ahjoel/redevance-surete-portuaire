unit UTypeMarchandise;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  uniButton, uniPanel, uniGUIBaseClasses, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox;

type
  TFTypeMarchandise = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    EdCode: TUniEdit;
    EdLibelle: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniPanel2: TUniPanel;
    BtnAdd: TUniButton;
    BtnUpdate: TUniButton;
    BtnDelete: TUniButton;
    UniLabel3: TUniLabel;
    DBLUnite: TUniDBLookupComboBox;
    DBGrid: TUniDBGrid;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    procedure UniFormShow(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
    procedure ClearData;
    var
    id_TM, code_TM, lib_TM, unite_TM: string;
    FmContext : string;
  end;

function FTypeMarchandise: TFTypeMarchandise;

var
    filter, search, init_query, query:string;
    title :string = 'Unit� Mesure';

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UFunction, UGlobal, ULoadData;

  procedure TFTypeMarchandise.BtnAddClick(Sender: TObject);
begin
  FmContext := AddContext;
  ClearData;
  EdCode.JSInterface.JSCall('focus' ,[]);
end;

procedure TFTypeMarchandise.BtnCancelClick(Sender: TObject);
begin
  FmContext := AddContext;
  EdCode.Clear;
  EdLibelle.Clear;
  DBLUnite.KeyValue := null;
  EdCode.JSInterface.JSCall('focus' ,[]);
end;

procedure TFTypeMarchandise.BtnDeleteClick(Sender: TObject);
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
                       MessageDlg('Donn�e referenc�e, Suppression impossible',mtError,[mbok]);
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

procedure TFTypeMarchandise.BtnSaveClick(Sender: TObject);
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
                   sql.add('select * from type_marchandise where code_type_march=:code_type_march');
                   Parameters.ParamByName('code_type_march').Value:=EdCode.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Type de Marchandise poss�de dej� ce Code',mtError,[mbok]);
                       EdCode.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdLibelle.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibelle.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from type_marchandise where libelle_type_march=:libelle_type_march');
                   Parameters.ParamByName('libelle_type_march').Value:=EdLibelle.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Type de Marchandise poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibelle.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

              if DBLUnite.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner  la Mesure ',mtWarning,[mbok]);
                     DBLUnite.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO type_marchandise (code_type_march, libelle_type_march, unite ) Values (:code, :libelle, :unite  )');
                                                  Parameters.ParamByName('code').Value:= EdCode.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                                  Parameters.ParamByName('unite').Value:= DBLUnite.KeyValue;
                                                  ExecSQL;
                                              end;
                                             EdCode.Clear;
                                             EdLibelle.Clear  ;
                                             DBLUnite.KeyValue:= null;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_type_march) from type_marchandise');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowData;
                                             DM.DQ_Grid_TM.Locate('id_type_march',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                             LoadDBLPerms;

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

      if (EdCode.Text <> code_TM) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from type_marchandise where code_type_march=:code_type_march');
                       Parameters.ParamByName('code_type_march').Value:=EdCode.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Type de Marchandise poss�de dej� ce Code',mtError,[mbok]);
                           EdCode.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdLibelle.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
               EdLibelle.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibelle.Text <> lib_TM) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from type_marchandise where libelle_type_march=:libelle_type_march');
                       Parameters.ParamByName('libelle_type_march').Value:=EdLibelle.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Type de Marchandise dej� ce Libell�',mtError,[mbok]);
                           EdLibelle.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        if DBLUnite.IsBlank then
            begin
               MessageDlg('Veuillez s�lectionner  la Mesure ',mtWarning,[mbok]);
               DBLUnite.JSInterface.JSCall('focus' ,[]);
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
                                            SQL.Text := ('UPDATE type_marchandise SET code_type_march=:code, libelle_type_march=:libelle, unite=:unite  WHERE id_type_march=:id ');
                                            Parameters.ParamByName('id').Value:= id_TM;
                                            Parameters.ParamByName('code').Value:= EdCode.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                            Parameters.ParamByName('unite').Value:= DBLUnite.KeyValue;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowData;
                                       DM.DQ_Grid_TM.Locate('id_type_march',id_TM,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFTypeMarchandise.BtnUpdateClick(Sender: TObject);
begin
  FmContext := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM type_marchandise where id_type_march=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_type_march').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_TM:=DM.QStand.FieldValues['id_type_march'];
               code_TM :=DM.QStand.FieldValues['code_type_march'];
               lib_TM :=DM.QStand.FieldValues['libelle_type_march'];
               unite_TM :=DM.QStand.FieldValues['unite'];


               EdCode.Text :=DM.QStand.FieldValues['code_type_march'];
               EdLibelle.Text :=DM.QStand.FieldValues['libelle_type_march'];
               DBLUnite.KeyValue :=DM.QStand.FieldValues['unite'];
           end
end;

procedure TFTypeMarchandise.DBGridRecordCount(Sender: TUniDBGrid;
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

procedure TFTypeMarchandise.ClearData;
  begin
     EdCode.Clear;
      EdLibelle.Clear;
      DBLUnite.KeyValue := null;
  end;

procedure TFTypeMarchandise.ShowData;
  begin
      filter:=' order by code_type_march';

      init_query:= 'SELECT * FROM type_marchandise T, unite_mesure U WHERE T.unite= U.id_unite ' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_TM.Close;
      DM.DQ_Grid_TM.SQL.Clear;
      DM.DQ_Grid_TM.SQL.Text := query;
      DM.DQ_Grid_TM.Open;
  end;

function FTypeMarchandise: TFTypeMarchandise;
begin
  Result := TFTypeMarchandise(DM.GetFormInstance(TFTypeMarchandise));
end;

procedure TFTypeMarchandise.UniFormShow(Sender: TObject);
begin
LoadDBLUniteMesure;

FmContext := AddContext;

BtnAdd.Caption := '';
BtnUpdate.Caption := '';
BtnDelete.Caption := '';

ShowData;
end;

end.

unit UTypeNavire;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniButton, uniMultiItem,
  uniComboBox, uniDBComboBox, uniDBLookupComboBox, uniLabel, uniEdit, uniPanel,
  uniGUIBaseClasses, uniRadioGroup;

type
  TFTypeNavire = class(TUniForm)
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
    DBGrid: TUniDBGrid;
    UniSimplePanel1: TUniSimplePanel;
    BtnSave: TUniButton;
    BtnCancel: TUniButton;
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
    procedure ClearData;
    var
    id_TN, code_TN, lib_TN, fact_TN: string;
    FmContext : string;
  end;

function FTypeNavire: TFTypeNavire;
var
    filter, search, init_query, query:string;
    title :string = 'Unité Mesure';

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, UDataLaod, UFunction, UGlobal;


procedure TFTypeNavire.ShowData;
  begin
      filter:=' order by libelle_type_nav ';

      init_query:= 'SELECT *,case WHEN facturable_type_nav=TRUE THEN ''OUI'' ELSE ''NON''	end as statut FROM type_navire ' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_TypeNav.Close;
      DM.DQ_Grid_TypeNav.SQL.Clear;
      DM.DQ_Grid_TypeNav.SQL.Text := query;
      DM.DQ_Grid_TypeNav.Open;
  end;

procedure TFTypeNavire.UniFormShow(Sender: TObject);
begin
FmContext := AddContext;

BtnAdd.Caption := '';
BtnUpdate.Caption := '';
BtnDelete.Caption := '';

ShowData;
end;

procedure TFTypeNavire.BtnAddClick(Sender: TObject);
begin
  FmContext := AddContext;
  ClearData;
  EdLibelle.JSInterface.JSCall('focus' ,[]);
end;

procedure TFTypeNavire.BtnCancelClick(Sender: TObject);
begin
  FmContext := AddContext;
  ClearData;
  EdLibelle.JSInterface.JSCall('focus' ,[]);
end;

procedure TFTypeNavire.BtnDeleteClick(Sender: TObject);
begin
     with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from type_navire T, navire N where T.id_type_nav=N.type_navire AND  T.id_type_nav=:id_type_nav');
                   Parameters.ParamByName('id_type_nav').Value:=DBGrid.DataSource.DataSet.FieldByName('id_type_nav').AsString;
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

                    MessageDlg('Voulez-vous Supprimer '+DBGrid.DataSource.DataSet.FieldByName('libelle_type_nav').AsString , mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('DELETE FROM type_navire WHERE id_type_nav=:id');
                                                  Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_type_nav').AsString;
                                                  ExecSQL;
                                              end;
                                             ShowData;
                                end
                            end ;
                          end
                        );
              end;
end;

procedure TFTypeNavire.BtnSaveClick(Sender: TObject);
begin
//INSERT
  if FmContext = AddContext then
      begin
        if EdLibelle.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libellé',mtWarning,[mbok]);
                 EdLibelle.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from type_navire where libelle_type_nav=:libelle_type_nav');
                   Parameters.ParamByName('libelle_type_nav').Value:=EdLibelle.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Type de Navire posséde dejà ce Libellé',mtError,[mbok]);
                       EdLibelle.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

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
                   sql.add('select * from type_navire where code_type_nav=:code_type_nav');
                   Parameters.ParamByName('code_type_nav').Value:=EdCode.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Type de Navire posséde dejà ce Code',mtError,[mbok]);
                       EdCode.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO type_navire (code_type_nav, libelle_type_nav ) Values (:code, :libelle )');
                                                  Parameters.ParamByName('code').Value:= EdCode.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                                  ExecSQL;
                                              end;
                                             ClearData;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_type_nav) from type_navire');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectué',mtConfirmation,[mbok]);
                                             ShowData;
                                             DM.DQ_Grid_TypeNav.Locate('id_type_nav',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
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
      if EdLibelle.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libellé',mtWarning,[mbok]);
               EdLibelle.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibelle.Text <> lib_TN) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from type_navire where libelle_type_nav=:libelle_type_nav');
                       Parameters.ParamByName('libelle_type_nav').Value:=EdLibelle.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Type de Navire dejà ce Libellé',mtError,[mbok]);
                           EdLibelle.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

      if EdCode.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdCode.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCode.Text <> code_TN) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from type_navire where code_type_nav=:code_type_nav');
                       Parameters.ParamByName('code_type_nav').Value:=EdCode.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Type de Navire posséde dejà ce Code',mtError,[mbok]);
                           EdCode.JSInterface.JSCall('focus' ,[]);
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
                                            SQL.Text := ('UPDATE type_navire SET code_type_nav=:code, libelle_type_nav=:libelle  WHERE id_type_nav=:id ');
                                            Parameters.ParamByName('id').Value:= id_TN;
                                            Parameters.ParamByName('code').Value:= EdCode.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectuée',mtConfirmation,[mbok]);
                                       ShowData;
                                       DM.DQ_Grid_TypeNav.Locate('id_type_nav',id_TN,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFTypeNavire.BtnUpdateClick(Sender: TObject);
begin
  FmContext := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM type_navire where id_type_nav=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_type_nav').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               id_TN:=DM.QStand.FieldValues['id_type_nav'];
               lib_TN :=DM.QStand.FieldValues['libelle_type_nav'];
               code_TN :=DM.QStand.FieldValues['code_type_nav'];

               EdLibelle.Text :=DM.QStand.FieldValues['libelle_type_nav'];
               EdCode.Text :=DM.QStand.FieldValues['code_type_nav'];
           end
end;

procedure TFTypeNavire.ClearData;
  begin
      EdLibelle.Clear;
      EdCode.Clear;
  end;

procedure TFTypeNavire.DBGridRecordCount(Sender: TUniDBGrid;
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

function FTypeNavire: TFTypeNavire;
begin
  Result := TFTypeNavire(DM.GetFormInstance(TFTypeNavire));
end;



end.

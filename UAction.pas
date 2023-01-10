unit UAction;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniTabControl, uniPanel,
  uniPageControl, uniBasicGrid, uniDBGrid, uniLabel, uniEdit, uniButton,
  uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox;

type
  TFAction = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    PageAction: TUniTabSheet;
    PageNature: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    BtnSaveAct: TUniButton;
    BtnCancelAct: TUniButton;
    EdCodeAct: TUniEdit;
    EdLibAct: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniPanel2: TUniPanel;
    BtnAddAct: TUniButton;
    BtnUpdateAct: TUniButton;
    BtnDeleteAct: TUniButton;
    UniContainerPanel3: TUniContainerPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    BtSaveNat: TUniButton;
    BtCancelNat: TUniButton;
    EdCodeNat: TUniEdit;
    EdLibNat: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniPanel5: TUniPanel;
    BtnAddNat: TUniButton;
    BtnUpdateNat: TUniButton;
    BtnDeleteNat: TUniButton;
    DBGridNature: TUniDBGrid;
    DBLNatureAct: TUniDBLookupComboBox;
    UniLabel5: TUniLabel;
    DBGridAction: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure DBGridActionRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure DBGridNatureRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure BtSaveNatClick(Sender: TObject);
    procedure BtnUpdateNatClick(Sender: TObject);
    procedure BtnAddNatClick(Sender: TObject);
    procedure BtCancelNatClick(Sender: TObject);
    procedure PageActionBeforeActivate(Sender: TObject;
      var AllowActivate: Boolean);
    procedure BtnDeleteNatClick(Sender: TObject);
    procedure BtnSaveActClick(Sender: TObject);
    procedure BtnAddActClick(Sender: TObject);
    procedure BtnCancelActClick(Sender: TObject);
    procedure BtnUpdateActClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowDataAction;
    procedure ShowDataNature;
    var
    id_Act, code_Act, lib_Act, nature_Act: string;
    id_Nat, code_Nat, lib_Nat: string;
    FmContextAct : string;
    FmContextNat : string;

  end;

function FAction: TFAction;

var
    filter_act, search_act, init_query_act, query_act:string;
    filter_nat, search_nat, init_query_nat, query_nat:string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UDataLaod, UFunction, UGlobal;

function FAction: TFAction;
begin
  Result := TFAction(DM.GetFormInstance(TFAction));
end;

procedure TFAction.ShowDataAction;
  begin
      filter_act:=' order by libelle_action';

      init_query_act:= 'SELECT * FROM action A, nature N WHERE A.nature= N.id_nature ' ;
      query_act:=init_query_act + search_act+ filter_act;

      DM.DQ_Grid_Action.Close;
      DM.DQ_Grid_Action.SQL.Clear;
      DM.DQ_Grid_Action.SQL.Text := query_act;
      DM.DQ_Grid_Action.Open;
  end;

procedure TFAction.ShowDataNature;
  begin
      filter_nat:=' order by libelle_nature';

      init_query_nat:= 'SELECT * FROM nature WHERE id_nature is not null ' ;
      query_nat:=init_query_nat + search_nat+ filter_nat;

      DM.DQ_Grid_Nature.Close;
      DM.DQ_Grid_Nature.SQL.Clear;
      DM.DQ_Grid_Nature.SQL.Text := query_nat;
      DM.DQ_Grid_Nature.Open;
  end;


procedure TFAction.BtnAddActClick(Sender: TObject);
begin
  FmContextAct := AddContext;
  EdCodeAct.Clear;
  EdLibAct.Clear;
  DBLNatureAct.KeyValue := null;
  EdLibAct.JSInterface.JSCall('focus' ,[]);
end;

procedure TFAction.BtnAddNatClick(Sender: TObject);
begin
  FmContextNat := AddContext;
  EdCodeNat.Clear;
  EdLibNat.Clear;
  EdLibNat.JSInterface.JSCall('focus' ,[]);
end;

procedure TFAction.BtnCancelActClick(Sender: TObject);
begin
  FmContextAct := AddContext;
  EdCodeAct.Clear;
  EdLibAct.Clear;
  DBLNatureAct.KeyValue := null;
  EdLibAct.JSInterface.JSCall('focus' ,[]);
end;

procedure TFAction.BtnDeleteNatClick(Sender: TObject);
begin
  with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from nature N, action A  where N.id_nature=A.nature AND  N.id_nature=:id_nature');
                   Parameters.ParamByName('id_nature').Value:=DBGridNature.DataSource.DataSet.FieldByName('id_nature').AsString;
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

                    MessageDlg('Voulez-vous Supprimer '+DBGridNature.DataSource.DataSet.FieldByName('libelle_nature').AsString , mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('DELETE FROM nature WHERE id_nature=:id');
                                                  Parameters.ParamByName('id').Value:= DBGridNature.DataSource.DataSet.FieldByName('id_nature').AsString;
                                                  ExecSQL;
                                              end;
                                             ShowDataNature;
                                end
                            end ;
                          end
                        );
              end;
end;

procedure TFAction.BtnSaveActClick(Sender: TObject);
begin
  //INSERT
  if FmContextAct = AddContext then
      begin

        if EdLibAct.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibAct.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from action where libelle_action=:libelle_action');
                   Parameters.ParamByName('libelle_action').Value:=EdLibAct.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Mouvement poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibAct.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdCodeAct.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
                 EdCodeAct.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from action where code_action=:code_action');
                   Parameters.ParamByName('code_action').Value:=EdCodeAct.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Action poss�de dej� ce Code',mtError,[mbok]);
                       EdCodeAct.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

              if DBLNatureAct.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner  la Nature ',mtWarning,[mbok]);
                     DBLNatureAct.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO action (code_action, libelle_action, nature ) Values (:code, :libelle, :nature  )');
                                                  Parameters.ParamByName('code').Value:= EdCodeAct.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibAct.Text;
                                                  Parameters.ParamByName('nature').Value:= DBLNatureAct.KeyValue;
                                                  ExecSQL;
                                              end;
                                             EdCodeAct.Clear;
                                             EdLibAct.Clear  ;
                                             DBLNatureAct.KeyValue:= null;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_action) from action');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataAction;
                                             DM.DQ_Grid_Action.Locate('id_action',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
  if FmContextAct = UpdateContext then
    begin
      if EdLibAct.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
               EdLibAct.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibAct.Text <> lib_Act) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from action where libelle_action=:libelle_action');
                       Parameters.ParamByName('libelle_action').Value:=EdLibAct.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Action poss�de dej� ce Libell�',mtError,[mbok]);
                           EdLibAct.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdCodeAct.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdCodeAct.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCodeAct.Text <> code_Act) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from action where code_action=:code_action');
                       Parameters.ParamByName('code_action').Value:=EdCodeAct.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Action dej� ce Code',mtError,[mbok]);
                           EdCodeAct.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        if DBLNatureAct.IsBlank then
            begin
               MessageDlg('Veuillez s�lectionner  la Nature ',mtWarning,[mbok]);
               DBLNatureAct.JSInterface.JSCall('focus' ,[]);
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
                                            SQL.Text := ('UPDATE action SET code_action=:code, libelle_action=:libelle, nature=:nature  WHERE id_action=:id ');
                                            Parameters.ParamByName('id').Value:= id_Act;
                                            Parameters.ParamByName('code').Value:= EdCodeAct.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibAct.Text;
                                            Parameters.ParamByName('nature').Value:= DBLNatureAct.KeyValue;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowDataAction;
                                       DM.DQ_Grid_Action.Locate('id_action',id_Act,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFAction.BtnUpdateActClick(Sender: TObject);
begin
    FmContextAct := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM action where id_action=:id ');
           Parameters.ParamByName('id').Value:= DBGridAction.DataSource.DataSet.FieldByName('id_action').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_Act:=DM.QStand.FieldValues['id_action'];
               code_Act :=DM.QStand.FieldValues['code_action'];
               lib_Act :=DM.QStand.FieldValues['libelle_action'];
               nature_Act :=DM.QStand.FieldValues['nature'];


               EdCodeAct.Text :=DM.QStand.FieldValues['code_action'];
               EdLibAct.Text :=DM.QStand.FieldValues['libelle_action'];
               DBLNatureAct.KeyValue :=DM.QStand.FieldValues['nature'];
           end
end;

procedure TFAction.BtnUpdateNatClick(Sender: TObject);
begin
 FmContextNat := UpdateContext;

 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM nature where id_nature=:id ');
           Parameters.ParamByName('id').Value:= DBGridNature.DataSource.DataSet.FieldByName('id_nature').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_Nat:=DM.QStand.FieldValues['id_nature'];
               code_Nat :=DM.QStand.FieldValues['code_nature'];
               lib_Nat :=DM.QStand.FieldValues['libelle_nature'];


               EdCodeNat.Text :=DM.QStand.FieldValues['code_nature'];
               EdLibNat.Text :=DM.QStand.FieldValues['libelle_nature'];
           end
end;

procedure TFAction.DBGridActionRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
begin
  if  DBGridAction.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateAct.Enabled:=true;
              BtnDeleteAct.Enabled:=true;
        end
      else
  if  DBGridAction.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateAct.Enabled:=False;
            BtnDeleteAct.Enabled:=False;
         end;

end;

procedure TFAction.DBGridNatureRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
  if  DBGridNature.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateNat.Enabled:=true;
              BtnDeleteNat.Enabled:=true;
        end
      else
  if  DBGridNature.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateNat.Enabled:=False;
            BtnDeleteNat.Enabled:=False;
         end;
end;

procedure TFAction.PageActionBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
  ShowDataAction ;
  DM.DQ_DBL_Nat.Close;
  DM.DQ_DBL_Nat.SQL.Clear;
  DM.DQ_DBL_Nat.SQL.Add('SELECT * FROM nature WHERE id_nature is not null order by libelle_nature');
  DM.DQ_DBL_Nat.Open;
end;

procedure TFAction.BtSaveNatClick(Sender: TObject);
begin
//INSERT
  if FmContextNat = AddContext then
      begin

        if EdLibNat.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibNat.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from nature where libelle_nature=:libelle_nature');
                   Parameters.ParamByName('libelle_nature').Value:=EdLibNat.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Nature poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibNat.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdCodeNat.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
                 EdCodeNat.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from nature where code_nature=:code_nature');
                   Parameters.ParamByName('code_nature').Value:=EdCodeNat.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Nature poss�de dej� ce Code',mtError,[mbok]);
                       EdCodeNat.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO nature (code_nature, libelle_nature ) Values (:code, :libelle)');
                                                  Parameters.ParamByName('code').Value:= EdCodeNat.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibNat.Text;
                                                  ExecSQL;
                                              end;
                                             EdCodeNat.Clear;
                                             EdLibNat.Clear  ;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_nature) from nature');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataNature;
                                             DM.DQ_Grid_Nature.Locate('id_nature',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
 if FmContextNat = UpdateContext then
    begin
      if EdLibNat.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
               EdLibNat.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibNat.Text <> lib_Nat) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from nature where libelle_nature=:libelle_nature');
                       Parameters.ParamByName('libelle_nature').Value:=EdLibNat.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Nature up poss�de dej� ce Libell�',mtError,[mbok]);
                           EdLibNat.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdCodeNat.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdCodeNat.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCodeNat.Text <> code_Nat) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from nature where code_nature=:code_nature');
                       Parameters.ParamByName('code_nature').Value:=EdCodeNat.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Nature poss�de dej� ce Code ',mtError,[mbok]);
                           EdCodeNat.JSInterface.JSCall('focus' ,[]);
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
                                            SQL.Text := ('UPDATE nature SET code_nature=:code, libelle_nature=:libelle WHERE id_nature=:id ');
                                            Parameters.ParamByName('id').Value:= id_Nat;
                                            Parameters.ParamByName('code').Value:= EdCodeNat.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibNat.Text;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowDataNature;
                                       DM.DQ_Grid_Nature.Locate('id_nature',id_Nat,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFAction.BtCancelNatClick(Sender: TObject);
begin
   FmContextNat := AddContext;
  EdCodeNat.Clear;
  EdLibNat.Clear;
  EdLibNat.JSInterface.JSCall('focus' ,[]);
end;

procedure TFAction.UniFormShow(Sender: TObject);
begin
  //ACTION
    FmContextAct := AddContext;

    DM.DQ_DBL_Nat.Close;
    DM.DQ_DBL_Nat.SQL.Clear;
    DM.DQ_DBL_Nat.SQL.Add('SELECT * FROM nature WHERE id_nature is not null order by libelle_nature');
    DM.DQ_DBL_Nat.Open;

    ShowDataAction;

    BtnAddAct.Caption := '';
    BtnUpdateAct.Caption := '';
    BtnDeleteAct.Caption := '';


  //NATURE
   FmContextNat := AddContext;

   ShowDataNature;

    BtnAddNat.Caption := '';
    BtnUpdateNat.Caption := '';
    BtnDeleteNat.Caption := '';

  end;

end.

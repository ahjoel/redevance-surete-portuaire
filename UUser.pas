unit UUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniEdit,
  uniDateTimePicker, uniButton, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniLabel, uniPanel, uniPageControl, uniGUIBaseClasses,
  uniGroupBox, uniMemo, uniBitBtn, uniSpeedButton;

type
  TFUser = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PUser: TUniPageControl;
    TUser: TUniTabSheet;
    UniContainerPanel2: TUniContainerPanel;
    UniPanel2: TUniPanel;
    UniPanel3: TUniPanel;
    BtnAddUser: TUniButton;
    BtnUpdateUser: TUniButton;
    BtnDeleteUser: TUniButton;
    DBGrid_User: TUniDBGrid;
    TProfil: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    UniPanel1: TUniPanel;
    UniPanel4: TUniPanel;
    BtnAddProfil: TUniButton;
    BtnUpdateProfil: TUniButton;
    BtnDeleteProfil: TUniButton;
    DBGrid_Profil: TUniDBGrid;
    PanTitle: TUniPanel;
    TPerms: TUniTabSheet;
    TAttribut: TUniTabSheet;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniLabel6: TUniLabel;
    EdLastNameUser: TUniEdit;
    EdPassUser: TUniEdit;
    EdFirstNameUser: TUniEdit;
    EdLoginUser: TUniEdit;
    UniSimplePanel1: TUniSimplePanel;
    BtnSaveUser: TUniButton;
    BtnCancelUser: TUniButton;
    UniPanel5: TUniPanel;
    UniPanel6: TUniPanel;
    UniPanel7: TUniPanel;
    UniPanel8: TUniPanel;
    DBGridPerms: TUniDBGrid;
    UniPanel9: TUniPanel;
    EdLibPerms: TUniEdit;
    EdCodePerms: TUniEdit;
    DBLParentPerms: TUniDBLookupComboBox;
    UniSimplePanel2: TUniSimplePanel;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel11: TUniLabel;
    DBGridSousPerms: TUniDBGrid;
    BtnSavePerms: TUniButton;
    BtnCancelPerms: TUniButton;
    UniPanel10: TUniPanel;
    BtnAddPerms: TUniButton;
    BtnUpdatePerms: TUniButton;
    BtnDeletePerms: TUniButton;
    UniSimplePanel3: TUniSimplePanel;
    BtnSaveProfil: TUniButton;
    BtnCancelProfil: TUniButton;
    UniLabel2: TUniLabel;
    UniLabel5: TUniLabel;
    EdLibProfil: TUniEdit;
    EdDescProfil: TUniMemo;
    UniPanel12: TUniPanel;
    UniPanel13: TUniPanel;
    DBGridListAttrib: TUniDBGrid;
    UniPanel17: TUniPanel;
    DBGridListPerms: TUniDBGrid;
    UniPanel16: TUniPanel;
    UniSimplePanel5: TUniSimplePanel;
    DBLProfilAttrib: TUniDBLookupComboBox;
    UniLabel8: TUniLabel;
    UniSimplePanel6: TUniSimplePanel;
    UniLabel7: TUniLabel;
    BtnAddAttrib: TUniSpeedButton;
    BtnDelAttrib: TUniSpeedButton;
    UniLabel12: TUniLabel;
    DBLProfilUser: TUniDBLookupComboBox;
    procedure DBGrid_UserRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure UniFormShow(Sender: TObject);
    procedure BtnSaveUserClick(Sender: TObject);
    procedure BtnUpdateUserClick(Sender: TObject);
    procedure TPermsBeforeActivate(Sender: TObject; var AllowActivate: Boolean);
    procedure DBGridPermsRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnSavePermsClick(Sender: TObject);
    procedure DBGridPermsSelectionChange(Sender: TObject);
    procedure DBGrid_ProfilRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure BtnSaveProfilClick(Sender: TObject);
    procedure BtnUpdateProfilClick(Sender: TObject);
    procedure BtnAddProfilClick(Sender: TObject);
    procedure DBGridListPermsRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure DBGridListAttribRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure BtnAddAttribClick(Sender: TObject);
    procedure DBLProfilAttribChange(Sender: TObject);
    procedure BtnDelAttribClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    procedure ShowDataUser;
    procedure ClearDataUser;

    procedure ShowDataProfil;
    procedure ClearDataProfil;

    procedure ShowDataPerms;
    procedure ClearDataPerms;

    procedure ShowDataHavePerms;
    procedure ClearDataHavePerms;

    var
    id_User, firstName_User, lastName_User, login_User, pass_User, actif_User, create_User : string;
    id_Profil, desc_Profil, lib_Profil : string;
    id_Perms, code_Perms, lib_Perms: string;
    id_HavePerms, user_HavePerms, profil_HavePerms : string;

    FmContextUser : string;
    FmContextProfil: string;
    FmContextPerms: string;
    FmContextHavePerms: string;

  end;

function FUser: TFUser;

var
    filter_User, search_User, init_query_User, query_User:string;
    filter_Profil, search_Profil, init_query_Profil, query_Profil:string;
    filter_Perms, search_Perms, init_query_Perms, query_Perms:string;
    filter_HavePerms, search_HavePerms, init_query_HavePerms, query_HavePerms:string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, ULoadData;

function FUser: TFUser;
begin
  Result := TFUser(DM.GetFormInstance(TFUser));
end;

procedure TFUser.ShowDataUser;
  begin
      filter_User:=' order by last_name_user';

      init_query_User:= 'SELECT *,case 	WHEN actif_user=TRUE THEN ''OUI''	 ELSE ''NON''	end as statut_user FROM User U, profil_user P  WHERE U.profil=P.id_profil ';
      query_User:=init_query_User + search_User+ filter_User;

      DM.DQ_Grid_User.Close;
      DM.DQ_Grid_User.SQL.Clear;
      DM.DQ_Grid_User.SQL.Text := query_User;
      DM.DQ_Grid_User.Open;
  end;

procedure TFUser.TPermsBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
    LoadDBLPerms;
end;

procedure TFUser.UniFormShow(Sender: TObject);
begin
 LoadDBLProfil;

//User
    FmContextUser := AddContext;
    BtnAddUser.Caption := '';
    BtnUpdateUser.Caption := '';
    BtnDeleteUser.Caption := '';
    ShowDataUser;


//Profil
    FmContextProfil := AddContext;
    ClearDataProfil;
    BtnAddProfil.Caption := '';
    BtnUpdateProfil.Caption := '';
    BtnDeleteProfil.Caption := '';
    ShowDataProfil;



  //Perms
    FmContextPerms := AddContext;
    BtnAddPerms.Caption := '';
    BtnUpdatePerms.Caption := '';
    BtnDeletePerms.Caption := '';
    ShowDataPerms;



// HavePerms
    FmContextHavePerms := AddContext;
//    BtnAddUser.Caption := '';
//    BtnUpdateUser.Caption := '';
//    BtnDeleteUser.Caption := '';
//    BtnReplaceUser.Caption := '';
    ShowDataHavePerms;
end;

procedure TFUser.ShowDataProfil;
  begin
      filter_Profil:=' order by libelle_profil';

      init_query_Profil:= 'SELECT * FROM profil_user WHERE id_profil is not null ' ;
      query_Profil:=init_query_Profil + search_Profil+ filter_Profil;

      DM.DQ_Grid_Profil.Close;
      DM.DQ_Grid_Profil.SQL.Clear;
      DM.DQ_Grid_Profil.SQL.Text := query_Profil;
      DM.DQ_Grid_Profil.Open;
  end;


procedure TFUser.ShowDataPerms;
  begin
      filter_Perms:=' order by libelle_perms';

      init_query_Perms:= 'SELECT * FROM permissions WHERE id_perms is not null ' ;
      query_Perms:=init_query_Perms + search_Perms+ filter_Perms;

      DM.DQ_Grid_Perms.Close;
      DM.DQ_Grid_Perms.SQL.Clear;
      DM.DQ_Grid_Perms.SQL.Text := query_Perms;
      DM.DQ_Grid_Perms.Open;
  end;

procedure TFUser.ShowDataHavePerms;
  begin
      //
  end;

procedure TFUser.ClearDataUser;
  begin
      EdFirstNameUser.Clear;
      EdLastNameUser.Clear;
      EdLoginUser.Clear;
      EdPassUser.Clear;
  end;

procedure TFUser.DBGridListAttribRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
     if  DBGridListAttrib.DataSource.DataSet.RecordCount > 0 then
         BtnDelAttrib.Enabled:=true
      else
        BtnDelAttrib.Enabled:=false;
end;

procedure TFUser.DBGridListPermsRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
     if  DBGridListPerms.DataSource.DataSet.RecordCount > 0 then
        BtnAddAttrib.Enabled:=true
      else
        BtnAddAttrib.Enabled:=false;
end;

procedure TFUser.DBGridPermsRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
  if  DBGridPerms.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdatePerms.Enabled:=true;
              BtnDeletePerms.Enabled:=true;
        end
      else
  if  DBGridPerms.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdatePerms.Enabled:=False;
            BtnDeletePerms.Enabled:=False;
         end;
end;

procedure TFUser.DBGridPermsSelectionChange(Sender: TObject);
begin
with DM.DQ_Grid_SousPerms do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM permissions where perms_parent=:id ');
           Parameters.ParamByName('id').Value:= DBGridPerms.DataSource.DataSet.FieldByName('id_perms').AsString;
           ExecSQL;
           Open;
           end;

end;

procedure TFUser.DBGrid_ProfilRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
  if  DBGrid_Profil.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateProfil.Enabled:=true;
              BtnDeleteProfil.Enabled:=true;
        end
      else
  if  DBGrid_Profil.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateProfil.Enabled:=False;
            BtnDeleteProfil.Enabled:=False;
         end;
end;

procedure TFUser.DBGrid_UserRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
 if  DBGrid_User.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateUser.Enabled:=true;
              BtnDeleteUser.Enabled:=true;
        end
      else
  if  DBGrid_User.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateUser.Enabled:=False;
            BtnDeleteUser.Enabled:=False;
         end;

end;

procedure TFUser.DBLProfilAttribChange(Sender: TObject);
begin
     if DBLProfilAttrib.Text <> '' then
    begin
      with DM.DQ_Grid_HavePerms do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM have_perms H, permissions P, profil_user U where H.id_perms=P.id_perms AND H.profil=U.id_profil AND H.profil=:id_profil');
           Parameters.ParamByName('id_profil').Value:= DBLProfilAttrib.KeyValue;
           ExecSQL;
           Open;
           end;
    end
    else
    DM.DQ_Grid_HavePerms.Close;
end;

procedure TFUser.ClearDataProfil;
  begin
     EdLibProfil.Clear;
     EdDescProfil.Clear;
  end;

procedure TFUser.ClearDataPerms;
  begin
    EdLibPerms.Clear;
    EdCodePerms.Clear;
    DBLParentPerms.KeyValue:=null;
  end;


procedure TFUser.BtnAddAttribClick(Sender: TObject);
begin
  if DBGridListPerms.DataSource.DataSet.FieldByName('id_perms').AsString.IsEmpty then
      begin
           MessageDlg('Veuillez Selectionner Une persmission',mtWarning,[mbok]);
           DBGridListPerms.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
  else
  if DBLProfilAttrib.KeyValue = null then
      begin
           MessageDlg('Veuillez Selectionner Un Profil',mtWarning,[mbok]);
           DBLProfilAttrib.JSInterface.JSCall('focus' ,[]);
           Abort;
        end
  else


    with  DM.QCheck do
      begin
           close;
           SQL.Clear;
           sql.add('select * from have_perms H, profil_user U, permissions P where H.profil=U.id_profil AND H.id_perms=P.id_perms AND H.id_perms=:id_perms AND H.profil=:id_profil ');
           Parameters.ParamByName('id_perms').Value:=DBGridListPerms.DataSource.DataSet.FieldByName('id_perms').AsString;
           Parameters.ParamByName('id_profil').Value:=DBLProfilAttrib.KeyValue;
           ExecSQL;
           Open;
      end;
      if DM.QCheck.RecordCount > 0 then
           begin
               MessageDlg('Un Permission deja attribu�e a ce Profil !',mtError,[mbok]);
               DBGridListPerms.JSInterface.JSCall('focus' ,[]);
               Abort;
           end
      else


begin
      MessageDlg('Voulez-vous Attriber cette permission � ce Profile ?', mtConfirmation, mbYesNo,
            procedure(Sender: TComponent; Res: Integer)
            begin
              case Res of
                mrYes :
                    begin
                          with DM.QSave do
                                begin
                                    SQL.Text := ('INSERT INTO have_perms (id_perms, profil ) Values (:perms, :profil )');
                                    Parameters.ParamByName('perms').Value:= DBGridListPerms.DataSource.DataSet.FieldByName('id_perms').AsString;
                                    Parameters.ParamByName('profil').Value:= DBLProfilAttrib.KeyValue;
                                    ExecSQL;
                                end;

                               DBLProfilAttribChange(DBLProfilAttrib);

                               with DM.QMax  do
                                 begin
                                     close;
                                     SQL.Clear;
                                      SQL.Add('select max(id_have_perms) from have_perms');
                                      ExecSQL;
                                     Open;
                                 end;
                               DM.DQ_Grid_HavePerms.Locate('id_have_perms',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                  end
              end ;
            end
          );
              end;






end;

procedure TFUser.BtnAddProfilClick(Sender: TObject);
begin
  FmContextProfil := AddContext;
  ClearDataProfil;
  EdLibProfil.JSInterface.JSCall('focus' ,[]);
end;

procedure TFUser.BtnDelAttribClick(Sender: TObject);
begin
     MessageDlg('Voulez-vous Supprimer cette attribution ? ' , mtConfirmation, mbYesNo,
        procedure(Sender: TComponent; Res: Integer)
        begin
          case Res of
            mrYes :
                begin
                      with DM.QDelete do
                            begin
                                SQL.Text := ('DELETE FROM have_perms WHERE id_have_perms=:id_have_perms');
                                Parameters.ParamByName('id_have_perms').Value:= DBGridListAttrib.DataSource.DataSet.FieldByName('id_have_perms').AsString;
                                ExecSQL;
                            end;


              end ;
          end ;
          DBLProfilAttribChange(DBLProfilAttrib);
        end )  ;


end;

procedure TFUser.BtnSavePermsClick(Sender: TObject);
begin
    //INSERT
  if FmContextPerms = AddContext then
      begin

        if EdLibPerms.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibPerms.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from permissions where libelle_perms=:libelle_perms');
                   Parameters.ParamByName('libelle_perms').Value:=EdLibPerms.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Permissions poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibPerms.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdCodePerms.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdCodePerms.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from permissions where code_perms=:code_perms');
                   Parameters.ParamByName('code_perms').Value:=EdCodePerms.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Permissions poss�de dej� ce Code',mtError,[mbok]);
                       EdCodePerms.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO permissions (code_perms, libelle_perms, perms_parent ) Values (:code, :libelle, :parent  )');
                                                  Parameters.ParamByName('code').Value:= EdCodePerms.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibPerms.Text;
                                                  Parameters.ParamByName('parent').Value:= DBLParentPerms.KeyValue;
                                                  ExecSQL;
                                              end;

                                             ClearDataPerms;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_perms) from permissions');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataPerms;
                                             LoadDBLPerms;
                                             DM.DQ_Grid_Perms.Locate('id_perms',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

////UPDATE
//  if FmContext = UpdateContext then
//    begin
//      if EdCode.IsBlank then
//            begin
//               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
//               EdCode.JSInterface.JSCall('focus' ,[]);
//               Abort;
//            end ;
//
//      if (EdCode.Text <> code_TM) then
//           begin
//               with  DM.QCheck do
//                  begin
//                       close;
//                       SQL.Clear;
//                       sql.add('select * from type_marchandise where code_type_march=:code_type_march');
//                       Parameters.ParamByName('code_type_march').Value:=EdCode.text;
//                       ExecSQL;
//                       Open;
//                  end;
//                  if DM.QCheck.RecordCount > 0 then
//                       begin
//                           MessageDlg('Un Type de Marchandise poss�de dej� ce Code',mtError,[mbok]);
//                           EdCode.JSInterface.JSCall('focus' ,[]);
//                           Abort;
//                       end
//           end ;
//
//       if EdLibelle.IsBlank then
//            begin
//               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
//               EdLibelle.JSInterface.JSCall('focus' ,[]);
//               Abort;
//            end ;
//
//      if (EdLibelle.Text <> lib_TM) then
//           begin
//               with  DM.QCheck do
//                  begin
//                       close;
//                       SQL.Clear;
//                       sql.add('select * from type_marchandise where libelle_type_march=:libelle_type_march');
//                       Parameters.ParamByName('libelle_type_march').Value:=EdLibelle.text;
//                       ExecSQL;
//                       Open;
//                  end;
//                  if DM.QCheck.RecordCount > 0 then
//                       begin
//                           MessageDlg('Un Type de Marchandise dej� ce Libell�',mtError,[mbok]);
//                           EdLibelle.JSInterface.JSCall('focus' ,[]);
//                           Abort;
//                       end
//           end ;
//
//        if DBLUnite.IsBlank then
//            begin
//               MessageDlg('Veuillez s�lectionner  la Mesure ',mtWarning,[mbok]);
//               DBLUnite.JSInterface.JSCall('focus' ,[]);
//               Abort;
//            end;
//
//
//        begin
//              MessageDlg('Voulez-vous enregister les modifications ?', mtConfirmation, mbYesNo,
//                    procedure(Sender: TComponent; Res: Integer)
//                    begin
//                      case Res of
//                        mrYes :
//                            begin
//                                  with DM.QUpdate do
//                                        begin
//                                            SQL.Text := ('UPDATE type_marchandise SET code_type_march=:code, libelle_type_march=:libelle, unite=:unite  WHERE id_type_march=:id ');
//                                            Parameters.ParamByName('id').Value:= id_TM;
//                                            Parameters.ParamByName('code').Value:= EdCode.Text;
//                                            Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
//                                            Parameters.ParamByName('unite').Value:= DBLUnite.KeyValue;
//                                            ExecSQL;
//                                        end;
//
//                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
//                                       ShowData;
//                                       DM.DQ_Grid_TM.Locate('id_type_march',id_TM,[loCaseInsensitive] );
//                          end
//                      end ;
//                    end
//                  );
//        end;
//
//    end
end;

procedure TFUser.BtnSaveProfilClick(Sender: TObject);
begin
    //INSERT
  if FmContextProfil = AddContext then
      begin

          if EdLibProfil.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibProfil.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from profil_user where libelle_profil=:libelle_profil');
                   Parameters.ParamByName('libelle_profil').Value:=EdLibProfil.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Libelle de Profil poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibProfil.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

              if EdDescProfil.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner  la description du Prodfil ',mtWarning,[mbok]);
                     EdDescProfil.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO profil_user (libelle_profil, description_profil ) Values ( :libelle, :description  )');
                                                  Parameters.ParamByName('libelle').Value:= EdLibProfil.Text;
                                                  Parameters.ParamByName('description').Value:= EdDescProfil.Text;
                                                  ExecSQL;
                                              end;

                                             ClearDataProfil;
                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_profil) from profil_user');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataProfil;
                                             DM.DQ_Grid_Profil.Locate('id_profil',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                             LoadDBLPerms;

                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
  if FmContextProfil = UpdateContext then
    begin
     if EdLibProfil.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
               EdLibProfil.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibProfil.Text <> lib_Profil) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from profil_user where libelle_profil=:libelle_profil');
                       Parameters.ParamByName('libelle_profil').Value:=EdLibProfil.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Profil poss�de dej� ce Libell�',mtError,[mbok]);
                           EdLibProfil.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        if EdDescProfil.IsBlank then
            begin
               MessageDlg('Veuillez renseigner  la description du Prodfil ',mtWarning,[mbok]);
               EdDescProfil.JSInterface.JSCall('focus' ,[]);
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
                                            SQL.Text := ('UPDATE profil_user SET libelle_profil=:libelle, description_profil=:description WHERE id_profil=:id ');
                                            Parameters.ParamByName('id').Value:= id_Profil;
                                            Parameters.ParamByName('libelle').Value:= EdLibProfil.Text;
                                            Parameters.ParamByName('description').Value:= EdDescProfil.Text;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowDataProfil;
                                       DM.DQ_Grid_Profil.Locate('id_profil',id_Profil,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFUser.BtnSaveUserClick(Sender: TObject);
begin
   //INSERT
  if FmContextUser = AddContext then
      begin

        if EdLastNameUser.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Nom',mtWarning,[mbok]);
                 EdLastNameUser.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdFirstNameUser.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Pr�noms',mtWarning,[mbok]);
               EdFirstNameUser.JSInterface.JSCall('focus' ,[]);
               Abort;
            end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from user where last_name_user=:last_name_user AND first_name_user=:first_name_user ');
                   Parameters.ParamByName('last_name_user').Value:=EdLastNameUser.text;
                   Parameters.ParamByName('first_name_user').Value:=EdFirstNameUser.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Utilisateur poss�de dej� cette Identit�',mtError,[mbok]);
                       EdLastNameUser.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

            if EdLoginUser.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le login',mtWarning,[mbok]);
               EdLoginUser.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

              if (EdLoginUser.Text <> login_User) then
                   begin
                       with  DM.QCheck do
                          begin
                               close;
                               SQL.Clear;
                               sql.add('select * from user where login_user=:login_user');
                               Parameters.ParamByName('login_user').Value:=EdLoginUser.text;
                               ExecSQL;
                               Open;
                          end;
                          if DM.QCheck.RecordCount > 0 then
                               begin
                                   MessageDlg('Un Utilisateur poss�de dej� ce Login ',mtError,[mbok]);
                                   EdLoginUser.JSInterface.JSCall('focus' ,[]);
                                   Abort;
                               end
                   end ;

               if EdPassUser.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner le Mot de passe',mtWarning,[mbok]);
                     EdPassUser.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
              else


              if DBLProfilUser.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner  le Profil Utilisateur ',mtWarning,[mbok]);
                     DBLProfilUser.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO user (login_user, password_user, last_name_user, first_name_user, profil) Values (:login_user, :password_user, :last_name_user, :first_name_user, :profil )');
                                                  Parameters.ParamByName('login_user').Value:= EdLoginUser.Text;
                                                  Parameters.ParamByName('password_user').Value:= EdPassUser.Text;
                                                  Parameters.ParamByName('last_name_user').Value:= EdLastNameUser.Text;
                                                  Parameters.ParamByName('first_name_user').Value:= EdFirstNameUser.Text;
                                                  Parameters.ParamByName('profil').Value:= DBLProfilUser.KeyValue;
                                                  ExecSQL;
                                              end;
                                             ClearDataUser;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_user) from user');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataUser;
                                             DM.DQ_Grid_User.Locate('id_user',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
 if FmContextUser = UpdateContext then
    begin
      if EdLastNameUser.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Nom',mtWarning,[mbok]);
               EdLastNameUser.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

       if EdFirstNameUser.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Pr�nom',mtWarning,[mbok]);
               EdFirstNameUser.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdFirstNameUser.Text <> firstName_User) OR (EdLastNameUser.Text <> lastName_User) then
           begin
               with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from user where last_name_user=:last_name_user AND first_name_user=:first_name_user ');
                   Parameters.ParamByName('last_name_user').Value:=EdLastNameUser.text;
                   Parameters.ParamByName('first_name_user').Value:=EdFirstNameUser.text;
                   ExecSQL;
                   Open;
              end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Utilisateur poss�de dej� cette Identit� ',mtError,[mbok]);
                           EdLastNameUser.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;


            if DBLProfilUser.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner  le Profil Utilisateur ',mtWarning,[mbok]);
                     DBLProfilUser.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end  ;


        begin
              MessageDlg('Voulez-vous enregister les modifications ?', mtConfirmation, mbYesNo,
                    procedure(Sender: TComponent; Res: Integer)
                    begin
                      case Res of
                        mrYes :
                            begin
                                  with DM.QUpdate do
                                        begin
                                            SQL.Text := ('UPDATE user SET login_user=:login, password_user=:pass, last_name_user=:last_name, first_name_user=:first_name_user, profil=:profil WHERE id_user=:id ');
                                            Parameters.ParamByName('id').Value:= id_User;
                                            Parameters.ParamByName('login').Value:= EdLoginUser.Text;
                                            Parameters.ParamByName('pass').Value:= EdPassUser.Text;
                                            Parameters.ParamByName('last_name').Value:= EdLastNameUser.Text;
                                            Parameters.ParamByName('first_name_user').Value:= EdFirstNameUser.Text;
                                            Parameters.ParamByName('profil').Value:= DBLProfilUser.KeyValue;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowDataUser;
                                       DM.DQ_Grid_User.Locate('id_user',id_User,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFUser.BtnUpdateProfilClick(Sender: TObject);
begin
  FmContextProfil := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM profil_user where id_profil=:id ');
           Parameters.ParamByName('id').Value:= DBGrid_Profil.DataSource.DataSet.FieldByName('id_profil').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_Profil:=DM.QStand.FieldValues['id_profil'];
               lib_Profil :=DM.QStand.FieldValues['libelle_profil'];
               desc_Profil :=DM.QStand.FieldValues['description_profil'];


               EdLibProfil.Text :=DM.QStand.FieldValues['libelle_profil'];
               EdDescProfil.Text :=DM.QStand.FieldValues['description_profil'];
           end
end;

procedure TFUser.BtnUpdateUserClick(Sender: TObject);
begin
FmContextUser := UpdateContext;
       with DM.QStand do
                 begin
                 close;
                 SQL.Clear;
                 sql.add('SELECT * FROM user where id_user=:id ');
                 Parameters.ParamByName('id').Value:= DBGrid_User.DataSource.DataSet.FieldByName('id_user').AsString;
                 ExecSQL;
                 Open;
                 end;

                 if DM.QStand.RecordCount > 0 then
                 begin
                     id_User:=DM.QStand.FieldValues['id_user'];
                     login_User :=DM.QStand.FieldValues['login_user'];
                     pass_User :=DM.QStand.FieldValues['password_user'];
                     lastName_User :=DM.QStand.FieldValues['last_name_user'];
                     firstName_User :=DM.QStand.FieldValues['first_name_user'];

                     EdLastNameUser.Text :=DM.QStand.FieldValues['last_name_user'];
                     EdFirstNameUser.Text :=DM.QStand.FieldValues['first_name_user'];
                     EdLoginUser.Text :=DM.QStand.FieldValues['login_user'];
                     EdPassUser.Text :=DM.QStand.FieldValues['password_user'];
                     DBLProfilUser.KeyValue :=DM.QStand.FieldValues['profil'];
                 end
end;

procedure TFUser.ClearDataHavePerms;
  begin
      //
  end;

end.

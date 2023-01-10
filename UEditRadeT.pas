unit UEditRadeT;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniButton, uniEdit,
  uniLabel, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniDateTimePicker, uniBitBtn, uniSpeedButton;

type
  TFEditRadeT = class(TUniForm)
    UniPanel1: TUniPanel;
    PanOps: TUniPanel;
    BtnSave: TUniButton;
    BtnRapport: TUniButton;
    UniButton2: TUniButton;
    EdRapport: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    DBLNavire: TUniDBLookupComboBox;
    DBLConsignataire: TUniDBLookupComboBox;
    Eddebut: TUniDateTimePicker;
    Edfin: TUniDateTimePicker;
    UniLabel4: TUniLabel;
    BtAddNavire: TUniSpeedButton;
    BtAddConsignataire: TUniSpeedButton;
    procedure UniFormShow(Sender: TObject);
    procedure BtAddConsignataireClick(Sender: TObject);
    procedure BtAddNavireClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure UniButton2Click(Sender: TObject);
    procedure BtnRapportClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
    id, user_create, user_control, user_valid, navire, consignataire, debut, fin, depart, provenance, destination: string;
    FmContext : string;
    EditContext : string;

    procedure ClearData;
  end;

function FEditRadeT: TFEditRadeT;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UDataLaod, UFunction, UGlobal, ULoadData,
  URadeTest, UEditPort, UEditNavire, UEditConsignataire;

function FEditRadeT: TFEditRadeT;
begin
  Result := TFEditRadeT(DM.GetFormInstance(TFEditRadeT));
end;

procedure TFEditRadeT.BtAddConsignataireClick(Sender: TObject);
begin
    FEditConsignataire.EditContext := LookUpContext;
    FEditConsignataire.FmContext := AddContext;

    FEditConsignataire.Caption := FrmEditTitle('Consignataire', AddTitle);
    FEditConsignataire.ShowModal;
end;

procedure TFEditRadeT.BtAddNavireClick(Sender: TObject);
begin
    FEditNavire.EditContext := LookUpContext;
    FEditNavire.FmContext := AddContext;

    FEditNavire.Caption := FrmEditTitle('Navire', AddTitle);
    FEditNavire.ShowModal;
end;

procedure TFEditRadeT.BtnRapportClick(Sender: TObject);
begin
       //RAPPORT CONTROL
  if FmContext = ControlContext then

          begin
                if EdRapport.IsBlank then
              begin
                 MessageDlg('Veuillez Commenter votre rapport ',mtWarning,[mbok]);
                 EdRapport.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
            else
                MessageDlg('Voulez-vous Soumettre ce Rapport ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE rade SET rapport_control=:rapport_control,  user_control=:user_control, commentaire_control=:commentaire , date_rapport_control=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id;
                                              Parameters.ParamByName('user_control').Value:= UserId;
                                              Parameters.ParamByName('rapport_control').Value:= 1;
                                              Parameters.ParamByName('commentaire').Value:= EdRapport.Text;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Rapport effectuée',mtConfirmation,[mbok]);
                                       FRadeTest.ShowData;
                                       DM.DQ_Grid_RadeT.Locate('id',id,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end

         else

  //RAPPORT VALIDATION
  if FmContext = ValidatContext then
           begin
                if EdRapport.IsBlank then
              begin
                 MessageDlg('Veuillez Commenter votre rapport ',mtWarning,[mbok]);
                 EdRapport.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
            else
                MessageDlg('Voulez-vous Soumettre ce Rapport ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE rade SET rapport_validate=:rapport_validate, user_validate=:user_validate, commentaire_validate=:commentaire , date_rapport_validate=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id;
                                              Parameters.ParamByName('user_validate').Value:= UserId;
                                              Parameters.ParamByName('rapport_validate').Value:= 1;
                                              Parameters.ParamByName('commentaire').Value:= EdRapport.Text;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Rapport effectuée',mtConfirmation,[mbok]);
                                       FRadeTest.ShowData;
                                       DM.DQ_Grid_RadeT.Locate('id',id,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end

end;

procedure TFEditRadeT.BtnSaveClick(Sender: TObject);
begin
  //INSERT
  if FmContext = AddContext then
      begin
         with  DM.QData do
          begin
               close;
               SQL.Clear;
               sql.add('select * from taux_rade where fin_taux_rade is null ');
               ExecSQL;
               Open;
          end;

          if DM.QData.RecordCount = 0 then
               begin
                   MessageDlg('Aucun taux de facturation en cours !',mtError,[mbok]);
                   Abort;
               end
          else

        if DBLNavire.KeyValue = null then
              begin
                 MessageDlg('Veuillez sélectionner le Navire',mtWarning,[mbok]);
                 DBLNavire.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

         if DBLConsignataire.KeyValue = null then
              begin
                 MessageDlg('Veuillez sélectionner le Consignataire',mtWarning,[mbok]);
                 DBLConsignataire.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if Eddebut.DateTime = 0 then
              begin
                 MessageDlg('Veuillez renseigner la Date de Debut',mtWarning,[mbok]);
                 Eddebut.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
        if Edfin.DateTime = 0  then
              begin
                 MessageDlg('Veuillez renseigner la Date de Fin ',mtWarning,[mbok]);
                 Edfin.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO RADE (ref, user_create, navire, consignataire, debut, fin, exercice, taux_rade )'#13+
                                                          ' Values (:ref , :user_create, :navire, :consignataire, :debut, :fin, :exercice, :taux_rade)');
                                                  Parameters.ParamByName('ref').Value:= RefRadeInc;
                                                  Parameters.ParamByName('user_create').Value:= UserId;
                                                  Parameters.ParamByName('navire').Value:=DBLNavire.KeyValue;
                                                  Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                  Parameters.ParamByName('debut').Value:=msqlDateTime(Eddebut);
                                                  Parameters.ParamByName('fin').Value:=msqlDateTime(Edfin);
                                                  Parameters.ParamByName('exercice').Value:= IdExerciceInst;
                                                  Parameters.ParamByName('taux_rade').Value:= DM.QData.FieldValues['id_taux_rade'];;
                                                  ExecSQL;
                                              end;
                                             ClearData;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id) from rade');
                                                    ExecSQL;
                                                   Open;
                                               end;

                                           MessageDlg('Enregistrement effectué',mtConfirmation,[mbok]);
                                           FRadeTest.ShowData;
                                           DM.DQ_Grid_RadeT.Locate('id',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//  //UPDATE
      if FmContext = UpdateContext then
          begin
            if DBLNavire.KeyValue = null then
                  begin
                     MessageDlg('Veuillez sélectionner le Navire',mtWarning,[mbok]);
                     DBLNavire.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;
             if DBLConsignataire.KeyValue = null then
                  begin
                     MessageDlg('Veuillez sélectionner le Consignataire',mtWarning,[mbok]);
                     DBLConsignataire.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end    ;

            if Eddebut.DateTime = 0 then
                  begin
                     MessageDlg('Veuillez renseigner la Date de Debut ',mtWarning,[mbok]);
                     Eddebut.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if Edfin.DateTime = 0 then
                  begin
                     MessageDlg('Veuillez renseigner la Date de Fin ',mtWarning,[mbok]);
                     Edfin.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

                  begin
                        MessageDlg('Voulez-vous appliquer les modifications ?', mtConfirmation, mbYesNo,
                              procedure(Sender: TComponent; Res: Integer)
                                begin
                                  case Res of
                                    mrYes :
                                        begin
                                              with DM.QUpdate do
                                                    begin
                                                        SQL.Text := ('UPDATE rade SET navire=:navire , consignataire=:consignataire , debut=:debut , fin=:fin WHERE id=:id');
                                                        Parameters.ParamByName('id').Value:=id;
                                                        Parameters.ParamByName('navire').Value:=DBLNavire.KeyValue;
                                                        Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                        Parameters.ParamByName('debut').Value:=msqlDateTime(Eddebut);
                                                        Parameters.ParamByName('fin').Value:= msqlDateTime(Edfin);
                                                        ExecSQL;
                                                    end;
                                                   ClearData;

                                                 MessageDlg('modification effectuée',mtConfirmation,[mbok]);
                                                 FRadeTest.ShowData;
                                                 DM.DQ_Grid_RadeT.Locate('id',id,[loCaseInsensitive] );
                                                 close;

                                      end
                                  end ;
                                end
                            );
                  end;

          end
          else

  //CONTROL
  if FmContext = ControlContext then
        begin
          begin
                MessageDlg('Voulez-vous marquer les informations suivantes comme "Controlées" ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE rade SET  rapport_control=:rapport_control, user_control=:user_control, date_control=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id;
                                              Parameters.ParamByName('rapport_control').Value:= 0;
                                              Parameters.ParamByName('user_control').Value:= UserId;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Control effectuée',mtConfirmation,[mbok]);
                                       FRadeTest.ShowData;
                                       DM.DQ_Grid_RadeT.Locate('id',id,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end;

        end

         else

  //VALIDATION
  if FmContext = ValidatContext then
        begin
          begin
                MessageDlg('Voulez-vous marquer les informations suivantes comme "Validées" ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE rade SET rapport_validate=:rapport_validate,  user_validate=:user_validate, date_validate=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id;
                                              Parameters.ParamByName('user_validate').Value:= UserId;
                                              Parameters.ParamByName('rapport_validate').Value:= 0;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Control effectuée',mtConfirmation,[mbok]);
                                       FRadeTest.ShowData;
                                       DM.DQ_Grid_RadeT.Locate('id',id,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end;

        end;



end;

procedure TFEditRadeT.ClearData;
  begin
      DBLNavire.KeyValue := null;
      DBLConsignataire.KeyValue := null;
      Eddebut.DateTime := 0;
      Edfin.DateTime := 0;

  end;


procedure TFEditRadeT.UniButton2Click(Sender: TObject);
begin
close;
end;

procedure TFEditRadeT.UniFormShow(Sender: TObject);
begin
  LoadDBLPort;
  LoadDBLNavire;
  LoadDBLConsignataire;

  if FmContext=AddContext then
    begin
      Eddebut.DateTime := 0;
      Edfin.DateTime := 0;
    end;


    if ((FmContext=ControlContext) or (FmContext=ValidatContext)) then
    begin
      BtAddNavire.Enabled := false;
      BtAddConsignataire.Enabled := false;

      BtnRapport.Visible := True;
      EdRapport.Visible := True;
    end;

end;

end.

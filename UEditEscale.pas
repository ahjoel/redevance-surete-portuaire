unit UEditEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB, Data.SqlTimSt,
  uniGUIClasses, uniGUIForm, uniButton, uniPanel, uniGUIBaseClasses, uniLabel,
  uniEdit, uniMultiItem, uniComboBox, uniDBComboBox, uniDBLookupComboBox,
  uniDateTimePicker, uniBitBtn, uniSpeedButton, uniDBEdit, uniMemo;

type
  TFEditEscale = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanOps: TUniPanel;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    UniPanel1: TUniPanel;
    UniLabel10: TUniLabel;
    UniLabel9: TUniLabel;
    EdAccostage: TUniDateTimePicker;
    DBLDestination: TUniDBLookupComboBox;
    UniLabel6: TUniLabel;
    UniLabel4: TUniLabel;
    DBLConsignataire: TUniDBLookupComboBox;
    DBLNavire: TUniDBLookupComboBox;
    UniLabel2: TUniLabel;
    EdRefPort: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    EdDepart: TUniDateTimePicker;
    EdRade: TUniDateTimePicker;
    DBLProvenance: TUniDBLookupComboBox;
    DBLPoste: TUniDBLookupComboBox;
    BtAddNavire: TUniSpeedButton;
    BtAddConsignataire: TUniSpeedButton;
    BtAddDestination: TUniSpeedButton;
    BtAddPorvenance: TUniSpeedButton;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    EdTonBrut: TUniNumberEdit;
    EdTonNet: TUniNumberEdit;
    BtnRapport: TUniButton;
    EdRapport: TUniEdit;
    DBLObservation: TUniDBLookupComboBox;
    procedure BtnCancelClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure BtAddNavireClick(Sender: TObject);
    procedure BtAddConsignataireClick(Sender: TObject);
    procedure BtAddPorvenanceClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure UniSpeedButton1Click(Sender: TObject);
    procedure BtnRapportClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    var
    id_esc, ref, num_port, user_create, user_control, user_valid, navire, consignataire, post, rade, accost, depart, provenance, destination, ton_net, ton_brut, obs : string;
    FmContext : string;
    EditContext : string;

    procedure ClearData;

  end;

function FEditEscale: TFEditEscale;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ULoadData, UEditNavire, UGlobal,
  UEditConsignataire, UEditPort, UConsignataire, UEscale, UFunction;

procedure TFEditEscale.ClearData;
  begin
      EdRefPort.Clear;
      DBLNavire.KeyValue := null;
      DBLPoste.KeyValue := null;
      DBLConsignataire.KeyValue := null;
      DBLProvenance.KeyValue := null;
      DBLDestination.KeyValue := null;
      DBLObservation.KeyValue := null;
      EdRade.DateTime := 0;
      EdAccostage.DateTime := 0;
      EdDepart.DateTime := 0;
      EdTonBrut.Clear;
      EdTonNet.Clear;
  end;

procedure TFEditEscale.UniFormShow(Sender: TObject);
var
last_ref : string ;

begin
  LoadDBLPosteQuai;
  LoadDBLPort;
  LoadDBLNavire;
  LoadDBLConsignataire;
  LoadDBLObs;


  if FmContext=AddContext then
    begin
      EdRade.DateTime := 0;
      EdAccostage.DateTime := 0;
      EdDepart.DateTime := 0;
    end;


    if ((FmContext=ControlContext) or (FmContext=ValidatContext)) then
    begin
      BtAddNavire.Enabled := false;
      BtAddConsignataire.Enabled := false;
      BtAddDestination.Enabled := false;
      BtAddPorvenance.Enabled := false;

      BtnRapport.Visible := True;
      EdRapport.Visible := True;
      EdRapport.Clear;
    end;

  

end;

procedure TFEditEscale.UniSpeedButton1Click(Sender: TObject);
begin
   rade :=(FormatDateTime('dd/mm/yyyy hh:nn:ss', EdRade.DateTime));
  MessageDlg(rade,mtConfirmation,[mbok]);
end;

function FEditEscale: TFEditEscale;
begin
  Result := TFEditEscale(DM.GetFormInstance(TFEditEscale));
end;

procedure TFEditEscale.BtAddConsignataireClick(Sender: TObject);
begin
    FEditConsignataire.EditContext := LookUpContext;
    FEditConsignataire.FmContext := AddContext;

    FEditConsignataire.Caption := FrmEditTitle('Consignataire', AddTitle);
    FEditConsignataire.ShowModal;
end;

procedure TFEditEscale.BtAddNavireClick(Sender: TObject);
begin
  FEditNavire.EditContext := LookUpContext;
  FEditNavire.FmContext := AddContext;

  FEditNavire.Caption := FrmEditTitle('Navire', AddTitle);
  FEditNavire.ShowModal;
end;

procedure TFEditEscale.BtAddPorvenanceClick(Sender: TObject);
begin
    FEditPort.FmContext := AddContext;
    FEditPort.Caption := FrmEditTitle('Port', AddTitle);
    FEditPort.ShowModal;
end;

procedure TFEditEscale.BtnCancelClick(Sender: TObject);
begin
close;
end;

procedure TFEditEscale.BtnRapportClick(Sender: TObject);
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
                                              SQL.Text := ('UPDATE escale SET rapport_control=:rapport_control,  user_control=:user_control, commentaire_control=:commentaire , date_rapport_control=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id_esc;
                                              Parameters.ParamByName('user_control').Value:= UserId;
                                              Parameters.ParamByName('rapport_control').Value:= 1;
                                              Parameters.ParamByName('commentaire').Value:= EdRapport.Text;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Rapport effectuée',mtConfirmation,[mbok]);
                                       FEscale.ShowData;
                                       DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
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
                                              SQL.Text := ('UPDATE escale SET rapport_validate=:rapport_validate, user_validate=:user_validate, commentaire_validate=:commentaire , date_rapport_validate=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id_esc;
                                              Parameters.ParamByName('user_validate').Value:= UserId;
                                              Parameters.ParamByName('rapport_validate').Value:= 1;
                                              Parameters.ParamByName('commentaire').Value:= EdRapport.Text;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Rapport effectuée',mtConfirmation,[mbok]);
                                       FEscale.ShowData;
                                       DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end
end;

procedure TFEditEscale.BtnSaveClick(Sender: TObject);
var
    last, prefix, new: string ;
    num_width : Integer;

begin
     //INSERT
  if FmContext = AddContext then
      begin
        if EdRefPort.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner la Référence Port',mtWarning,[mbok]);
                 EdRefPort.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

         with  DM.QCheck do
                begin
                     close;
                     SQL.Clear;
                     sql.add('select * from escale where num_port=:num_port');
                     Parameters.ParamByName('num_port').Value:=EdRefPort.text;
                     ExecSQL;
                     Open;
                end;
                if DM.QCheck.RecordCount > 0 then
                     begin
                         MessageDlg('Un Escale posséde dejà cette référence Port',mtError,[mbok]);
                         EdRefPort.JSInterface.JSCall('focus' ,[]);
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

         if DBLPoste.KeyValue = null then
              begin
                 MessageDlg('Veuillez sélectionner le Poste',mtWarning,[mbok]);
                 DBLPoste.JSInterface.JSCall('focus' ,[]);
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

         if DBLProvenance.KeyValue = null then
              begin
                 MessageDlg('Veuillez sélectionner la Provenance',mtWarning,[mbok]);
                 DBLProvenance.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

         if DBLDestination.KeyValue = null then
              begin
                 MessageDlg('Veuillez sélectionner le Destination',mtWarning,[mbok]);
                 DBLDestination.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

          if  EdRade.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date de Rade',mtWarning,[mbok]);
                 EdRade.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
        if EdAccostage.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date d''Accostage',mtWarning,[mbok]);
                 EdAccostage.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
        if EdDepart.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date de Depart',mtWarning,[mbok]);
                 EdDepart.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if DBLObservation.IsBlank then
              begin
                 MessageDlg('Veuillez sélectionner l''Observation ',mtWarning,[mbok]);
                 DBLObservation.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdTonBrut.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Tonnage Brut',mtWarning,[mbok]);
                 EdTonBrut.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
        if EdTonNet.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Tonnage Net',mtWarning,[mbok]);
                 EdTonNet.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO escale (ref, num_port, user_create, navire, consignataire, post_quai, date_rade, date_accost, date_depart, port_orgine, port_dest, tonne_net, tonne_brut, observation, exercice )'#13+
                                                          ' Values (:ref, :num_port, :user_create, :navire, :consignataire, :post_quai, :date_rade, :date_accost, :date_depart, :port_orgine, :port_dest, :tonne_net, :tonne_brut, :observation, :exercice)');
                                                  Parameters.ParamByName('ref').Value:= RefEscInc;
                                                  Parameters.ParamByName('num_port').Value:= EdRefPort.Text;
                                                  Parameters.ParamByName('user_create').Value:= UserId;
                                                  Parameters.ParamByName('navire').Value:=DBLNavire.KeyValue;
                                                  Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                  Parameters.ParamByName('post_quai').Value:= DBLPoste.KeyValue;
                                                  Parameters.ParamByName('date_rade').Value:=msqlDateTime(EdRade);
                                                  Parameters.ParamByName('date_accost').Value:= msqlDateTime(EdAccostage);
                                                  Parameters.ParamByName('date_depart').Value:=msqlDateTime(EdDepart);
                                                  Parameters.ParamByName('port_orgine').Value:= DBLProvenance.KeyValue;
                                                  Parameters.ParamByName('port_dest').Value:= DBLDestination.KeyValue;
                                                  Parameters.ParamByName('tonne_net').Value:= EdTonNet.Value;
                                                  Parameters.ParamByName('tonne_brut').Value:=EdTonBrut.Value;
                                                  Parameters.ParamByName('observation').Value:= DBLObservation.KeyValue;
                                                  Parameters.ParamByName('exercice').Value:= IdExerciceInst;
                                                  ExecSQL;
                                              end;
                                             ClearData;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id) from escale');
                                                    ExecSQL;
                                                   Open;
                                               end;

                                           MessageDlg('Enregistrement effectuée',mtConfirmation,[mbok]);
                                           FEscale.ShowData;
                                           DM.DQ_Grid_Escale.Locate('id',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );


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
            if EdRefPort.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Référence Port',mtWarning,[mbok]);
                     EdRefPort.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end ;

           if (EdRefPort.Text <> num_port) then
               begin
                   with  DM.QCheck do
                      begin
                           close;
                           SQL.Clear;
                           sql.add('select * from escale where num_port=:num_port');
                           Parameters.ParamByName('num_port').Value:=EdRefPort.text;
                           ExecSQL;
                           Open;
                      end;
                      if DM.QCheck.RecordCount > 0 then
                           begin
                               MessageDlg('Un Escale posséde dejà cette Référence Port ',mtError,[mbok]);
                               EdRefPort.JSInterface.JSCall('focus' ,[]);
                               Abort;
                           end
               end ;


            if DBLNavire.KeyValue = null then
                  begin
                     MessageDlg('Veuillez sélectionner le Navire',mtWarning,[mbok]);
                     DBLNavire.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;


             if DBLPoste.IsBlank then
                  begin
                     MessageDlg('Veuillez sélectionner le Poste',mtWarning,[mbok]);
                     DBLPoste.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end  ;


             if DBLConsignataire.IsBlank then
                  begin
                     MessageDlg('Veuillez sélectionner le Consignataire',mtWarning,[mbok]);
                     DBLConsignataire.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end    ;

             if DBLProvenance.IsBlank then
                  begin
                     MessageDlg('Veuillez sélectionner la Provenance',mtWarning,[mbok]);
                     DBLProvenance.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

             if DBLDestination.IsBlank then
                  begin
                     MessageDlg('Veuillez sélectionner le Destination',mtWarning,[mbok]);
                     DBLDestination.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;
//
//             if DBLProvenance.KeyValue = DBLDestination.KeyValue then
//                  begin
//                     MessageDlg('Provenance et Destination identique ',TMsgDlgType.mtError,[mbok]);
//                     DBLDestination.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;

            if EdRade.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Date de Rade',mtWarning,[mbok]);
                     EdRade.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if EdAccostage.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Date d''Accostage',mtWarning,[mbok]);
                     EdAccostage.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if EdDepart.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Date de Depart',mtWarning,[mbok]);
                     EdDepart.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if DBLObservation.IsBlank then
                  begin
                     MessageDlg('Veuillez sélectionner l''Observation ',mtWarning,[mbok]);
                     DBLObservation.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if EdTonBrut.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner le Tonnage Brut',mtWarning,[mbok]);
                     EdTonBrut.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if EdTonNet.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner le Tonnage Net',mtWarning,[mbok]);
                     EdTonNet.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

                  begin
                        MessageDlg('Voulez-vous appliquer les modifications ?', mtConfirmation, mbYesNo,
                              procedure(Sender: TComponent; Res: Integer)
                              begin
                                case Res of
                                  mrYes :
                                      begin
                                            with DM.QSave do
                                                  begin
                                                      SQL.Text := ('UPDATE escale SET  num_port=:num_port, navire=:navire, consignataire=:consignataire, post_quai=:post_quai, date_rade=:date_rade , date_accost=:date_accost, date_depart=:date_depart, port_orgine=:port_orgine,'#13+
                                                              '  port_dest=:port_dest, tonne_net=:tonne_net, tonne_brut=:tonne_brut, observation=:observation WHERE id=:id');
                                                      Parameters.ParamByName('id').Value:= id_esc;
                                                      Parameters.ParamByName('num_port').Value:= EdRefPort.Text;
                                                      Parameters.ParamByName('navire').Value:=DBLNavire.KeyValue;
                                                      Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                      Parameters.ParamByName('post_quai').Value:= DBLPoste.KeyValue;
                                                     Parameters.ParamByName('date_rade').Value:=msqlDateTime(EdRade);
                                                      Parameters.ParamByName('date_accost').Value:= msqlDateTime(EdAccostage);
                                                      Parameters.ParamByName('date_depart').Value:=msqlDateTime(EdDepart);
                                                      Parameters.ParamByName('port_orgine').Value:= DBLProvenance.KeyValue;
                                                      Parameters.ParamByName('port_dest').Value:= DBLDestination.KeyValue;
                                                      Parameters.ParamByName('tonne_net').Value:= EdTonNet.Value;
                                                      Parameters.ParamByName('tonne_brut').Value:=EdTonBrut.Value;
                                                      Parameters.ParamByName('observation').Value:= DBLObservation.KeyValue;
                                                      ExecSQL;
                                                  end;
                                                 ClearData;

                                               MessageDlg('modification effectuée',mtConfirmation,[mbok]);
                                               FEscale.ShowData;
                                               DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
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
                MessageDlg('Voulez-vous marquer les informations suivantes comme "Controlées" ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE escale SET rapport_control=:rapport_control,  user_control=:user_control, date_control=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id_esc;
                                              Parameters.ParamByName('user_control').Value:= UserId;
                                              Parameters.ParamByName('rapport_control').Value:= 0;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Control effectuée',mtConfirmation,[mbok]);
                                       FEscale.ShowData;
                                       DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end

         else

  //VALIDATION
  if FmContext = ValidatContext then
          begin
                MessageDlg('Voulez-vous marquer les informations suivantes comme "Validées" ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE escale SET rapport_validate=:rapport_validate, user_validate=:user_validate, date_validate=CURRENT_TIMESTAMP WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id_esc;
                                              Parameters.ParamByName('user_validate').Value:= UserId;
                                              Parameters.ParamByName('rapport_validate').Value:= 0;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Control effectuée',mtConfirmation,[mbok]);
                                       FEscale.ShowData;
                                       DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end

end;

end.

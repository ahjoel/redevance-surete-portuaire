unit UEditFactEscalePal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Data.DB,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniDateTimePicker, uniLabel, uniPanel, uniButton,
  uniGUIBaseClasses, uniGroupBox;



type
  TFEditFactEscalePal = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPanel1: TUniPanel;
    Group_rech: TUniGroupBox;
    Group_fact: TUniGroupBox;
    Group_infos: TUniGroupBox;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    EdRefPort: TUniEdit;
    EdRefInt: TUniEdit;
    EdNavire: TUniEdit;
    EdConsignataire: TUniEdit;
    EdPoste: TUniEdit;
    EdAccost: TUniEdit;
    EdDateEmis: TUniDateTimePicker;
    EdMontFact: TUniFormattedNumberEdit;
    EdNumFact: TUniEdit;
    DBLConsignataire: TUniDBLookupComboBox;
    EdComplement: TUniFormattedNumberEdit;
    EdDateTrans: TUniDateTimePicker;
    EdDateEch: TUniDateTimePicker;
    DBLTypeFact: TUniDBLookupComboBox;
    UniLabel3: TUniLabel;
    UniLabel1: TUniLabel;
    UniLabel14: TUniLabel;
    UniLabel11: TUniLabel;
    UniLabel12: TUniLabel;
    UniLabel10: TUniLabel;
    UniLabel13: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel15: TUniLabel;
    UniLabel16: TUniLabel;
    UniLabel17: TUniLabel;
    edRechAccost: TUniDateTimePicker;
    BtnRechEscale: TUniButton;
    DBLRechNavire: TUniDBLookupComboBox;
    DBLRechCons: TUniDBLookupComboBox;
    PanOps: TUniPanel;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    BtnRapport: TUniButton;
    EdRapport: TUniEdit;
    procedure BtnRechEscaleClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure loaddata ;
  public
    { Public declarations }
     var
    id_fact, imma_fact, id_esc, ref, num_port, user_create, user_control, user_valid, navire, consignataire,  arrive, depart : string;
    FmContext : string;
    EditContext : string;
    validate_filter , fact_filter, escale_filter , query:string ;


    procedure ClearData;
  end;

function FEditFactEscalePal: TFEditFactEscalePal;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, USelectEscale, ULoadData, UFunction,
  UFactPALEmise, UEscale;

function FEditFactEscalePal: TFEditFactEscalePal;
begin
  Result := TFEditFactEscalePal(DM.GetFormInstance(TFEditFactEscalePal));
end;


procedure TFEditFactEscalePal.BtnCancelClick(Sender: TObject);
begin
    close;
end;

procedure TFEditFactEscalePal.loaddata ;
begin
     id_esc := DM.QCheck.FieldValues['id'];
     EdRefPort.Text := DM.QCheck.FieldValues['num_port'];
     EdRefInt.Text := DM.QCheck.FieldValues['ref'];
     EdNavire.Text := DM.QCheck.FieldValues['nom_navire'];
     EdConsignataire.Text := DM.QCheck.FieldValues['nom_consignataire'];
     EdPoste.Text := DM.QCheck.FieldValues['libelle_pq'];
     EdAccost.Text := DM.QCheck.FieldValues['date_accost'];
     DBLConsignataire.KeyValue := DM.QCheck.FieldValues['consignataire'];
end;

procedure TFEditFactEscalePal.BtnRechEscaleClick(Sender: TObject);
begin
     query := init_query_select_escale + ' AND E.navire=:nav AND E.consignataire=:cons AND E.date_accost=:accost ';
     with DM.QCheck do
           begin
               close;
               SQL.Clear;
               sql.add(query );
               Parameters.ParamByName('nav').Value:= DBLRechNavire.KeyValue;
               Parameters.ParamByName('cons').Value:= DBLRechCons.KeyValue;
               Parameters.ParamByName('accost').Value:= msqlDateTime(edRechAccost);
               ExecSQL;
               Open;
           end;

     if DM.QCheck.RecordCount = 0 then
          begin
               MessageDlg('Aucune Escale ne correspond � cette Recherche',mtWarning,[mbok]);
               DBLRechNavire.JSInterface.JSCall('focus' ,[]);
               Abort;
          end
     else
        begin

            if DM.QCheck.FieldValues['statut'] = 'N' then
               begin
                   MessageDlg('Escale non facturable',mtWarning,[mbok]);
                   DBLRechNavire.JSInterface.JSCall('focus' ,[]);
                   Abort;
               end

             else

            if DM.QCheck.FieldValues['date_validate'] = null then
               begin
                   MessageDlg('Escale non valid�e',mtWarning,[mbok]);
                   DBLRechNavire.JSInterface.JSCall('focus' ,[]);
                   Abort;
               end
             else

             if DM.QCheck.FieldValues['facturer_pal'] = 1 then
                begin
                   MessageDlg('Escale deja factur�, voulez-vous continuer ?', mtConfirmation, mbYesNo,
                        procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :loaddata;
                            end;
                          end
                      );
                end

              else
              if (DM.QCheck.FieldValues['facturer_pal'] = 0)  then
                begin
                     loaddata;
                end;


        end

end;


procedure TFEditFactEscalePal.BtnSaveClick(Sender: TObject);
begin
   //INSERT
  if FmContext = AddContext then
      begin

            if EdNavire.IsBlank then
              begin
                 MessageDlg('Veuillez s�lectionner une Escale',mtWarning,[mbok]);
                 BtnRechEscale.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdNumFact.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Num�ro de la Facture ',mtWarning,[mbok]);
                 EdNumFact.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

         with  DM.QCheck do
                begin
                     close;
                     SQL.Clear;
                     sql.add('select * from facture_pal where ref_facture_pal=:ref_facture_pal');
                     Parameters.ParamByName('ref_facture_pal').Value:=EdNumFact.text;
                     ExecSQL;
                     Open;
                end;
                if DM.QCheck.RecordCount > 0 then
                     begin
                         MessageDlg('Une Facture poss�de dej� ce Num�ro ',mtError,[mbok]);
                         EdNumFact.JSInterface.JSCall('focus' ,[]);
                         Abort;
                     end

            else
        if DBLConsignataire.KeyValue = null then
              begin
                 MessageDlg('Veuillez s�lectionner le Consignataire',mtWarning,[mbok]);
                 DBLConsignataire.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdMontFact.value <0 then
              begin
                 MessageDlg('Veuillez renseigner le Montant de la Facture ',mtWarning,[mbok]);
                 EdMontFact.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else


        if EdComplement.value <0 then
              begin
                 MessageDlg('Veuillez renseigner le Compl�ment de la Facture ',mtWarning,[mbok]);
                 EdComplement.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

         if DBLTypeFact.KeyValue = null then
              begin
                 MessageDlg('Veuillez s�lectionner le Type',mtWarning,[mbok]);
                 DBLTypeFact.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

          if  EdDateEmis.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date d''�mission ',mtWarning,[mbok]);
                 EdDateEmis.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
        if EdDateTrans.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date de Transmission ',mtWarning,[mbok]);
                 EdDateTrans.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
        if EdDateEch.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date d''�ch�ance ',mtWarning,[mbok]);
                 EdDateEch.JSInterface.JSCall('focus' ,[]);
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

                                                  SQL.Text := ('INSERT INTO facture_pal (escale_facture_pal, ref_facture_pal, consignataire_facture_pal, montant_facture_pal, montant_complement_facture_pal, '#13+
                                                               ' date_emise_facture_pal, date_trans_facture_pal, date_ech_facture_pal, type_facture, user_create_facture_pal, exercice_facture_pal) '#13+
                                                               ' Values (:escale, :ref, :consignataire, :montant, :complement, :emis, :trans, :echeance, :type, :user_create, :exercice)');
                                                  Parameters.ParamByName('escale').Value:= id_esc;
                                                  Parameters.ParamByName('ref').Value:= EdNumFact.Text;
                                                  Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                  Parameters.ParamByName('montant').Value:= (FormatCurr('0.00#', EdMontFact.Value)).Replace(',', '.');
                                                  Parameters.ParamByName('complement').Value:= FormatCurr('0.00#', EdComplement.Value).Replace(',', '.');
                                                  Parameters.ParamByName('emis').Value:= msqlDateTime(EdDateEmis);
                                                  Parameters.ParamByName('trans').Value:=msqlDateTime(EdDateTrans);
                                                  Parameters.ParamByName('echeance').Value:= msqlDateTime(EdDateEch);
                                                  Parameters.ParamByName('type').Value:= DBLTypeFact.KeyValue;
                                                  Parameters.ParamByName('user_create').Value:= UserId;
                                                  Parameters.ParamByName('exercice').Value:= IdExerciceInst;
                                                  ExecSQL;
                                              end;

                                              with DM.QUpdate do
                                                begin
                                                    SQL.Text := ('UPDATE escale SET facturer_pal=:facturer_pal WHERE id=:id');
                                                    Parameters.ParamByName('id').Value:= id_esc;
                                                    Parameters.ParamByName('facturer_pal').Value:= 1;
                                                    ExecSQL;
                                                end;

                                                 ClearData;

                                                 with DM.QMax  do
                                                   begin
                                                       close;
                                                       SQL.Clear;
                                                        SQL.Add('select max(id_factures_pal) from facture_pal');
                                                        ExecSQL;
                                                       Open;
                                                   end;

                                           MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                           FFactPalEmise.ShowData;
                                           DM.DQ_Grid_FactPal.Locate('id_factures_pal',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );


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
            if EdNavire.IsBlank then
              begin
                 MessageDlg('Veuillez s�lectionner une Escale',mtWarning,[mbok]);
                 BtnRechEscale.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end;


            if EdNumFact.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Num�ro Facture',mtWarning,[mbok]);
                 EdNumFact.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end;


           if (EdNumFact.Text <> imma_fact) then
               begin
                   with  DM.QCheck do
                      begin
                           close;
                           SQL.Clear;
                           sql.add('select * from facture_pal where ref_facture_pal=:ref');
                           Parameters.ParamByName('ref').Value:=EdNumFact.text;
                           ExecSQL;
                           Open;
                      end;
                      if DM.QCheck.RecordCount > 0 then
                           begin
                               MessageDlg('Une Facture poss�de dej� ce Num�ro ',mtError,[mbok]);
                               EdNumFact.JSInterface.JSCall('focus' ,[]);
                               Abort;
                           end
               end ;

             if DBLConsignataire.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner le Consignataire',mtWarning,[mbok]);
                     DBLConsignataire.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end    ;

              if EdMontFact.Value = 0 then
              begin
                 MessageDlg('Veuillez renseigner le Montant Facture',mtWarning,[mbok]);
                 EdMontFact.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end;

               if EdComplement.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le complement Facture',mtWarning,[mbok]);
                 EdComplement.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end;

            if DBLTypeFact.KeyValue = null then
                  begin
                     MessageDlg('Veuillez s�lectionner le type de Facture',mtWarning,[mbok]);
                     DBLTypeFact.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;


            if EdDateEmis.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Date d''�mission',mtWarning,[mbok]);
                     EdDateEmis.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if EdDateTrans.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Date de Transmission',mtWarning,[mbok]);
                     EdDateTrans.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end;

            if EdDateEch.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner la Date d''Ech�ance',mtWarning,[mbok]);
                     EdDateEch.JSInterface.JSCall('focus' ,[]);
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
                                                      SQL.Text := ('UPDATE facture_pal SET  escale_facture_pal=:escale, ref_facture_pal=:ref, consignataire_facture_pal=:consignataire, montant_facture_pal=:montant, montant_complement_facture_pal=:complement, '#13+
                                                                  ' date_emise_facture_pal=:emis , date_trans_facture_pal=:trans, date_ech_facture_pal=:echeance, type_facture=:type WHERE id_factures_pal=:id');
                                                  Parameters.ParamByName('id').Value:= id_fact;
                                                  Parameters.ParamByName('escale').Value:= id_esc;
                                                  Parameters.ParamByName('ref').Value:= EdNumFact.Text;
                                                  Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                  Parameters.ParamByName('montant').Value:= (FormatCurr('0.00#', EdMontFact.Value)).Replace(',', '.');
                                                  Parameters.ParamByName('complement').Value:= FormatCurr('0.00#', EdComplement.Value).Replace(',', '.');
                                                  Parameters.ParamByName('emis').Value:= msqlDateTime(EdDateEmis);
                                                  Parameters.ParamByName('trans').Value:=msqlDateTime(EdDateTrans);
                                                  Parameters.ParamByName('echeance').Value:= msqlDateTime(EdDateEch);
                                                  Parameters.ParamByName('type').Value:= DBLTypeFact.KeyValue;
                                                  ExecSQL;
                                                  end;
                                                 ClearData;

                                               MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                               FFactPalEmise.ShowData;
                                               DM.DQ_Grid_FactPal.Locate('id_factures_pal',id_fact,[loCaseInsensitive] );
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
                MessageDlg('Voulez-vous marquer les informations suivantes comme "Control�es" ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE facture_pal SET  rapport_control=:rapport_control, user_control_facture_pal=:user_control, date_control_facture_pal=CURRENT_TIMESTAMP WHERE id_factures_pal=:id');
                                              Parameters.ParamByName('id').Value:= id_fact;
                                              Parameters.ParamByName('rapport_control').Value:= 0;
                                              Parameters.ParamByName('user_control').Value:= UserId;
                                              ExecSQL;
                                          end;
                                         ClearData;

                                       MessageDlg('Control effectu�e',mtConfirmation,[mbok]);
                                       FFactPalEmise.ShowData;
                                       DM.DQ_Grid_FactPal.Locate('id_factures_pal',id_fact,[loCaseInsensitive] );
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
                MessageDlg('Voulez-vous marquer les informations suivantes comme "Valid�es" ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE facture_pal SET rapport_validate=:rapport_validate,  user_validate_facture_pal=:user_validate, date_validate_facture_pal=CURRENT_TIMESTAMP WHERE id_factures_pal=:id');
                                              Parameters.ParamByName('id').Value:= id_fact;
                                              Parameters.ParamByName('user_validate').Value:= UserId;
                                              Parameters.ParamByName('rapport_validate').Value:= 0;
                                              ExecSQL;
                                          end;
                                         ClearData;
                                       MessageDlg('Control effectu�e',mtConfirmation,[mbok]);
                                       FFactPalEmise.ShowData;
                                       DM.DQ_Grid_FactPal.Locate('id_factures_pal',id_fact,[loCaseInsensitive] );
                                       close;
                            end
                        end ;
                      end
                    );
          end;

        end;




end;

procedure TFEditFactEscalePal.ClearData;

begin
  //ZONE RECHERCHE
  DBLRechNavire.KeyValue := null;
  DBLRechCons.KeyValue := null;
  edRechAccost.DateTime := 0;

  //ZONE INFOS
  EdRefPort.Clear;
  EdRefInt.Clear;
  EdNavire.Clear;
  EdConsignataire.Clear;
  EdPoste.Clear;
  EdAccost.Clear;

  //ENREGISTREMENT
  EdNumFact.Clear;
  DBLConsignataire.KeyValue := null;
  DBLTypeFact.KeyValue := null;
  EdMontFact.Clear;
  EdComplement.Clear;
  EdDateEmis.DateTime := 0;
  EdDateTrans.DateTime := 0;
  EdDateEch.DateTime := 0;
end;

procedure TFEditFactEscalePal.UniFormShow(Sender: TObject);
begin
    LoadDBLNavire;
    LoadDBLTypeFactEscale;
    if FmContext = AddContext then
      begin
        ClearData;
      end;
    LoadDBLConsignataire;

      if ((FmContext=ControlContext) or (FmContext=ValidatContext)) then
    begin
      BtnRapport.Visible := True;
      EdRapport.Visible := True;
    end;

end;

end.

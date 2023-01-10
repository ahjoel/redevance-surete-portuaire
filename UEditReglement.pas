unit UEditReglement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Data.DB,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniLabel, uniDateTimePicker, uniGroupBox, uniButton,
  uniPanel, uniGUIBaseClasses;

type
  TFEditReglement = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPanel1: TUniPanel;
    Group_reg: TUniGroupBox;
    UniLabel11: TUniLabel;
    UniLabel14: TUniLabel;
    DBLConsignataire: TUniDBLookupComboBox;
    UniLabel12: TUniLabel;
    EdDateReg: TUniDateTimePicker;
    Group_infos: TUniGroupBox;
    lbfact: TUniLabel;
    EdFacture: TUniEdit;
    UniLabel7: TUniLabel;
    EdConsignataire: TUniEdit;
    UniLabel4: TUniLabel;
    EdEmmissionFact: TUniEdit;
    UniLabel5: TUniLabel;
    EdEcheanceFact: TUniEdit;
    UniLabel1: TUniLabel;
    EdTypeFact: TUniEdit;
    UniLabel9: TUniLabel;
    Group_rech: TUniGroupBox;
    BtnRechFact: TUniButton;
    edRechDateEm: TUniDateTimePicker;
    UniLabel17: TUniLabel;
    UniLabel15: TUniLabel;
    EdRechNumFact: TUniEdit;
    EdReg: TUniFormattedNumberEdit;
    PanOps: TUniPanel;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    BtnRapport: TUniButton;
    EdRapport: TUniEdit;
    UniLabel2: TUniLabel;
    EdMontantFact: TUniFormattedNumberEdit;
    UniLabel3: TUniLabel;
    EdMontReg: TUniFormattedNumberEdit;
    EdMontSolde: TUniFormattedNumberEdit;
    procedure UniFormShow(Sender: TObject);
    procedure BtnRechFactClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
    procedure loaddata ;
  public
    { Public declarations }
     var
    id_fact, imma_fact,  navire, consignataire,  date_em, date_ech : string;
    FmContext : string;
    EditContext : string;

    validate_filter , fact_filter, rade_filter , query:string ;

    procedure ClearData;
  end;

function FEditReglement: TFEditReglement;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ULoadData, UGlobal, UFunction, UReglement,
  UFactPALEmise;

function FEditReglement: TFEditReglement;
begin
  Result := TFEditReglement(DM.GetFormInstance(TFEditReglement));
end;

procedure TFEditReglement.loaddata ;
begin
     id_fact := DM.QCheck.FieldValues['id_factures_pal'];
     EdFacture.Text := DM.QCheck.FieldValues['ref_fact'];
     EdConsignataire.Text := DM.QCheck.FieldValues['cons_fact'];
     EdEmmissionFact.Text := DM.QCheck.FieldValues['date_emise_facture_pal'];
     EdEcheanceFact.Text := DM.QCheck.FieldValues['date_ech_facture_pal'];
     EdTypeFact.Text := DM.QCheck.FieldValues['code_type_fact'];
     EdMontantFact.Text := DM.QCheck.FieldValues['montant_xof'];
     EdMontReg.Text  := DM.QCheck.FieldValues['mont_regle'];
     EdMontSolde.Text  := DM.QCheck.FieldValues['mont_solde'];
     DBLConsignataire.KeyValue  := DM.QCheck.FieldValues['id_cons_fact'];
end;

procedure TFEditReglement.BtnRechFactClick(Sender: TObject);
begin
    query := init_query_select_fact + ' AND L.ref_facture_pal=:ref_fact AND L.date_emise_facture_pal=:date_em ' + 'GROUP BY L.id_factures_pal';
     with DM.QCheck do
           begin
               close;
               SQL.Clear;
               sql.add(query );
               Parameters.ParamByName('ref_fact').Value:= EdRechNumFact.Text;
               Parameters.ParamByName('date_em').Value:= msqlDateTime(edRechDateEm);
               ExecSQL;
               Open;
           end;

     if DM.QCheck.RecordCount = 0 then
          begin
               MessageDlg('Aucune Facture ne correspond � cette Recherche',mtWarning,[mbok]);
               EdRechNumFact.JSInterface.JSCall('focus' ,[]);
               Abort;
          end
     else
        begin
             if DM.QCheck.FieldValues['validation'] = '' then
               begin
                   MessageDlg('Facture non valid�e',mtWarning,[mbok]);
                   EdRechNumFact.JSInterface.JSCall('focus' ,[]);
                   Abort;
               end
             else

              if DM.QCheck.FieldValues['mont_regle'] = DM.QCheck.FieldValues['montant_xof'] then
               begin
                   MessageDlg('Facture deja R�gl�e',mtWarning,[mbok]);
                   EdRechNumFact.JSInterface.JSCall('focus' ,[]);
                   Abort;
               end
               else
              if DM.QCheck.FieldValues['mont_regle'] < DM.QCheck.FieldValues['montant_xof']  then
                begin
                     loaddata;
                end;
        end

end;

procedure TFEditReglement.BtnSaveClick(Sender: TObject);
begin
  //INSERT
  if FmContext = AddContext then
      begin

            if EdFacture.IsBlank then
              begin
                 MessageDlg('Veuillez s�lectionner une Facture',mtWarning,[mbok]);
                 BtnRechFact.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdReg.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Montant ',mtWarning,[mbok]);
                 EdReg.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

          if  EdDateReg.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date du R�glement ',mtWarning,[mbok]);
                 EdDateReg.JSInterface.JSCall('focus' ,[]);
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

              begin
                    MessageDlg('Voulez-vous enregister ?', mtConfirmation, mbYesNo,
                       procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('INSERT INTO reglement (facture_regle, montant_regle, date_regle, consignataire_regle, user_create_regle , exercice)'#13+
                                                          'Values (:facture, :montant, :date, :consignataire, :user_create, :exercice)');
                                                  Parameters.ParamByName('facture').Value:= id_fact;
                                                  Parameters.ParamByName('montant').Value:= EdReg.Text;
                                                  Parameters.ParamByName('date').Value:= msqlDateTime(EdDateReg);
                                                  Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
                                                  Parameters.ParamByName('user_create').Value:= UserId;
                                                  Parameters.ParamByName('exercice').Value:= IdExerciceInst;
                                                  ExecSQL;
                                              end;

                                                 ClearData;

                                                 with DM.QMax  do
                                                   begin
                                                       close;
                                                       SQL.Clear;
                                                        SQL.Add('select max(id_regle) from reglement');
                                                        ExecSQL;
                                                       Open;
                                                   end;

                                           MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                           FReglements.ShowData;
                                           DM.DQ_Grid_Reglement.Locate('id_regle',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );


                                end
                            end ;
                          end
                        );
              end;

      end

    else





end;

procedure TFEditReglement.ClearData;

begin
   //ZONE RECHERCHE
   EdRechNumFact.Clear;
   edRechDateEm.DateTime := 0;


    EdFacture.Clear;
    EdConsignataire.Clear;
    EdEmmissionFact.Clear;
    EdEcheanceFact.Clear;
    EdTypeFact.Clear;
    EdMontantFact.Clear;
    EdMontReg.Clear;
    EdMontSolde.Clear;

    EdReg.Clear;
    DBLConsignataire.KeyValue := null;
    EdDateReg.DateTime := 0;
end;

procedure TFEditReglement.UniFormShow(Sender: TObject);
begin
    LoadDBLConsignataire;
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

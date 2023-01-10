unit UEditTauxRade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Data.DB,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniDateTimePicker, uniEdit, uniLabel, uniButton,
  uniPanel, uniGUIBaseClasses, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox;

type
  TFEditTauxRade = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPanel1: TUniPanel;
    BtnSave: TUniButton;
    BtnCancel: TUniButton;
    UniPanel2: TUniPanel;
    UniLabel7: TUniLabel;
    EdNbJours: TUniNumberEdit;
    UniLabel4: TUniLabel;
    EdMontantTaux: TUniFormattedNumberEdit;
    EdDebut: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    LbFin: TUniLabel;
    EdFin: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    DBLTypeFact: TUniDBLookupComboBox;
    procedure BtnCancelClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var
        id_TauxRade, taux_TauxRade, debut_TauxRade, fin_TauxRade: string;
        FmContext : string;
        EditContext : string;
  end;

function FEditTauxRade: TFEditTauxRade;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, UFunction, UProject_Function, UTaux,
  ULoadData;

function FEditTauxRade: TFEditTauxRade;
begin
  Result := TFEditTauxRade(DM.GetFormInstance(TFEditTauxRade));
end;

procedure TFEditTauxRade.BtnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFEditTauxRade.BtnSaveClick(Sender: TObject);
begin
  if FmContext = AddContext then
      begin

         with  DM.QCheck do
          begin
               close;
               SQL.Clear;
               sql.add('select * from taux_rade where fin_taux_rade is null ');
               ExecSQL;
               Open;
          end;

          if DM.QCheck.RecordCount > 0 then
               begin
                   MessageDlg('Un taux en cours de validité ',mtError,[mbok]);
                   EdNbJours.JSInterface.JSCall('focus' ,[]);
                   Abort;
               end
          else


          if EdNbJours.Value <= 0 then
              begin
                 MessageDlg('Veuillez renseigner le Nombre de Jours',mtWarning,[mbok]);
                 EdNbJours.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            if DBLTypeFact.IsBlank then
                  begin
                     MessageDlg('Veuillez sélectionner  le Type de Facture ',mtWarning,[mbok]);
                     DBLTypeFact.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
              else


          if EdDebut.DateTime = 0 then
              begin
                 MessageDlg('Veuillez renseigner le Date Debut',mtWarning,[mbok]);
                 EdDebut.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else

          if EdMontantTaux.Value <= 0  then
              begin
                 MessageDlg('Veuillez renseigner le Taux',mtWarning,[mbok]);
                 EdMontantTaux.JSInterface.JSCall('focus' ,[]);
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
                                              SQL.Text := ('INSERT INTO taux_rade (nombre_jour_taux_rade, type_fact, montant_taux_rade, debut_taux_rade) Values (:nombre_jour, :type_fact, :taux, :debut )');
                                              Parameters.ParamByName('nombre_jour').Value:=EdNbJours.Value ;
                                              Parameters.ParamByName('type_fact').Value:=DBLTypeFact.KeyValue ;
                                              Parameters.ParamByName('taux').Value:= EdMontantTaux.Value;
                                              Parameters.ParamByName('debut').Value:= msqlDateTime(EdDebut);
                                              ExecSQL;
                                          end;


                                         with DM.QMax  do
                                           begin
                                               close;
                                               SQL.Clear;
                                                SQL.Add('select max(id_taux_rade) from taux_rade');
                                                ExecSQL;
                                               Open;
                                           end;
                                         MessageDlg('Enregistrement effectué',mtConfirmation,[mbok]);
                                         FTaux.ShowDataTauxRade;
                                         DM.DQ_Grid_TauxRade.Locate('id_taux_rade',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                         close;
                            end
                        end ;
                      end
                    );
          end;

      end

    else

    //MISE EN FIN
  if FmContext = EndUpContext then
      begin

        if EdFin.DateTime = 0 then
              begin
                 MessageDlg('Veuillez renseigner le Date Fin',mtWarning,[mbok]);
                 EdFin.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else

                MessageDlg('Voulez-vous Mettre Fin á ce Taux ?', mtConfirmation, mbYesNo,
                      procedure(Sender: TComponent; Res: Integer)
                      begin
                        case Res of
                          mrYes :
                              begin
                                    with DM.QSave do
                                          begin
                                              SQL.Text := ('UPDATE taux_rade SET fin_taux_rade=:fin WHERE id_taux_rade=:id');
                                              Parameters.ParamByName('id').Value:= id_TauxRade;
                                              Parameters.ParamByName('fin').Value:= msqlDateTime(EdFin);
                                              ExecSQL;
                                          end;


                                       MessageDlg('Opération effectuée',mtConfirmation,[mbok]);
                                       FTaux.ShowDataTauxRade;
                                       DM.DQ_Grid_TauxRade.Locate('id_taux_rade',id_TauxRade,[loCaseInsensitive] );
                                       close;

                            end
                        end ;
                      end
                    );
          end

         else
end;

procedure TFEditTauxRade.UniFormShow(Sender: TObject);
begin
  LoadDBLTypeFact;
     if FmContext=AddContext then
    begin
      EdDebut.DateTime := 0;

    end;


end;

end.

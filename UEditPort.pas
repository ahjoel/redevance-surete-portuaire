unit UEditPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniMultiItem, uniComboBox, uniDBComboBox,
  uniDBLookupComboBox, uniEdit, uniLabel, uniButton, uniPanel, uniGUIBaseClasses;

type
  TFEditPort = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanOps: TUniPanel;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    UniPanel1: TUniPanel;
    UniLabel4: TUniLabel;
    EdCode: TUniEdit;
    EdLib: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    DBLPays: TUniDBLookupComboBox;
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnSaveClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     var
    id_port, lib_port, code_port, pays_port : string;
    FmContext : string;
    EditContext : string;
  end;

function FEditPort: TFEditPort;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UFunction, UGlobal, ULoadData;

function FEditPort: TFEditPort;
begin
  Result := TFEditPort(DM.GetFormInstance(TFEditPort));
end;

procedure TFEditPort.BtnCancelClick(Sender: TObject);
begin
  close;
end;

procedure TFEditPort.BtnSaveClick(Sender: TObject);
begin
        //INSERT
  if FmContext = AddContext then
      begin
         if DBLPays.KeyValue = 0 then
                  begin
                     MessageDlg('Veuillez sélectionner  le Pays ',mtWarning,[mbok]);
                     DBLPays.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
         else

        if EdLib.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libellé',mtWarning,[mbok]);
                 EdLib.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from Port where libelle_port=:libelle_port');
                   Parameters.ParamByName('libelle_port').Value:=EdLib.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Port posséde dejà ce Libellé',mtError,[mbok]);
                       EdLib.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdCode.IsBlank = false  then
              begin
                  with  DM.QCheck do
                    begin
                         close;
                         SQL.Clear;
                         sql.add('select * from port where code_port=:code_port');
                         Parameters.ParamByName('code_port').Value:=EdCode.text;
                         ExecSQL;
                         Open;
                    end;
                    if DM.QCheck.RecordCount > 0 then
                         begin
                             MessageDlg('Un Port posséde dejà ce Code',mtError,[mbok]);
                             EdCode.JSInterface.JSCall('focus' ,[]);
                             Abort;
                         end
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
                                                  SQL.Text := ('INSERT INTO port (code_port, libelle_port, pays_port ) Values (:code, :libelle, :pays  )');
                                                  Parameters.ParamByName('code').Value:= EdCode.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLib.Text;
                                                  Parameters.ParamByName('pays').Value:= DBLPays.KeyValue;
                                                  ExecSQL;
                                              end;

                                     LoadDBLPort;
                                     close;
                                end
                            end ;
                          end
                        );
              end;

      end

    else
end;

procedure TFEditPort.UniFormShow(Sender: TObject);
begin
  LoadDBLPays;
end;

end.

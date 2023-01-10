unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniPanel,
  acPNG, uniImage, uniButton, uniBitBtn, uniCheckBox, uniEdit, uniGroupBox,
  uniLabel;

type
  TFLogin = class(TUniLoginForm)
    UniContainerPanel1: TUniContainerPanel;
    UniSimplePanel1: TUniSimplePanel;
    UniSimplePanel3: TUniSimplePanel;
    UniImage1: TUniImage;
    UniLabel3: TUniLabel;
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    ConnectCheck: TUniCheckBox;
    BtConnect: TUniBitBtn;
    password: TUniEdit;
    Login: TUniEdit;
    UniLabel4: TUniLabel;
    LbErrorMessage: TUniLabel;
    procedure BtConnectClick(Sender: TObject);
    procedure LoginKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure passwordKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UniLoginFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FLogin: TFLogin;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, Main, ServerModule, UDataLaod,
  UGlobal;

function FLogin: TFLogin;
begin
  Result := TFLogin(DM.GetFormInstance(TFLogin));
end;

procedure TFLogin.BtConnectClick(Sender: TObject);
begin
   if Login.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Login',mtWarning,[mbok]);
                 Login.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

   if password.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Mot de passe',mtWarning,[mbok]);
                 password.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

  with  DM.QLogin do
                begin
                     close;
                     SQL.Clear;
                     sql.add('select * from user where login_user=:login AND password_user=:pass');
                     Parameters.ParamByName('login').Value:=Login.text;
                     Parameters.ParamByName('pass').Value:=password.text;
                     ExecSQL;
                     Open;
                end;
  if DM.QLogin.RecordCount > 0 then
      begin
        UserId := DM.QLogin.FieldValues['id_user'];
        UserPass := DM.QLogin.FieldValues['password_user'];
        UserLogin := DM.QLogin.FieldValues['login_user'];
        UserLastName := DM.QLogin.FieldValues['last_name_user'];
        UserFirstName := DM.QLogin.FieldValues['first_name_user'];

        with  DM.QStand do
                begin
                     close;
                     SQL.Clear;
                     sql.add('select * from exercice where actif_exercice=TRUE ');
                     ExecSQL;
                     Open;
                end;
        if DM.QStand.RecordCount > 0 then
            begin
              LibExerciceInst := DM.QStand.FieldValues['libelle_exercice']  ;
              IdExerciceInst := DM.QStand.FieldValues['id_exercice'];
            end

        else

        if ConnectCheck.Checked then
            RegistreCookies(Login.Text, password.Text, Sender) ;
        ModalResult := mrOk;
      end
  else
      begin
      LbErrorMessage.Text:= 'Donn�es Utilisateur Erron�es';
      LbErrorMessage.Visible := true;
      end;
end;

procedure TFLogin.LoginKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
    with BtConnect   do
      JSInterface.JSCall('fireEvent', ['click', JSControl]);
end;

procedure TFLogin.passwordKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    with BtConnect   do
      JSInterface.JSCall('fireEvent', ['click', JSControl]);
end;

procedure TFLogin.UniLoginFormShow(Sender: TObject);
begin
//    Login.Text:='BATAJOIE';
//    password.Text:='batajoie';

//
//    Login.Text:='BLAJOIE';
//    password.Text:='batajoie';

end;

initialization
  RegisterAppFormClass(TFLogin);
end.

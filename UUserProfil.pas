unit UUserProfil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniEdit, uniLabel;

type
  TFUserProfil = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    EdNom: TUniEdit;
    Edprenoms: TUniEdit;
    EdRole: TUniEdit;
    EdLogin: TUniEdit;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    EdPass: TUniEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FUserProfil: TFUserProfil;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FUserProfil: TFUserProfil;
begin
  Result := TFUserProfil(DM.GetFormInstance(TFUserProfil));
end;

end.
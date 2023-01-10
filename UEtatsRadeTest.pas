unit UEtatsRadeTest;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uniGUIBaseClasses, uniGUIClasses,
  uniPanel, uniLabel;

type
  TFEtatsRadeTest = class(TForm)
    UniPanel1: TUniPanel;
    UniLabel1: TUniLabel;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  FEtatsRadeTest: TFEtatsRadeTest;

implementation

{$R *.dfm}

end.

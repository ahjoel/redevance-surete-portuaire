unit UniForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel;

type
  TUniForm2 = class(TUniForm)
    UniPanel1: TUniPanel;
    UniPanel2: TUniPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniForm2: TUniForm2;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function UniForm2: TUniForm2;
begin
  Result := TUniForm2(DM.GetFormInstance(TUniForm2));
end;

end.

unit UProject_Function;

interface

//TITLE FUNCTION

function FrmPanTitle(Name:string; Mode: String; exercice:string) : string ;

implementation

function FrmPanTitle(Name:string; Mode: String; exercice:string) : string ;
begin
  Result := Name + ' - ' + Mode + ' | ' + exercice ;
end;

end.

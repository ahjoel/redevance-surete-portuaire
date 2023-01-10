unit UFunction;

interface
uses Forms,SysUtils, Classes, DB, ADODB,inifiles, DBCtrls, Grids,Dialogs, uniDBGrid, UniDateTimePicker,
    Windows,clipbrd , DBGrids,strUtils, Excel2000,Variants, sGauge,Graphics ,TLHelp32,jpeg,
    Messages, Controls,Menus,NB30,registry,sEdit, frxGradient, UniURLFrame , uniPanel, uniGUIBaseClasses,
    frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet,  uniGUIAbstractClasses, uniGUIClasses, uniGUIForm, uniButton;

//Fusion
function FusionEdit(str1:string; str2:string):string;

//procedure InitInterface;
function  DeCryptage(mot:string):string;
function Cryptage(mot:string):string;

//procedure ChargerparamConnex(dbname: TADOConnection;user,pwd,dsn:string);
procedure ChargerparamConnex(dbname: TADOConnection;h,p,db,user,pwd:string);
procedure SetInterface(matric : integer);
Procedure ExportToExcelAvecTime(aGrid : TDBGrid;ProgBar: TsGauge);
function AjouterGuillemet(s:string):string;
function OperateurEnLettre(s:string):string;
Function CompteStr(Const SubStr:String;Const s:String):Integer;
function ComputerName: string;
function GetElementFactCode(efl:string):string;

//function RepertoireTemporaireWindows: String;
function GetTempDossier: String;
Function GetWindowsDossier :string;
Function GetSystemDossier :string;

Procedure ValiderExportation(aGrid : TDBGrid;ProgBar: TsGauge;typeE : string);


function droite(substr: string; s: string): string;
function DroiteDroite(substr: string; s: string): string;
function gauche(substr: string; s: string): string;
function GaucheDuDernier(substr: string; s: string): string;
function NbSousChaine(substr: string; s: string): integer;
function NDroite(substr: string; s: string;n:integer): string;
function GaucheNDroite(substr: string; s: string;n:integer): string;
function StrReplace(Substr,replace,s:string):string;
function EtatExerciceInt(e:string):integer;
function EtatExerciceStr(e:integer):string;

function EntierADeuxchiffre(n:integer):string;
function EntierATroischiffre(n:integer):string;
function SommeStringGrid(gd:TStringGrid;coln:integer):int64;
function SommeStringGridSansParc(gd:TStringGrid;coln:integer):int64;
function ArrondirMontant(mtt:integer):integer;
Function SeparateurMillier(n:string):STRING;
function SommeStringGridNormal(gd:TStringGrid;coln:integer):int64;
function SommeStringGridNormal_Head(gd:TStringGrid;coln:integer):int64;
procedure ChangeFileDateTimes(const aFileName :TFileName; const aDate :TDateTime);
function GetFileTimes(const FileName: string; var Created: TDateTime;
  var Accessed: TDateTime; var Modified: TDateTime): Boolean;
function ApplicationVersion: String;
function GetActiviteInformCode(act:string):integer;
function GetZoneCode(act:string):string;
procedure ConversionJPEGversBMP(const FichierEntree, FichierSortie: string);
function GetlicenceKeys(val,key:string):boolean;
//function MakeLicenceKeys(val,key:string):boolean;
//function VerifierLicence:string;
function GetAdapterInfo(Lana: AnsiChar): String;
function GetMACAddress: string;
function GetlicenceVals(dsk,mac:string):string;
function FormaterLicenceVal(dsk,mac:string):string;
function CryptageLicence7(mot:string):string;
function CryptageLicence5(mot:string):string;
function CryptageLicence3(mot:string):string;
function CryptageLicence1(mot:string):string;
function DeCryptageLicence1(mot:string):string;
function DeCryptageLicence3(mot:string):string;
function DeCryptageLicence5(mot:string):string;
function DeCryptageLicence7(mot:string):string;
function GetMachineID:string;
function FormaterDate(d1:tdate):string;
Procedure SommeDBGrid1(Req:TADOQuery;Col1:string;Som1:int64;EdS1:TsEdit;PrgB:TsGauge);
Procedure SommeDBGrid2(Req:TADOQuery;Col1,Col2:string;Som1,Som2:int64;EdS1,EdS2:TsEdit;PrgB:TsGauge);
Procedure SommeDBGrid3(Req:TADOQuery;Col1,Col2,Col3:string;Som1,Som2,Som3:int64;EdS1,EdS2,EdS3:TsEdit;PrgB:TsGauge);
function AfficheTemps(T:integer):string;
procedure AdjustColumnWidths(DBGrid: TDBGrid);
procedure AutoSizeDBGrid(xDBGrid: TDBGrid);

function nbre_mois( nbre:integer): string;
function mois_nbre( moi:string): Integer;
function anne_suv (mois:Integer):Integer;
function datefr(mydate: string): string;
function MajusculePremiereLettreDuMot(const Chaine : String) : String;

//FONCTION ***NOMBRE EN LETTRE***
function NombreEnLettres(n : integer ; France : Boolean = True ) : string;
Function Chiffre_Lettre(chiffre: real; SM: String): string;

Function FrmEditTitle(parent: string; context :string): string;

//FONCTION VERIFICATION DATE ET HEURE
function VerifDate(str: string): Boolean;
function VerifHeureSansMSec(str: string): Boolean;
function VerifHeure(str: string): Boolean;

function IncrementRef(last_ref: string; num_width : integer; prefix:string) : string;

 //DATE TIME FUCTION

 function msqlDateTime(date_time : TUniDateTimePicker):string;


const  FmenuName='FMenu';

  lcname='\SIGElicence.ini';



var
 F:text;
 exepath,imgpath,lcpath:string;

//  fileini:TIniFile;
//   inifile,PConnexion,SecID,SecPwd,SecDsn,ValID,ValPwd,ValDsn:string;
//   SecCnxt,SecCmdt,ValCnx,ValCmd:string;
   Mname:TMenuItem;
   nbalerte:integer;
   ligne:integer;

   SomFacture,SomRegle,SomSolde:int64;

implementation

uses MainModule, ServerModule, ULoadData;

//Incrementation de Reference

function msqlDateTime(date_time : TUniDateTimePicker):string;
begin
  Result := FormatDateTime('YYYY-MM-DD hh:mm:ss', date_time.DateTime);
end;

function FusionEdit(str1:string; str2:string):string;
begin
  if (str1.IsEmpty) or (str2.IsEmpty) then
  result := ''
  else
  result := str1 + ' - ' + str2;
end;

Function FrmEditTitle(parent: string; context :string): string;
begin
  Result := parent + ' - ' + context;
end;


function IncrementRef(last_ref: string; num_width : integer; prefix:string) : string;
var new_ref_int, width_int ,new_ref_int_width: integer;
    new_int_format : string;

begin
  if last_ref.IsEmpty then
        Result := prefix+ (DupeString('0', num_width)) +'1'
  else
      begin
         new_ref_int := (StrToInt(Copy(last_ref, prefix.Length+1, num_width+1))) + 1;
         new_ref_int_width := (IntToStr(new_ref_int)).Length;
         new_int_format := ( DupeString('0', (num_width - new_ref_int_width+1)))+ IntToStr(new_ref_int) ;
         result := prefix+new_int_format;
      end;
end;


//IMPLEMENTATION VERIFICATION DE DATE
function VerifDate(str: string): Boolean;
var
dt: TDateTime;
begin
Result:= true;
 try
    dt:= StrToDate(str);
    except
    Result:= false;
 end;
end;

//IMPLEMENTATION VERIFICATION D'HEURE SANS SECOND
function VerifHeureSansMSec(str: string): Boolean;
var
dt: TDateTime;
begin
Result:= true;
try
str:=str+':00';
dt:= StrToTime(str);
except
Result:= false;
end;
end;

//IMPLEMENTATION VERIFICATION HEURE
function VerifHeure(str: string): Boolean;
var
dt: TDateTime;
begin
Result:= true;
try
dt:= StrToTime(str);
except
Result:= false;
end;
end;






function datefr(mydate: string): string;
begin
  result := copy(mydate, 7, 4) + '/' + copy(mydate, 4, 2) + '/' +
    copy(mydate, 1, 2);
end;
function Renvoi_max(ch:String;tabl:String):Integer;
 var i:integer;
 begin
 i:=0;
   with DM.ADO_function do
   begin
       Close;
       SQL.Clear;
       SQL.Add('Select max(');
       SQL.Add(ch);
       SQL.Add(') from '+ tabl +';');
       ExecSQL;
       Active:=true;
   end;
   if DM.ADO_function.RecordCount = 1 then begin
        i:= ((DM.ADO_function.Fields[0].AsInteger )+1) ;
   end;
   Result:=i;
 end;

 //METTRE LE PREMIER MOT EN MAJISCULE
 function MajusculePremiereLettreDuMot(const Chaine : String) : String;
var
   i        : Integer;
   Lettre   : Char;
   Initiale : Boolean;
begin
   Initiale := True;
   Result   := '';
   for i := 1 to Length(Chaine) do
   begin
      Lettre := Chaine[i];
      if Lettre in [#32,'-','.'] then
         Initiale := True
      else
         if Initiale then
         begin
            Lettre   := UpperCase(Lettre)[1];
            Initiale := False;
          end;
      Result := Result+Lettre;
    end;
end;


function nbre_mois( nbre:integer): string;
var mois:string;
begin
case nbre of
1:mois:='JANVIER';
2:mois:='FEVRIER';
3:mois:='MARS';
4:mois:='AVRIL';
5:mois:='MAI';
6:mois:='JUIN';
7:mois:='JUILLET';
8:mois:='AOUT';
9:mois:='SEPTEMBRE';
10:mois:='OCTOBRE';
11:mois:='NOVEMBRE';
12:mois:='DECEMBRE';
end;
Result:=mois;
end;

function mois_nbre( moi: string):Integer;
var nb:Integer;
begin
if moi='JANVIER' then
nb:=1
else
if moi='FEVRIER' then
nb:=2
else
if moi='MARS' then
nb:=3
else
if moi='AVRIL' then
nb:=4
else
if moi='MAI' then
nb:=5
else
if moi='JUIN' then
nb:=6
else
if moi='JUILLET' then
nb:=7
else
if moi='AOUT' then
nb:=8
else
if moi='SEPTEMBRE' then
nb:=9
else
if moi='OCTOBRE' then
nb:=10
else
if moi='NOVEMBRE' then
nb:=11
else
if moi='DECEMBRE' then
nb:=12
else
Result:=nb;
end;
function anne_suv (mois:Integer):Integer;
begin
  if mois=12 then

end;

procedure AutoSizeDBGrid(xDBGrid: TDBGrid);
var I, TotalWidht, VarWidth, QtdTotalColuna : Integer; xColumn : TColumn;
begin // Largura total de todas as colunas antes de redimensionar
TotalWidht := 0;
// Como dividir todo o espa�o extra na grade
VarWidth := 0;
// Quantas colunas devem ser auto-redimensionamento
QtdTotalColuna := 0; for I := 0 to -1 + xDBGrid.Columns.Count do
begin
TotalWidht := TotalWidht + xDBGrid.Columns[I].Width;
if xDBGrid.Columns[I].Field.Tag <> 0 then Inc(QtdTotalColuna);
end;
// Adiciona 1px para a linha de separador de coluna
if dgColLines in xDBGrid.Options then
TotalWidht := TotalWidht + xDBGrid.Columns.Count;
// Adiciona a largura da coluna indicadora
if dgIndicator in xDBGrid.Options then
TotalWidht := TotalWidht + IndicatorWidth;
// width vale "Left"
VarWidth := xDBGrid.ClientWidth - TotalWidht;
// Da mesma forma distribuir VarWidth para todas as colunas auto-resizable
if QtdTotalColuna > 0 then
VarWidth := varWidth div QtdTotalColuna;
for I := 0 to -1 + xDBGrid.Columns.Count do
begin xColumn := xDBGrid.Columns[I];
if xColumn.Field.Tag <> 0 then
begin xColumn.Width := xColumn.Width + VarWidth;
if xColumn.Width < xColumn.Field.Tag then
xColumn.Width := xColumn.Field.Tag;
end;
end;
end;


//
procedure AdjustColumnWidths(DBGrid: TDBGrid);
var
  TotalColumnWidth, ColumnCount, GridClientWidth, Filler, i: Integer;
begin
  ColumnCount := DBGrid.Columns.Count;
  if ColumnCount = 0 then
    Exit;

  // compute total width used by grid columns and vertical lines if any
  TotalColumnWidth := 0;
  for i := 0 to ColumnCount-1 do
    TotalColumnWidth := TotalColumnWidth + DBGrid.Columns[i].Width;
  if dgColLines in DBGrid.Options then
    // include vertical lines in total (one per column)
    TotalColumnWidth := TotalColumnWidth + ColumnCount;

  // compute grid client width by excluding vertical scroll bar, grid indicator,
  // and grid border
  GridClientWidth := DBGrid.Width - GetSystemMetrics(SM_CXVSCROLL);
  if dgIndicator in DBGrid.Options then
  begin
    GridClientWidth := GridClientWidth - IndicatorWidth;
    if dgColLines in DBGrid.Options then
      Dec(GridClientWidth);
  end;
  if DBGrid.BorderStyle = bsSingle then
  begin
    if DBGrid.Ctl3D then // border is sunken (vertical border is 2 pixels wide)
      GridClientWidth := GridClientWidth - 4
    else // border is one-dimensional (vertical border is one pixel wide)
      GridClientWidth := GridClientWidth - 2;
  end;

  // adjust column widths
  if TotalColumnWidth < GridClientWidth then
  begin
    Filler := (GridClientWidth - TotalColumnWidth) div ColumnCount;
    for i := 0 to ColumnCount-1 do
      DBGrid.Columns[i].Width := DBGrid.Columns[i].Width + Filler;
  end
  else if TotalColumnWidth > GridClientWidth then
   begin
    Filler := (TotalColumnWidth - GridClientWidth) div ColumnCount;
    if (TotalColumnWidth - GridClientWidth) mod ColumnCount <> 0 then
      Inc(Filler);
    for i := 0 to ColumnCount-1 do
      DBGrid.Columns[i].Width := DBGrid.Columns[i].Width - Filler;
  end;
end;


function AfficheTemps(T:integer):string;
var tps:string;
H,M,S,J,temp1,temp2:word;

SH,SM,SS,SJ:STRING;
begin
//
tps:='';

if T < 60 then tps:=inttostr(T)+' Sec'
else
IF (T>=60)and(T<3600) then
begin
M:=T DIV 60;
S:=T mod 60;

IF M<10 THEN SM:='0'+inttostr(M) else SM:=inttostr(M);
IF S<10 THEN SS:='0'+inttostr(S) else SS:=inttostr(S);

tps:=SM+' Min '+SS+' Sec'
end
else
IF (T>=3600)and(T<86400) then
begin
H:=T div 3600;
temp1:= T mod 3600;
M:= temp1 div 60;
S:= temp1 mod 60;

IF H<10 THEN SH:='0'+inttostr(H) else SH:=inttostr(H);
IF M<10 THEN SM:='0'+inttostr(M) else SM:=inttostr(M);
IF S<10 THEN SS:='0'+inttostr(S) else SS:=inttostr(S);

tps:= SH+' H '+SM+' Min '+SS+' Sec';
end
else
if (T>=86400) then
begin
J:= T div 86400;
temp1:= T mod 86400;
H:=temp1 div 3600;
temp2:=temp1 mod 3600;
M:= temp2 div 60;
S:= temp2 mod 60;

IF J<10 THEN SJ:='0'+inttostr(J) else SH:=inttostr(J);
IF H<10 THEN SH:='0'+inttostr(H) else SH:=inttostr(H);
IF M<10 THEN SM:='0'+inttostr(M) else SM:=inttostr(M);
IF S<10 THEN SS:='0'+inttostr(S) else SS:=inttostr(S);

tps:= SJ+' J '+SH+' H '+SM+' Min '+SS+' Sec';

end;

Result:=tps;

end;

Procedure SommeDBGrid1(Req:TADOQuery;Col1:string;Som1:int64;EdS1:TsEdit;PrgB:TsGauge);
begin
if req.IsEmpty then
begin
som1:=0    ;
EdS1.Text:= SeparateurMillier(inttostr(som1));
end
else
begin
 req.First;
som1:=0;
PrgB.Progress:=0;
ligne:=0;

PrgB.Visible:=true;
PrgB.MaxValue:=req.RecordCount;
while not req.eof do
begin
som1:=som1+req.FieldValues[col1];

inc(ligne);
PrgB.Progress:=ligne;

Application.ProcessMessages;
req.Next;
end;
req.First;

EdS1.Text:= SeparateurMillier(inttostr(som1));
PrgB.Visible:=false;
Application.ProcessMessages;
end;

end;


Procedure SommeDBGrid2(Req:TADOQuery;Col1,Col2:string;Som1,Som2:int64;EdS1,EdS2:TsEdit;PrgB:TsGauge);
begin
if req.IsEmpty then
begin
som1:=0;
Som2:=0;
EdS1.Text:= SeparateurMillier(inttostr(som1));
EdS2.Text:=SeparateurMillier(inttostr(som2));
end
else
begin
som1:=0;
Som2:=0;

req.First;

PrgB.Progress:=0;
ligne:=0;

PrgB.Visible:=true;
PrgB.MaxValue:=req.RecordCount;
while not req.eof do
begin
som1:=som1+req.FieldValues[col1];
som2:=som2+req.FieldValues[col2];

inc(ligne);
PrgB.Progress:=ligne;
;
Application.ProcessMessages;

req.Next;
end;

req.First;

EdS1.Text:= SeparateurMillier(inttostr(som1));
EdS2.Text:=SeparateurMillier(inttostr(som2));

PrgB.Visible:=false;
Application.ProcessMessages;



end;

end;

Procedure SommeDBGrid3(Req:TADOQuery;Col1,Col2,Col3:string;Som1,Som2,Som3:int64;EdS1,EdS2,EdS3:TsEdit;PrgB:TsGauge);
begin
if req.IsEmpty then
begin
som1:=0;
Som2:=0;
som3:=0;
EdS1.Text:= SeparateurMillier(inttostr(som1));
EdS2.Text:=SeparateurMillier(inttostr(som2));
EdS3.Text:=SeparateurMillier(inttostr(som3));
end
else
begin
som1:=0;
Som2:=0;
som3:=0;

req.First;

PrgB.Progress:=0;
ligne:=0;
PrgB.Visible:=true;
PrgB.MaxValue:=req.RecordCount;
while not req.eof do
begin

som1:=som1+req.FieldValues[col1];
som2:=som2+req.FieldValues[col2];
som3:=som3+req.FieldValues[col3];

inc(ligne);
PrgB.Progress:=ligne;

Application.ProcessMessages;
req.Next;
end;

req.First;

EdS1.Text:= SeparateurMillier(inttostr(som1));
EdS2.Text:=SeparateurMillier(inttostr(som2));
EdS3.Text:=SeparateurMillier(inttostr(som3));

PrgB.Visible:=false;
Application.ProcessMessages;


end;

end;

//function GetLabelGDP:string;
//var lb:string;
//begin
//lb:='';
//try
//MD.QStand.Close;
//MD.QStand.SQL.Clear;
//MD.QStand.SQL.Add('select max(label_info) label_info from label_gdp');
//MD.QStand.Open;
//
//if MD.QStand.IsEmpty then
//lb:=''
//else
//lb:=MD.QStand.FieldValues['label_info'];
//
//except
//lb:='';
//end;
//
//Result:=lb;
//
//end;




function FormaterDate(d1:tdate):string;
var m,d,y:word; madate:string;
begin
//
DecodeDate(d1,y,m,d);
madate:=inttostr(y)+'/'+inttostr(m)+'/'+inttostr(d);

Result:=madate;
end;



function GetMachineID:string;
var macid:string; lecteur,dskid:string;  machineid:string;
   VolName     : Array[0..Max_Path]Of Char;
    FileSysName : Array[0..Max_Path]Of Char;
    VolSerial   : DWord;
    FileMaxLen  : DWord;
    FileFlags   : DWord;
begin
  //
  lecteur:=ExtractFileDrive(Application.ExeName);
lecteur:=lecteur+'\';

if GetVolumeInformation(pchar(lecteur),VolName,Max_Path,@VolSerial,
             FileMaxLen, FileFlags,FileSysName,Max_Path)then
dskid:= IntToStr(VolSerial) else dskid:='';



//ShowMessage('Nom du disque       :'+VolName
//                 +#13'Syst�me de fichiers :'+FileSysName
//                 +#13'Num�ro de s�rie     :'+IntToStr(VolSerial));


macid:=  GetMACAddress;

macid:=StrReplace('-','',macid);


//machineid:=GetlicenceVals(dskid,macid);

machineid:=FormaterLicenceVal(dskid,macid);

//machineid:=dskid+'-'+macid;

Result:=machineid;

end;

function DeCryptageLicence1(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);



//inversion et decryptage du mot
motinv:='';
i:=lg;
while  i>=1 do
begin

s:= mot[i];
asci1:=ord(s);
asci2:=asci1-1;
c:=char(asci2);

motinv:=motinv+c ;



Dec(i);
end;
//


Result:=motinv;

end;


function DeCryptageLicence3(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);



//inversion et decryptage du mot
motinv:='';
i:=lg;
while  i>=1 do
begin

s:= mot[i];
asci1:=ord(s);
asci2:=asci1-3;
c:=char(asci2);

motinv:=motinv+c ;



Dec(i);
end;
//


Result:=motinv;

end;


function DeCryptageLicence5(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);



//inversion et decryptage du mot
motinv:='';
i:=lg;
while  i>=1 do
begin

s:= mot[i];
asci1:=ord(s);
asci2:=asci1-5;
c:=char(asci2);

motinv:=motinv+c ;



Dec(i);
end;
//


Result:=motinv;

end;


function DeCryptageLicence7(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);



//inversion et decryptage du mot
motinv:='';
i:=lg;
while  i>=1 do
begin

s:= mot[i];
asci1:=ord(s);
asci2:=asci1-7;
c:=char(asci2);

motinv:=motinv+c ;



Dec(i);
end;
//


Result:=motinv;

end;





function CryptageLicence1(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);

//inversion et cryptage du mot
motinv:='';
i:=lg;
while i>=1 do
begin
s:= mot[i];
asci1:=ord(s);
asci2:=asci1+1;
c:=char(asci2);

motinv:=motinv+c ;
Dec(i);
end;
//
Result:=motinv;
end;

function CryptageLicence3(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);

//inversion et cryptage du mot
motinv:='';
i:=lg;
while i>=1 do
begin
s:= mot[i];
asci1:=ord(s);
asci2:=asci1+3;
c:=char(asci2);

motinv:=motinv+c ;
Dec(i);
end;
//
Result:=motinv;
end;

function CryptageLicence5(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);

//inversion et cryptage du mot
motinv:='';
i:=lg;
while i>=1 do
begin
s:= mot[i];
asci1:=ord(s);
asci2:=asci1+5;
c:=char(asci2);

motinv:=motinv+c ;
Dec(i);
end;
//
Result:=motinv;
end;


function CryptageLicence7(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);

//inversion et cryptage du mot
motinv:='';
i:=lg;
while i>=1 do
begin
s:= mot[i];
asci1:=ord(s);
asci2:=asci1+7;
c:=char(asci2);

motinv:=motinv+c ;
Dec(i);
end;
//
Result:=motinv;
end;


function Cryptage(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);

//inversion et cryptage du mot
motinv:='';
i:=lg;
while i>=1 do
begin
s:= mot[i];
asci1:=ord(s);
asci2:=asci1+1;
c:=char(asci2);

motinv:=motinv+c ;
Dec(i);
end;
//



Result:=motinv;

end;


function FormaterLicenceVal(dsk,mac:string):string;
var dsk1,dsk2,mac1,mac2:string;
lg,moitier:integer;
begin
///////DISK
lg:=length(dsk);
if lg>0 then
begin
if lg<=1 then
begin
dsk1:=dsk;
dsk2:='';
end
else
begin
moitier:= lg div 2;
dsk1:=copy(dsk,1,moitier);
dsk2:= copy(dsk,moitier+1,lg-moitier);
end;

end;

///////MAC
lg:=length(mac);
if lg>0 then
begin
if lg<=1 then
begin
mac1:=mac;
mac2:='';
end
else
begin
moitier:= lg div 2;
mac1:=copy(mac,1,moitier);
mac2:= copy(mac,moitier+1,lg-moitier);
end;

end;


Result:=mac1+dsk1+mac2+dsk2;

//
end;

function GetlicenceVals(dsk,mac:string):string;
var gdpval:string;
begin
  //
gdpval:=dsk+mac;

Result:=gdpval;

end;

function getlicenceKeys(val,key:string):boolean;
var Reg: TRegistry;  lm:boolean;
begin
  //
Reg := TRegistry.Create;
//lm:=false;
try
 reg.RootKey := HKEY_LOCAL_MACHINE; // A l'ouverture d'une session de chaque utilisateurs
    // il faut la cr�er la cl� si elle n'existe  pas
 reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Padlock', false) ;

 val:= reg.ReadString('GDPVAL');
 key:= reg.ReadString('GDPKEY');

   reg.CloseKey;

   lm:=true;
except
Reg.Free;
lm:=false;
end;

Result:=lm;

end;





function GetAdapterInfo(Lana: AnsiChar): String;
var
  Adapter: TAdapterStatus;
  NCB: TNCB;
begin
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBRESET);
  NCB.ncb_lana_num := Lana;
  if Netbios(@NCB) <> Char(NRC_GOODRET) then
  begin
    Result := 'mac not found';
    Exit;
  end;

  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBASTAT);
  NCB.ncb_lana_num := Lana;
  NCB.ncb_callname := '*';

  FillChar(Adapter, SizeOf(Adapter), 0);
  NCB.ncb_buffer := @Adapter;
  NCB.ncb_length := SizeOf(Adapter);
  if Netbios(@NCB) <> Char(NRC_GOODRET) then
  begin
    Result := 'mac not found';
    Exit;
  end;
  Result :=
    IntToHex(Byte(Adapter.adapter_address[0]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[1]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[2]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[3]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[4]), 2) + '-' +
    IntToHex(Byte(Adapter.adapter_address[5]), 2);
end;


function GetMACAddress: string;
var
  AdapterList: TLanaEnum;
  NCB: TNCB;
begin
  FillChar(NCB, SizeOf(NCB), 0);
  NCB.ncb_command := Char(NCBENUM);
  NCB.ncb_buffer := @AdapterList;
  NCB.ncb_length := SizeOf(AdapterList);
  Netbios(@NCB);
  if Byte(AdapterList.length) > 0 then
    Result := GetAdapterInfo(AdapterList.lana[0])
  else
    Result := 'mac not found';
end;


function ApplicationVersion: String;
var
  VerInfoSize, VerValueSize, Dummy: DWord;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  {Deux solutions : }
  if VerInfoSize <> 0 then
  {- Les info de version sont inclues }
  begin
    {On alloue de la m�moire pour un pointeur sur les info de version : }
    GetMem(VerInfo, VerInfoSize);
    {On r�cup�re ces informations : }
    GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
    {On traite les informations ainsi r�cup�r�es : }
    with VerValue^ do
    begin
      Result := IntTostr(dwFileVersionMS shr 16);
      Result := Result + '.' + IntTostr(dwFileVersionMS and $FFFF);
      Result := Result + '.' + IntTostr(dwFileVersionLS shr 16);
      Result := Result + '.' + IntTostr(dwFileVersionLS and $FFFF);
    end;

    {On lib�re la place pr�c�demment allou�e : }
    FreeMem(VerInfo, VerInfoSize);
  end

  else
    {- Les infos de version ne sont pas inclues }
    {On d�clenche une exception dans le programme : }
    raise EAccessViolation.Create('Les informations de version de sont pas inclues');
end;


procedure ConversionJPEGversBMP(const FichierEntree, FichierSortie: string);
var ImageJPEG : TJPEGImage;
    ImageBitmap : TBitmap;
begin
  ImageJPEG := TJPEGImage.Create;
  try
    ImageJPEG.LoadFromFile(FichierEntree); //Chargement de l'image

    ImageBitmap := TBitmap.Create;
    try
      //On donne la m�me taille que l'image jpeg
      ImageBitmap.Width := ImageJPEG.Width;
      ImageBitmap.Height := ImageJPEG.Height;

      //On dessine le jpeg sur le canvas du Bitmap
      ImageBitmap.Canvas.Draw(0, 0, ImageJPEG);
      //On enregistre
      ImageBitmap.SaveToFile(FichierSortie);
    finally
      ImageBitmap.Free;
    end;
  finally
    ImageJPEG.Free;
  end;
end;


Function SeparateurMillier(n:string):STRING;
var tab:array[1..20] of string     ; i,lg,cpt:Int64 ; s:string;  rest,u0,u:Int64;
BEGIN

lg:=length(n);

i:=0;
u0:=lg-2;
u:=lg;

while u>=1 do
begin

if lg <= 3 then begin i:=i+1; tab[i]:=n ; break; end
else
begin
i:=i+1;
u:=u0+3-3*i;

//cpt:=cpt+1;
if u>0 then
begin
tab[i]:= copy(n,u,3) ;            end
else begin rest:= lg mod 3; tab[i]:= copy(n,1,rest);    end;

end;


end;

//for cpt:=i downto 1 do
//ShowMessage(tab[cpt]);

s:='';
for cpt:=i downto 1 do
if cpt<>1 then
s:=s+tab[cpt]+' ' else s:=s+tab[cpt];

s:=trim(s) ;

Result:=s;


end;



function ArrondirMontant(mtt:integer):integer;
var arrondi:integer;
begin
if mtt=0 then arrondi:=0
else
if mtt<100 then arrondi:=100-mtt
else
  arrondi:=100-(mtt mod 100);

Result:=arrondi;

end;




function SommeStringGridSansParc(gd:TStringGrid;coln:integer):int64;
var cpt,s:int64;i:integer;
begin
cpt:=gd.RowCount;
s:=0;
for i:=1 to cpt-1 do
if (gd.Cells[0,i] <>'76510003') and (gd.Cells[coln,i] <>'') then s:=s+strtoint(gd.Cells[coln,i]);


Result:=s;

end;



function SommeStringGrid(gd:TStringGrid;coln:integer):int64;
var cpt,s:int64; i:integer;
begin
cpt:=gd.RowCount;
s:=0;
for i:=1 to cpt-1 do
if gd.Cells[coln,i] <>'' then s:=s+strtoint(gd.Cells[coln,i]);


Result:=s;

end;


function SommeStringGridNormal(gd:TStringGrid;coln:integer):int64;
var cpt,s:int64;i:integer;
begin
cpt:=gd.RowCount;
s:=0;
for i:=0 to cpt-1 do
if gd.Cells[coln,i] <>'' then s:=s+strtoint(StrReplace(' ','',gd.Cells[coln,i]));

Result:=s;

end;

//StringGird avec en t�te
function SommeStringGridNormal_Head(gd:TStringGrid;coln:integer):int64;
var cpt,s:int64;i:integer;
begin
cpt:=gd.RowCount;
s:=0;
for i:=1 to cpt-1 do
if gd.Cells[coln,i] <>'' then s:=s+strtoint(StrReplace(' ','',gd.Cells[coln,i]));

Result:=s;

end;


function EtatExerciceStr(e:integer):string;
begin
if e=1 then Result:= 'OUI'
else Result:='NON';
end;

function EtatExerciceInt(e:string):integer;
begin
if UpperCase(e)='OUI' then Result:=1
else Result:=0;

end;

function EntierADeuxchiffre(n:integer):string;
begin
if n<10 then Result:='0'+inttostr(n)
else
Result:= inttostr(n);

end;

function EntierATroischiffre(n:integer):string;
begin
if n<10 then Result:='00'+inttostr(n)
else
if (n>=10) and (n<100) then Result:='0'+inttostr(n)
else
Result:= inttostr(n);

end;


function StrReplace(Substr,replace,s:string):string;
{============================================================================}
{remplace toutes les sous-chaines Substr par replace                         }
{ ex : StrReplace ('toto', 'tata', 'le toto est ..') renvoie 'le tata est ..'}
{============================================================================}
var ChaineSource,ChaineCible:string;
    i,TailleChaineRemplacement:integer;
begin
  ChaineSource:=s;
  ChaineCible:='';
  TailleChaineRemplacement:=length(Substr);
  while pos(Substr,ChaineSource)>0 do  //tant que l'on trouve une sous-chaine
  begin
    i:=pos(Substr,ChaineSource)-1; // position de la sous-chaine � remplacer
    ChaineCible:=ChaineCible+copy(ChaineSource,1,i)+replace;
    delete(ChaineSource,1,i+TailleChaineRemplacement);//on retire de chaineTemp
  end;
  Result:=ChaineCible+ChaineSource;
end;

function droite(substr: string; s: string): string;
{============================================================================}
{Renvoie ce qui est � droite d'une sous chaine de caract�res                 }
{ ex : Droite('aa', 'phidelsaacom') renvoie com                              }
{============================================================================}

begin
  if pos(substr,s)=0 then result:='' else
    result:=copy(s, pos(substr, s)+length(substr), length(s)-pos(substr, s)+length(substr));
end;

function droiteDroite(substr: string; s: string): string;
{============================================================================}
{ fonction qui renvoie la sous chaine de caract�re situ� � droite de la sous }
{ chaine substr situ�e la plus � droite                                      }
{ ex: si substr = '\' et S= 'truc\tr\essai.exe droiteDroite renvoie essai.exe}
{============================================================================}
begin
  Repeat
    S:=droite(substr,s);
  until pos(substr,s)=0;
  result:=S;
end;

function gauche(substr: string; s: string): string;
{============================================================================}
{ fonction qui renvoie la sous chaine de caract�re situ� � gauche de la sous }
{ chaine substr                                                              }
{ ex: si substr = '\' et S= 'truc\tr\essai.exe' gauche renvoie truc           }
{============================================================================}
begin
  result:=copy(s, 1, pos(substr, s)-1);
end;

function GaucheDuDernier(substr: string; s: string): string;
{============================================================================}
{ fonction qui renvoie la sous chaine de caract�re situ�e � gauche de la     }
{derni�re sous chaine substr                                                 }
{ ex: si substr = '\' et S= 'truc\tr\essai.exe' gauche renvoie truc\tr       }
{============================================================================}
var
 s1:string;
 i:integer;
begin
  s1:='';
  for i:=1 to NbSousChaine(substr, s)-1 do
  begin
    s1:=s1+gauche(substr,s)+substr;
    s:=droite(substr,s);
  end;
  s1:=s1+gauche(substr,s);
  result:=s1;
end;

function NbSousChaine(substr: string; s: string): integer;
{==================================================================================}
{ renvoie le nombre de fois que la sous chaine substr est pr�sente dans la chaine S}
{==================================================================================}
begin
  result:=0;
  while pos(substr,s)<>0 do
  begin
    S:=droite(substr,s);
    inc(result);
  end;
end;

function NDroite(substr: string; s: string;n:integer): string;
{==============================================================================}
{ renvoie ce qui est � droite de la n ieme sous chaine substr de la chaine S   }
{==============================================================================}
var i:integer;
begin
  for i:=1 to n do
  begin
    S:=droite(substr,s);
  end;
  result:=S;
end;

function GaucheNDroite(substr: string; s: string;n:integer): string;
{==============================================================================}
{ renvoie ce qui est � gauche de la droite de la n ieme sous chaine substr     }
{ de la chaine S                                                               }
{ ex : GaucheNDroite('/','c:machin\truc\essai.exe',1) renvoie 'truc'           }
{ Permet d'extraire un � un les �l�ments d'une chaine s�par�s par un s�parateur}
{==============================================================================}
var i:integer;
begin
  S:=S+substr;
  for i:=1 to n do
  begin
    S:=copy(s, pos(substr, s)+length(substr), length(s)-pos(substr, s)+length(substr));
  end;
  result:=copy(s, 1, pos(substr, s)-1);
end;


function GetTempDossier: String;
{-----------------------------------------------------------------------------------}
{renvoie le dossier "temporaire de Windows"                                         }
{ cette fonction renvoie :le dossier temporaire en fonction des crit�res suivants:  }
{1.	le chemin sp�cifi� par la variable d'environement TMP                       }
{2.	le chemin sp�cifi� par la variable d'environement TEMP  si TMP non d�fini   }
{3.	le dossier courant si aucune des deux variables TMP et TEMP ne sont d�finies}
{-----------------------------------------------------------------------------------}
var
  Dossier: array[0..MAX_PATH] of Char;
begin
  result:='';
  if GetTempPath(Length(Dossier), Dossier)<>0 then Result := StrPas(Dossier);
end;

Function GetWindowsDossier :string;
{Pour obtenir le dossier de Windows}
var
  Dossier: ARRAY [0..MAX_PATH] OF Char;
begin
  if GetWindowsDirectory (Dossier,Length(Dossier))<>0 then Result:=String(Dossier);
end;


Function GetSystemDossier :string;
{Pour obtenir le dossier de Windows}
var
  Dossier: ARRAY [0..MAX_PATH] OF Char;
begin
  if GetSystemDirectory (Dossier,Length(Dossier))<>0 then Result:=String(Dossier);
end;


function GetElementFactCode(efl:string):string;
var code:string;
begin

  DM.QStand.Close;
  DM.QStand.sql.Clear;
  DM.qstand.SQL.Add('select NVL(code,'''') "Code" from element_facturation where libelle = '''+AjouterGuillemet(efl)+'''');

  DM.QStand.Open;



  code:=DM.QStand.FieldValues['Code'];

  result:=code;
end;

function GetActiviteInformCode(act:string):integer;
var code:integer;
begin

  DM.QStand.Close;
  DM.QStand.sql.Clear;
  DM.qstand.SQL.Add('select NVL(ACTINF_ID,0) "Code" from ACTIVITE_INFORMEL where ACTINF_LIBELLE = '''+AjouterGuillemet(act)+'''');

  DM.QStand.Open;



  code:=DM.QStand.FieldValues['Code'];

  result:=code;
end;

function GetZoneCode(act:string):string;
var code:STRING;
begin

  DM.QStand.Close;
  DM.QStand.sql.Clear;
  DM.qstand.SQL.Add('select NVL(code,'''') "Code" from ZONE where LIBELLE = '''+AjouterGuillemet(act)+'''');

  DM.QStand.Open;



  code:=DM.QStand.FieldValues['Code'];

  result:=code;
end;

function OperateurEnLettre(s:string):string;
var lib:string;
begin
  if s='>' then lib:=' SUPERIEUR A '
  ELSE
  if s='>=' then lib:=' SUPERIEUR OU EGAL A '
  ELSE
   if s='<' then lib:=' INFERIEUR A '
  ELSE
  if s='<=' then lib:=' INFERIEUR OU EGAL A '
  ELSE
   if s='=' then lib:=' EGAL A '
  ELSE
  if s='ENTRE' then lib:=' COMPRIS ENTRE '
  ELSE  lib:='';

Result:=lib;

end;


function ComputerName: string;
var
  lpBuffer: array[0..MAX_COMPUTERNAME_LENGTH] of char;
  nSize: dword;
begin
  nSize:= Length(lpBuffer);
  if GetComputerName(lpBuffer, nSize) then
    result:= lpBuffer
  else
    result:= '';
end;

Function CompteStr(Const SubStr:String;Const s:String):Integer;
Var i:Integer;
begin
  Result:=0;
  i:=0;
  Repeat
   i:=PosEx(SubStr,s,i+1);
    If i<>0 Then
      Inc(Result);
  Until i=0;
End;

function AjouterGuillemet(s:string):string;
var
i:integer;
long:integer;
ch:string;
chaine:string;
begin
//Longueur
long:=length(s);
//insertion de guillemet
chaine:='';
for i:=1 to long do
begin
ch:=s[i];
if ch='''' then ch:=''''''   ;
chaine:=chaine+ch;
end;

AjouterGuillemet:=chaine;
end;

procedure SetInterface(matric : integer);
begin
//  if admprofil=0 then
//  begin
//
///////////
//FMenu.Connexion1.Enabled:=false;
//FMenu.Deconnexion1.Enabled:=true;
//FMenu.Edition1.Enabled:=true;
////FMenu.Statistiques1.Enabled:=true;
//FMenu.Traitement1.Enabled:=true;
//FMenu.Aide1.Enabled:=true;
//
//
//  end else
//  begin
//
//FMenu.Connexion1.Enabled:=false;
//FMenu.Deconnexion1.Enabled:=true;
//FMenu.Edition1.Enabled:=true;
////FMenu.Statistiques1.Enabled:=true;
//FMenu.Traitement1.Enabled:=true;
//FMenu.Aide1.Enabled:=true;
//
//  end;


end;


Procedure ValiderExportation(aGrid : TDBGrid;ProgBar: TsGauge;typeE : string);
Begin

ProgBar.Progress:=0;
ProgBar.Visible:=true;
ProgBar.MaxValue:=aGrid.DataSource.Dataset.RecordCount;

    aGrid.DataSource.Dataset.First;


    if typeE='FACTURE' then
    BEGIN

    Try
      While Not aGrid.DataSource.Dataset.Eof Do
      Begin

      if aGrid.DataSource.Dataset.FieldValues['MODE ECRITURE']='D' then
      begin

      DM.QStand.Close;
      DM.QStand.SQL.Clear;
      DM.QStand.SQL.Add('select NUMERO from facture WHERE NUMERO ='''+aGrid.DataSource.Dataset.FieldValues['NUMERO FACTURE']+''' ');
      DM.QStand.Open;

      if not DM.QStand.IsEmpty then
      begin
      DM.QStand.Close;
      DM.QStand.SQL.Clear;
      DM.QStand.SQL.Add('update facture set exporte=''OUI'' WHERE NUMERO ='''+aGrid.DataSource.Dataset.FieldValues['NUMERO FACTURE']+''' ');
      DM.QStand.ExecSQL;
      end
       else
       begin
         DM.QStand.Close;
         DM.QStand.SQL.Clear;
         DM.QStand.SQL.Add('update facture_avoir set exporte=''OUI'' WHERE ID ='''+aGrid.DataSource.Dataset.FieldValues['NUMERO FACTURE']+''' ');
         DM.QStand.ExecSQL;
       end;
      end;


      aGrid.DataSource.Dataset.Next;
      End;


    except
     aGrid.DataSource.Dataset.Next;
    End;

    END    ////////////////////////////////////////////////////////////////
    else
    begin

      Try
      While Not aGrid.DataSource.Dataset.Eof Do
      Begin


       if aGrid.DataSource.Dataset.FieldValues['MODE ECRITURE']='D' then
      begin
         DM.QStand.Close;
         DM.QStand.SQL.Clear;
         DM.QStand.SQL.Add('update encaissement set exporte=''OUI'' WHERE ID ='+inttostr(aGrid.DataSource.Dataset.FieldValues['QUITANCE']));
         DM.QStand.ExecSQL;

      end;

      aGrid.DataSource.Dataset.Next;
      End;


    except

    on e:exception do
    begin
     // ShowMessage(e.Message);
      aGrid.DataSource.Dataset.Next;
    end;


    End;



    end;    /////////////////////////////////////////////////////////
  ProgBar.Visible:=false;
  ProgBar.Progress:=0;



  MessageDlg('Validation termin�e!',mtInformation,[mbok],0);

End;


Procedure ExportToExcelAvecTime(aGrid : TDBGrid;ProgBar: TsGauge);
Var
  PreviewToExcel : TExcelApplication;
  RangeE : Excel2000.ExcelRange;
  I,  Col, Row,pos : Integer;
//      J: Integer;
  SavePlace : TBookmark;
Begin

ProgBar.Progress:=0;
ProgBar.Visible:=true;
ProgBar.MaxValue:=aGrid.DataSource.Dataset.RecordCount;
//pos:=0;

  PreviewToExcel := TExcelApplication.Create(Application.MainForm);
  PreviewToExcel.Connect;
  PreviewToExcel.Workbooks.Add(Null, 0);
  RangeE := PreviewToExcel.ActiveCell;
  Col := 0;
  Row := 2;


  // En t�te tableau excel
  For I := 0 To aGrid.Columns.Count - 1 Do
    If aGrid.Columns[I].Visible Then
    Begin
      //RangeE.Value := aGrid.Columns[I].FieldName;
      RangeE.Value := aGrid.Columns[I].Title.Caption ;
      RangeE := RangeE.Next;
      Inc(Col);
    End;


    //Si il n'y a pas de s�lection

    SavePlace := aGrid.DataSource.Dataset.GetBookmark;
    aGrid.DataSource.Dataset.First;

    Try
      While Not aGrid.DataSource.Dataset.Eof Do
      Begin
        RangeE := PreviewToExcel.Range['A' + IntToStr(Row), 'A' + IntToStr(Row)];
        For I := 0 To aGrid.Columns.Count - 1 Do
          If aGrid.Columns[I].Visible Then
          Begin
          if aGrid.Fields[i].IsNull then RangeE.Value :=''
               else
                  if   aGrid.Fields[I].DataType in [ftDate] then
                  RangeE.Value :=FormatDateTime('DD/MM/YYYY',aGrid.Fields[I].Value)
                         else
                        if   aGrid.Fields[I].DataType in [ftDateTime] then
                        RangeE.Value :=FormatDateTime('DD/MM/YYYY HH:MM:SS',aGrid.Fields[I].Value)
                              else
                               if   aGrid.Fields[I].DataType in [ftFloat,ftInteger] then
                        RangeE.Value := aGrid.Fields[I].AsString
                      //  RangeE.Value := aGrid.Fields[I].AsFloat
                              else
                              RangeE.Value := aGrid.Fields[I].AsString;

            RangeE := RangeE.Next;
          End;
        pos:=row-1;
        ProgBar.Progress:=pos;
        Application.ProcessMessages;
        Inc(Row);
        aGrid.DataSource.Dataset.Next;
      End;

      aGrid.DataSource.Dataset.GotoBookmark(SavePlace);

    Finally
      aGrid.DataSource.Dataset.FreeBookmark(SavePlace);
    End;

  ProgBar.Visible:=false;
  ProgBar.Progress:=0;

  RangeE := PreviewToExcel.Range['A1', Chr(64 + Col) + IntToStr(Row - 1)];
  RangeE.AutoFormat(3, Null, Null, Null, Null, Null, Null);
  PreviewToExcel.Visible[0] := True;
  PreviewToExcel.Disconnect;

  MessageDlg('Export termin�!',mtInformation,[mbok],0);

End;

function GetFileTimes(const FileName: string; var Created: TDateTime;
  var Accessed: TDateTime; var Modified: TDateTime): Boolean;
var
  h: THandle;
  Info1, Info2, Info3: TFileTime;
  SysTimeStruct: SYSTEMTIME;
  TimeZoneInfo: TTimeZoneInformation;
  Bias: Double;
begin
  Result := False;
  Bias   := 0;
  h      := FileOpen(FileName, fmOpenRead or fmShareDenyNone);
  if h > 0 then
  begin
    try
      if GetTimeZoneInformation(TimeZoneInfo) <> $FFFFFFFF then
        Bias := TimeZoneInfo.Bias / 1440; // 60x24
      GetFileTime(h, @Info1, @Info2, @Info3);
      if FileTimeToSystemTime(Info1, SysTimeStruct) then
        Created := SystemTimeToDateTime(SysTimeStruct) - Bias;
      if FileTimeToSystemTime(Info2, SysTimeStruct) then
        Accessed := SystemTimeToDateTime(SysTimeStruct) - Bias;
      if FileTimeToSystemTime(Info3, SysTimeStruct) then
        Modified := SystemTimeToDateTime(SysTimeStruct) - Bias;
      Result := True;
    finally
      FileClose(h);
    end;
  end;
end;


procedure ChangeFileDateTimes(const aFileName :TFileName; const aDate :TDateTime);
var
  hFile      :THandle;
  SystemTime :TSystemTime;
  FileTime   :TFileTime;

begin
  if FileExists(aFileName) then
  begin
    hFile := FileOpen(aFileName, fmOpenWrite or fmShareDenyWrite);

    if hFile <> -1 then
    try
      DateTimeToSystemTime(aDate, SystemTime);
      SystemTimeToFileTime(SystemTime, FileTime);
      LocalFileTimeToFileTime(FileTime, FileTime);

      if not SetFileTime(hFile, nil, nil, @FileTime) then
        RaiseLastOSError;

    finally
      FileClose(hFile);
    end
    else RaiseLastOSError;
  end
  else Raise Exception.Create(Format('Le fichier "%s" n''existe pas !', [aFileName]));
end;




function DeCryptage(mot:string):string;
var
lg,i:integer;
motinv:string;
s,c:char;
asci1,asci2:integer;
begin
//longeur du mot
lg:=length(mot);



//inversion et decryptage du mot
motinv:='';
i:=lg;
while  i>=1 do
begin

s:= mot[i];
asci1:=ord(s);
asci2:=asci1-1;
c:=char(asci2);

motinv:=motinv+c ;



Dec(i);
end;
//


Result:=motinv;

end;

procedure ChargerparamConnex(dbname: TADOConnection;h,p,db,user,pwd:string);
//var id,pwd,dsn,cnx,cmd:string;
begin

dbname.Close;

dbname.Connected:=false;

dbname.ConnectionString:=
//'Provider=MSDAORA.1;Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST='+h+')(PORT='+p+')))(CONNECT_DATA=(SID='+db+')));user id='+user+';password='+PWd;
'Provider=OraOLEDB.Oracle;Data Source=(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST='+h+')(PORT='+p+')))(CONNECT_DATA=(SID='+db+')));user id='+user+';password='+pwd;


//'Provider=MSDASQL.1;'+#13+
//                              'Password='+pwd+';'+#13+
//                              'Persist Security Info=True;' +#13+
//                              'User ID='+user+';'+#13+
//                              'Data Source='+dsn   ;
dbname.Connected:=true;




end;


//***FONCTION LETTRE EN CHIFFRE***//

//PREMIER
function NombreEnLettres(n : integer ; France : Boolean = True ) : string;
Const
  unite   : array[1..19] of string = ('un','deux','trois','quatre','cinq','six',
                                      'sept','huit','neuf','dix','onze','douze',
                                      'treize','quatorze','quinze','seize',
                                      'dix sept','dix huit','dix neuf');
  dizaineF: array[2.. 9] of string = ('vingt','trente','quarante','cinquante',
                                     'soixante','','quatre-vingt','');
  dizaineB: array[2.. 9] of string = ('vingt','trente','quarante','cinquante',
                                     'soixante','septante','octante','nonante');
  coefs   : array[0.. 3] of string = ('cent','mille','million','milliard');
Var
  temp    : String;
  c, d, u : Integer;
  coef    : Integer;
  i       : Integer;
  neg     : boolean;
Begin
  result := '';

  // Cas particulier de z�ro
  If n = 0 then
  begin
    result := ' zero';
    exit;
  end;

  // M�morisation du signe
  neg := n < 0;
  If neg then n := -n;

  coef:=0;
  Repeat
    // R�cup�ration de l'unit� du bloc de trois chiffres en cours
    u:=n mod 10; n:=n div 10;
    // R�cup�ration de la dizaine du bloc de trois chiffres en cours
    d:=n mod 10; n:=n div 10;

    // Traitement des dizaines
    temp := '';
    // Passage sur la dizaine inf�rieure pour 10 � 19
    // et pour 70-79 90-99 dans le cas de la France
    If (d=1) Or ((d in [7,9])And France) then
    begin
      Dec(d);
      Inc(u,10);
    end;
    if d > 1 then
    begin
      If France Then
      Begin
        temp := ' ' + DizaineF[d];
        // Ajout du cas particulier de 'et' entre la dizaine et 1
        if (d < 8) and ((u = 1) or (u = 11)) then
          temp := temp + ' et';
      End Else
      Begin
        temp := ' ' + DizaineB[d];
        // Ajout du cas particulier de 'et' entre la dizaine et 1
        if (u = 1) then
          temp := temp + ' et';
      End;
    end;
    // ajout du texte de l'unit�
    if u > 0 then temp := temp + ' ' + unite[u];
    // ajout du 's' � Quatre-vingt si rien ne suit
    If (result = '') and (d = 8) and (u = 0) and France then result := 's';
    result := temp + result;

    // R�cup�ration de la centaine du bloc de trois chiffres en cours
    c := n mod 10; n := n div 10; {R�cup�re centaine}
    If c > 0 then
    begin
      temp := '';
      if c > 1 then temp := ' ' + unite[c] + temp;
      temp := temp + ' ' + coefs[0];
      // Traitement du cas particulier du 's' � cent si rien ne suit
      If (result = '') and (c > 1) then result := 's';
      result := temp + result;
    end;

    // Traitement du prochain groupe de 3 chiffres
    if n > 0 then
    begin
      Inc(coef);
      I := n mod 1000;
      If (i > 1) and (coef > 1) then result := 's' + result;
      If i > 0 then result := ' ' + coefs[coef] + result;
      // Traitement du cas particulier 'mille' ( non pas 'un mille' )
      If (i = 1) and (coef = 1) then Dec(n);
    end;
  until n = 0;
  result := Trim(result);

  // Ajout du signe en cas de besoin
  if neg then result := 'moins ' + result;
End;


 //*****DEUXIEMME**** LETTRE EN CHIFFRE

Function Chiffre_Lettre(chiffre: real; SM: String): string;
var tab_1_19 : array[0..19] of string[10];
    tab_20_90: array[2..9] of string[20];
    tab: array[1..5] of string[10];
    ch_int: string[20];
    ch, ch_r: string;
    i, fin_I : integer;

Function result_1_99(ch: string): string;
begin
   result_1_99 := '';
   case strtoint(ch) of
   0..19  : result_1_99 := tab_1_19[strtoint(ch)];
   20..99 : case strtoint(ch) of
            20,30,40,50,60: result_1_99 := tab_20_90[strtoint(copy(ch,1,1))];
            21,31,41,51,61: result_1_99 := tab_20_90[strtoint(copy(ch,1,1))] + ' et' + tab_1_19[strtoint(copy(ch,2,1))];
            80: result_1_99 := tab_20_90[strtoint(copy(ch,1,1)) ];
            70..79 : result_1_99 := tab_20_90[strtoint(copy(ch,1,1)) - 1] + '-' + copy(tab_1_19[strtoint(ch) - 60],2,length(tab_1_19[strtoint(ch) - 60]) -1);
            81..89 : result_1_99 := tab_20_90[strtoint(copy(ch,1,1)) ] + '-' +  copy(tab_1_19[strtoint(ch) - 80],2,length(tab_1_19[strtoint(ch) - 80]) -1);
            90..99 : result_1_99 := tab_20_90[strtoint(copy(ch,1,1)) - 1] + '-' + copy(tab_1_19[strtoint(ch) - 80],2,length(tab_1_19[strtoint(ch) - 80])-1 );
            else
            result_1_99 := tab_20_90[strtoint(copy(ch,1,1))] + '-' + copy(tab_1_19[strtoint(copy(ch,2,1))],2,length(tab_1_19[strtoint(copy(ch,2,1))]) -1);
            end;
   end;
end;

begin
if length(floattostr(int(chiffre))) > 15 then  // s'il y a autre chose apr�s le Billion, alors remplacer le 15 par 18
   begin
   messagedlg('Valeur incorrecte ',mtinformation,[mbok],0);
   exit;
   end;
tab_1_19[0] := '';
tab_1_19[1] := ' un'; tab_1_19[2] := ' deux'; tab_1_19[3] := ' trois';
tab_1_19[4] := ' quatre'; tab_1_19[5] := ' cinq'; tab_1_19[6] := ' six';
tab_1_19[7] := ' sept'; tab_1_19[8] := ' huit'; tab_1_19[9] := ' neuf';
tab_1_19[10] := ' dix'; tab_1_19[11] := ' onze'; tab_1_19[12] := ' douze';
tab_1_19[13] := ' treize'; tab_1_19[14] := ' quatorze'; tab_1_19[15] := ' quinze';
tab_1_19[16] := ' seize'; tab_1_19[17] := ' dix-sept'; tab_1_19[18] := ' dix-huit';
tab_1_19[19] := ' dix-neuf';

tab_20_90[2] := ' vingt'; tab_20_90[3] := ' trente'; tab_20_90[4] := ' quarante';
tab_20_90[5] := ' cinquante'; tab_20_90[6] := ' soixante';
tab_20_90[7] := ' soixante-dix'; tab_20_90[8] := ' quatre-vingt'; tab_20_90[9] := ' quatre-vingt-dix';

tab[1] := ' cent(s)';
tab[2] := ' mille';
tab[3] := ' million';
tab[4] := ' milliard';
tab[5] := ' billion';

ch_int := floattostr(int(chiffre));
ch_r := '';
fin_i := length(ch_int) div 3;
if length(ch_int) > fin_i * 3 then
   begin
   ch := copy(ch_int,1, length(ch_int) - fin_i * 3);
   ch_r := result_1_99(ch);
   if (strtoint(ch) = 1) and (fin_i = 1) then
      ch_r := tab[fin_i + 1]
   else
      if length(ch_int) > 2 then
         ch_r := ch_r + tab[fin_i + 1];
   end;

For i := fin_i downto 1 do
    begin
    ch := copy(ch_int, length(ch_int) - i * 3 + 1 , 3);

    case strtoint(copy(ch,1,1)) of
    0: ch_r := ch_r + result_1_99(copy(ch,1,1)); // dans le cas 0, on peut remplacer result_1_99(copy(ch,1,1)) par une chaine vide. C'est � dire   ch_r := ch_r + '';
    1: ch_r := ch_r + tab[1]; // l� aussi on peut mettre cent � la place de tab[1]
    else
    ch_r :=  ch_r +  result_1_99(copy(ch,1,1)) + tab[1];
    end;

    if (i = 2) and (strtoint(ch) = 1) then // pour le cas de:  par ex 125001489
        ch_r := ch_r + copy(result_1_99(copy(ch,2,2)),3,length(result_1_99(copy(ch,2,2))) - 3 )
    else
        ch_r := ch_r + result_1_99(copy(ch,2,2));

    if (i > 1) and (strtoint(ch) > 0) then
       ch_r := ch_r + tab[i];
    end;

if SM <> '' then
   begin
   ch_r := Uppercase(copy(ch_r,2,1)) + copy(ch_r,3,length(ch_r) - 2) + SM;
   if frac(chiffre) > 0 then
    ch_r := ch_r + ', et ' + copy(floattostr(frac(chiffre) + 1.005 ),3,2) + ' cts.';
    // le 1.005 pour obtenir le bon resultat, enlever le et essayer avec les montants suivants:  par ex  15,20 ou 147,50
   end;

Chiffre_Lettre := ch_r;
end;




end.


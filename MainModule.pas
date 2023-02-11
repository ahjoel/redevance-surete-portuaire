unit MainModule;

interface

uses
  uniGUIMainModule, SysUtils, Classes, Data.DB,
  Data.Win.ADODB;

type
  TDM = class(TUniGUIMainModule)
    DBConnexion: TADOConnection;
    QSave: TADOQuery;
    QCancel: TADOQuery;
    QDelete: TADOQuery;
    QCheck: TADOQuery;
    QCheck2: TADOQuery;
    QStand: TADOQuery;
    ADO_function: TADOQuery;
    QMax: TADOQuery;
    QLogin: TADOQuery;
    QUpdate: TADOQuery;
    DQ_Grid_Consignataire: TADOQuery;
    DQ_Grid_UM: TADOQuery;
    DQ_Grid_TM: TADOQuery;
    DQ_Grid_March: TADOQuery;
    DQ_Grid_Ope: TADOQuery;
    DQ_Grid_Action: TADOQuery;
    DQ_Grid_Nature: TADOQuery;
    DQ_Grid_Exo: TADOQuery;
    DQ_Grid_Navire: TADOQuery;
    DQ_Grid_TypeNav: TADOQuery;
    DQ_Grid_IP: TADOQuery;
    DQ_Grid_PQ: TADOQuery;
    DQ_Grid_Pays: TADOQuery;
    DQ_Grid_Port: TADOQuery;
    DQ_Grid_TauxOpe: TADOQuery;
    DQ_Grid_TauxRade: TADOQuery;
    DQ_Grid_Escale: TADOQuery;
    DQ_Grid_Rade: TADOQuery;
    DQ_Grid_User: TADOQuery;
    DQ_Grid_Profil: TADOQuery;
    DQ_Grid_Perms: TADOQuery;
    DQ_Grid_SousPerms: TADOQuery;
    DQ_Grid_HavePerms: TADOQuery;
    QPerms: TADOQuery;
    DQ_DBL_Navire: TADOQuery;
    DQ_DBL_Cons: TADOQuery;
    DQ_DBL_PortProv: TADOQuery;
    DQ_DBL_PortDest: TADOQuery;
    DQ_DBL_Cons_fact: TADOQuery;
    DQ_DBL_Profil_User: TADOQuery;
    DQ_DBL_March: TADOQuery;
    DQ_DBL_TypeMarch: TADOQuery;
    DQ_DBL_TypeNavire: TADOQuery;
    DQ_DBL_User: TADOQuery;
    DQ_DBL_Perms: TADOQuery;
    DQ_DBL_SousPerms: TADOQuery;
    DQ_DBL_Profil_Attrib: TADOQuery;
    DQ_DBL_Ope: TADOQuery;
    DQ_DBL_Pays: TADOQuery;
    DQ_DBL_PQ: TADOQuery;
    DQ_DBL_IP: TADOQuery;
    DQ_DBL_Act: TADOQuery;
    DQ_DBL_Nat: TADOQuery;
    DQ_DBL_TM: TADOQuery;
    DQ_DBL_UM: TADOQuery;
    DS_Grid_Consignataire: TDataSource;
    DS_Grid_UM: TDataSource;
    DS_Grid_TM: TDataSource;
    DS_Grid_March: TDataSource;
    DS_Grid_Ope: TDataSource;
    DS_Grid_Action: TDataSource;
    Ds_Grid_Nature: TDataSource;
    DS_Grid_Exo: TDataSource;
    Ds_Grid_Navire: TDataSource;
    DS_Grid_TypeNav: TDataSource;
    DS_Grid_IP: TDataSource;
    DS_Grid_PQ: TDataSource;
    DS_Grid_Pays: TDataSource;
    DS_Grid_Port: TDataSource;
    DS_Grid_TauxOpe: TDataSource;
    DS_Grid_TauxRade: TDataSource;
    DS_Grid_Escale: TDataSource;
    DS_Grid_Rade: TDataSource;
    DS_Grid_User: TDataSource;
    DS_Grid_Profil: TDataSource;
    DS_Grid_Perms: TDataSource;
    DS_Grid_SousPerms: TDataSource;
    DS_DBL_Navire: TDataSource;
    DS_DBL_Cons: TDataSource;
    DS_DBL_PortProv: TDataSource;
    DS_DBL_PortDest: TDataSource;
    DS_Grid_HavePerms: TDataSource;
    DS_DBL_Cons_fact: TDataSource;
    DS_DBL_Profil_User: TDataSource;
    DS_DBL_March: TDataSource;
    DS_DBL_TypeMarch: TDataSource;
    DS_DBL_TypeNavire: TDataSource;
    DS_DBL_Perms: TDataSource;
    DS_DBL_User: TDataSource;
    DS_DBL_SousPerms: TDataSource;
    DS_DBL_Profil_Attrib: TDataSource;
    DS_DQ_Grid_RapEsc: TDataSource;
    DS_DBL_UM: TDataSource;
    DS_DBL_TM: TDataSource;
    DS_DBL_Nat: TDataSource;
    DS_DBL_Act: TDataSource;
    DS_DBL_IP: TDataSource;
    DS_DBL_PQ: TDataSource;
    DS_DBL_Pays: TDataSource;
    DS_DBL_Ope: TDataSource;
    DQ_Grid_RapEsc: TADOQuery;
    DQ_Grid_FactInterne: TADOQuery;
    DQ_Details_RapEsc: TADOQuery;
    ADOQuery4: TADOQuery;
    QStand2: TADOQuery;
    ADOQuery6: TADOQuery;
    ADOQuery7: TADOQuery;
    DQ_DBL_TypeFact: TADOQuery;
    DQ_DBL_Obs: TADOQuery;
    QData: TADOQuery;
    DQ_Grid_Obs: TADOQuery;
    DQ_Grid_LigneRapEsc: TADOQuery;
    ADOQuery14: TADOQuery;
    DQ_Grid_Reglement: TADOQuery;
    DQ_Grid_FactPal: TADOQuery;
    QStand3: TADOQuery;
    QStand1: TADOQuery;
    DQ_DBL_Cat_Fact: TADOQuery;
    ADOQuery20: TADOQuery;
    ADOQuery21: TADOQuery;
    ADOQuery22: TADOQuery;
    DQ_Grid_TypeFact: TADOQuery;
    DQ_Grid_CatFact: TADOQuery;
    DS_Grid_CatFact: TDataSource;
    DataSource2: TDataSource;
    DS_Grid_FactPal: TDataSource;
    DS_Grid_Obs: TDataSource;
    DS_Grid_TypeFact: TDataSource;
    DS_Grid_Reglement: TDataSource;
    DataSource7: TDataSource;
    DS_Grid_FactInterne: TDataSource;
    DS_Details_RapEsc: TDataSource;
    DS_Grid_LigneRapEsc: TDataSource;
    DataSource11: TDataSource;
    DataSource12: TDataSource;
    DataSource13: TDataSource;
    DS_DBL_Cat_Fact: TDataSource;
    DS_DBL_Obs: TDataSource;
    DS_DBL_TypeFact: TDataSource;
    DataSource17: TDataSource;
    QPrint: TADOQuery;
    QSum: TADOQuery;
    ADOQuery8: TADOQuery;
    procedure UniGUIMainModuleBeforeLogin(Sender: TObject;
      var Handled: Boolean);
    procedure DQ_Grid_TauxMarchAfterOpen(DataSet: TDataSet);
    procedure DQ_Grid_TauxOpeAfterOpen(DataSet: TDataSet);
    procedure DQ_Grid_TauxRadeAfterOpen(DataSet: TDataSet);
    procedure DQ_Grid_FactPalAfterOpen(DataSet: TDataSet);
    procedure DQ_Grid_ReglementAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    function CheckCookiesLogin(Sender:TObject): Boolean;
    function GetCookie(cookie:string; Sender:TObject):string ;
  public
    { Public declarations }
  end;

procedure RegistreCookies(User, Pass : string; Sender : TObject) ;
procedure RemoveCookies(Sender : TObject);

const
//  UserId, UserLogin, UserPass : string ;
  Days : Real = 15.0  ;

var
   CookieUser, CookiePass : string;
   LibExerciceInst, IdExerciceInst: string;
   UserId,  UserLastName, UserFirstName, UserLogin, UserPass : string;



function DM: TDM;

implementation

{$R *.dfm}

uses
  UniGUIVars, ServerModule, uniGUIApplication;

function DM: TDM;
begin
  Result := TDM(UniApplication.UniMainModule)
end;

function TDM.CheckCookiesLogin(Sender:TObject): Boolean;
begin
  CookieUser := GetCookie('CookieUser', Sender);
  CookiePass := GetCookie('CookiePass', Sender);

  Result := (CookieUser = UserLogin) and (CookiePass = UserPass) ;
end;

procedure TDM.DQ_Grid_FactPalAfterOpen(DataSet: TDataSet);
begin
TCurrencyField(DataSet.FieldByName('montant')).DisplayFormat := '###,###,##0.00';
TCurrencyField(DataSet.FieldByName('complement')).DisplayFormat := '###,###,##0.00';
TCurrencyField(DataSet.FieldByName('montant_reel')).DisplayFormat := '###,###,##0.00';
TCurrencyField(DataSet.FieldByName('montant_xof')).DisplayFormat := '###,###,###,##0';
TCurrencyField(DataSet.FieldByName('mont_regle')).DisplayFormat := '###,###,###,##0';
TCurrencyField(DataSet.FieldByName('mont_solde')).DisplayFormat := '###,###,###,##0';
end;

procedure TDM.DQ_Grid_ReglementAfterOpen(DataSet: TDataSet);
begin
    TCurrencyField(DataSet.FieldByName('montant_xof')).DisplayFormat := '###,###,###,##0';
    TCurrencyField(DataSet.FieldByName('montant_regle')).DisplayFormat := '###,###,###,##0';
end;

procedure TDM.DQ_Grid_TauxMarchAfterOpen(DataSet: TDataSet);
begin
TCurrencyField(DataSet.FieldByName('taux_euro')).DisplayFormat := '###,###,##0.00';
end;

procedure TDM.DQ_Grid_TauxOpeAfterOpen(DataSet: TDataSet);
begin
    TIntegerField(DataSet.FieldByName('taux_euro')).DisplayFormat := '#,##0.000';
    TIntegerField(DataSet.FieldByName('qte_max')).DisplayFormat := '###,###,###,##0';
end;

procedure TDM.DQ_Grid_TauxRadeAfterOpen(DataSet: TDataSet);
begin
TIntegerField(DataSet.FieldByName('montant_taux_rade')).DisplayFormat := '#,##0.000';
end;

function TDM.GetCookie(cookie:string; Sender:TObject):string ;
begin
     Result := (Sender as TUniGUISession).UniApplication.Cookies.Values[cookie];
end;

procedure TDM.UniGUIMainModuleBeforeLogin(Sender: TObject;
  var Handled: Boolean);
begin
//Handled := CheckCookiesLogin(Sender)
end;

procedure RegistreCookies(User, Pass : string; Sender : TObject) ;
begin
  UniApplication.Cookies.SetCookie('CookieUser', User, Now+Days) ;
  UniApplication.Cookies.SetCookie('CookiePass', Pass, Now+Days) ;

end;

procedure RemoveCookies(Sender : TObject);
begin
  UniApplication.Cookies.SetCookie('CookieUser', CookieUser, Now - 1) ;
  UniApplication.Cookies.SetCookie('CookiePass', CookiePass, Now - 1) ;
  UniApplication.Restart;

end;


initialization
  RegisterMainModuleClass(TDM);
end.

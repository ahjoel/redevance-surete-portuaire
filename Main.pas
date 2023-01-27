unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniImageList,
  uniBitBtn, uniButton, uniSpeedButton, uniToolBar, uniStatusBar, uniPanel,
  uniTreeView, uniTreeMenu, Vcl.Menus, uniMainMenu, uniLabel, uniMenuButton;

type
  TMainForm = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    HomeContainer: TUniContainerPanel;
    MainStatutBar: TUniStatusBar;
    UniNativeImageListMenu: TUniNativeImageList;
    UniPanel1: TUniPanel;
    NavTree: TUniTreeView;
    UniNativeImageList1: TUniNativeImageList;
    UniSimplePanel3: TUniSimplePanel;
    UniMenuButton1: TUniMenuButton;
    UniPopupMenu1: TUniPopupMenu;
    SubMenuProfil: TUniMenuItem;
    SubMenuDeconnect: TUniMenuItem;
    procedure NavTreeClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure SubMenuProfilClick(Sender: TObject);
    procedure SubMenuDeconnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, UConsignataire, UUniteMesure,
  UTypeMarchandise, UMarchandise, UOperation, UAction, UExercice, UTypeNavire,
  UInstallationPort, UPaysPorts, UTaux, UEscale, UUser, URade, UDataLaod,
  UGlobal, ULoadData, UNavire, UUserProfil, URapportEscale, UFactPALEmise,
  UFTypeFacture, UObservationEscale, UEtatsEscale, UEtatsRade, UEtatsNavire,
  UEtatsFacturePal, UEtatsFacturePal_Escale, UReglement, UEtatsReglement;

function MainForm: TMainForm;
begin
  Result := TMainForm(DM.GetFormInstance(TMainForm));
end;

procedure TMainForm.NavTreeClick(Sender: TObject);
begin
if (NavTree.Selected.Text = 'Consignataires') then
  begin
      FConsignataire.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Factures Emises PAL') then
  begin
      FFactPalEmise.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Reglements') then
  begin
      FReglements.ShowModal;
  end;

     if (NavTree.Selected.Text = 'Taux') then
  begin
      FTaux.ShowModal;
  end;

    if (NavTree.Selected.Text = 'Operations') then
  begin
      FOperation.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Types de Marchandise') then
  begin
      FTypeMarchandise.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Marchandises') then
  begin
      FMarchandise.ShowModal;
  end;

if (NavTree.Selected.Text = 'Unitees de Mesure') then
  begin
      FUniteMesure.ShowModal;
  end;


if (NavTree.Selected.Text = 'Mouvements') then
  begin
      FAction.ShowModal;
  end;

if (NavTree.Selected.Text = 'Escales') then
  begin
      FEscale.ShowModal;
  end;

if (NavTree.Selected.Text = 'Rades') then
  begin
      FRade.ShowModal;
  end;



  if (NavTree.Selected.Text = 'Rapports Escale') then
  begin
      FRapportEscale.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Liste Navire') then
  begin
      FNavire.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Types Navire') then
  begin
      FTypeNavire.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Installations Port') then
  begin
      FInstallationPort.ShowModal;
  end;


  if (NavTree.Selected.Text = 'Types Facture') then
  begin
      FTypeFacture.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Observations Escale') then
  begin
      FObservationEscale.ShowModal;
  end;

   if (NavTree.Selected.Text = 'Pays - Ports') then
  begin
      FPaysPorts.ShowModal;
  end;

   if (NavTree.Selected.Text = 'Exercices') then
  begin
      FExercice.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Utilisateurs') then
  begin
      FUser.ShowModal;
  end;


   if (NavTree.Selected.Text = 'Etats Escale') then
  begin
      FEtatsEscale.ShowModal;
  end;
  if (NavTree.Selected.Text = 'Etats Rade') then
  begin
      FEtatsRade.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Etats Factures PAL') then
  begin
      FEtatsFacturePal.ShowModal;
  end;

    if (NavTree.Selected.Text = 'Etats Factures PAL Escale') then
  begin
      FEtatsFacturePalEscale.ShowModal;
  end;

  if (NavTree.Selected.Text = 'Etats Reglement') then
  begin
      FEtatsReglement.ShowModal;
  end;



    if (NavTree.Selected.Text = 'Etats Navire') then
  begin
      FEtatNavire.ShowModal;
  end;

   if (NavTree.Selected.Text = 'Gestion des Utilisateurs') then
  begin
      FUser.ShowModal;
  end;






end;

procedure TMainForm.SubMenuDeconnectClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TMainForm.SubMenuProfilClick(Sender: TObject);
begin
  FUserProfil.ShowModal;
  FUserProfil.edprenoms.text := UserFirstName;
  FUserProfil.ednom.text := UserLastName;
  FUserProfil.edlogin.text := UserLogin;
  FUserProfil.edpass.text := UserPass;

end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin

//   with  DM.QStand do
//                begin
//                     close;
//                     SQL.Clear;
//                     sql.add('select * from user U, profil_user U where U.profil=P.id_profil AND P.libelle_profil=''ADMIN'' ');
//                     ExecSQL;
//                     Open;
//                end;
//        if DM.QStand.RecordCount > 0 then
//            begin
//              NavTree.te
//            end

 MainStatutBar.Panels.Items[0].Text := 'Exercice : ' + LibExerciceInst;
 MainStatutBar.Panels.Items[1].Text := 'Utilisateur : ' + UserLogin + ' | ' + UserFirstName + ' ' + UserLastName;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.

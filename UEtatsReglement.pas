unit UEtatsReglement;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, frxClass, frxExportBaseDialog, frxExportPDF,
  frxDBSet, uniBasicGrid, uniDBGrid, uniComboBox, uniButton, uniMultiItem,
  uniDBComboBox, uniDBLookupComboBox, uniLabel, uniDateTimePicker, uniGroupBox,
  uniPanel, uniGUIBaseClasses;

type
  TFEtatsReglement = class(TUniForm)
    MainContainer: TUniContainerPanel;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel2: TUniPanel;
    UniGroupBox1: TUniGroupBox;
    GBPeriode_Em: TUniGroupBox;
    EdPeriode1_Em: TUniDateTimePicker;
    EdPeriode2_Em: TUniDateTimePicker;
    UniLabel1: TUniLabel;
    GBConsignataire_Fact: TUniGroupBox;
    DBLConsignataire_Fact: TUniDBLookupComboBox;
    GBTypeFact: TUniGroupBox;
    DBLCatFact: TUniDBLookupComboBox;
    DBLTypeFact: TUniDBLookupComboBox;
    GBNavire: TUniGroupBox;
    DBLNavire: TUniDBLookupComboBox;
    UniPanel3: TUniPanel;
    BtnRecherche: TUniButton;
    BtnReinitialise: TUniButton;
    GBConsignataire_Nav: TUniGroupBox;
    DBLConsignataire_Nav: TUniDBLookupComboBox;
    GBPeriode_Ech: TUniGroupBox;
    EdPeriode1_Ech: TUniDateTimePicker;
    EdPeriode2_Ech: TUniDateTimePicker;
    UniLabel2: TUniLabel;
    GBFacturable: TUniGroupBox;
    CBComplement: TUniComboBox;
    GBTypeNav: TUniGroupBox;
    DBLTypeNavire: TUniDBLookupComboBox;
    GBStatut: TUniGroupBox;
    CBStatut: TUniComboBox;
    UniContainerPanel2: TUniContainerPanel;
    BtnExport: TUniButton;
    BtnPrint: TUniButton;
    PanRowCount: TUniPanel;
    frxDBDataset: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBDataset_sum: TfrxDBDataset;
    DBGrid: TUniDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FEtatsReglement: TFEtatsReglement;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication;

function FEtatsReglement: TFEtatsReglement;
begin
  Result := TFEtatsReglement(DM.GetFormInstance(TFEtatsReglement));
end;

end.

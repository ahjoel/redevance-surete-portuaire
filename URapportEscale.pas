unit URapportEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniGroupBox,
  uniBasicGrid, uniDBGrid, uniLabel, uniEdit, uniButton;

type
  TFRapportEscale = class(TUniForm)
    MainContainer: TUniContainerPanel;
    PanOp: TUniPanel;
    BtnDel: TUniButton;
    BtnUpdate: TUniButton;
    BtnAdd: TUniButton;
    EdSearch: TUniEdit;
    UniLabel1: TUniLabel;
    BtnValidate: TUniButton;
    BtnControl: TUniButton;
    DBGrid: TUniDBGrid;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    procedure BtnAddClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowData;
  end;

function FRapportEscale: TFRapportEscale;

var
    filter, search, init_query, query:string;
    exercice_filter :string;
    title :string = 'Rapport Escale';
    FrmMode, FrmModeTitle : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEditRapportEscale, UGlobal, UFunction;

function FRapportEscale: TFRapportEscale;
begin
  Result := TFRapportEscale(DM.GetFormInstance(TFRapportEscale));
end;

procedure TFRapportEscale.ShowData;
  begin
      filter:=' order by date desc' ;

      if EdSearch.IsBlank then search:='' else

      search:=' AND (UPPER(num_voyage) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND E.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT *,  '#13+
                   ' case WHEN R.date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                   ' case WHEN R.date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                   ' us.login_user as user_saisie , uc.login_user as user_control , uv.login_user as user_validation '#13+
                   'FROM rapport_escale R '#13+
                   'INNER JOIN escale E on R.escale_rap_esc=E.id '#13+
                   'INNER JOIN consignataire C on E.consignataire=C.id_consignataire '#13+
                   'INNER JOIN navire  N on E.navire=N.id_navire '#13+
                   'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                   'INNER JOIN exercice Z on E.exercice=Z.id_exercice '#13+
                   'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                   'INNER JOIN user as us on E. user_create=us.id_user '#13+
                   'LEFT JOIN user as uc on E.user_control=uc.id_user '#13+
                   'LEFT JOIN user as uv on E.user_validate=uv.id_user '#13+
                    '  ';
      query:=init_query + search+ filter;

      DM.DQ_Grid_RapEsc.Close;
      DM.DQ_Grid_RapEsc.SQL.Clear;
      DM.DQ_Grid_RapEsc.SQL.Text := query;
      DM.DQ_Grid_RapEsc.Open;
  end;

procedure TFRapportEscale.UniFormShow(Sender: TObject);
begin
    ShowData;
end;

procedure TFRapportEscale.BtnAddClick(Sender: TObject);
begin
    FEditRapportEscale.EditContext := FormContext;
    FEditRapportEscale.FmContext := AddContext;

    FEditRapportEscale.Caption := FrmEditTitle(title, AddTitle);
    FEditRapportEscale.ShowModal;
end;

end.

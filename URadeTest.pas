unit URadeTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniPanel, uniLabel, uniEdit,
  uniButton, uniBasicGrid, uniDBGrid;

type
  TFRadeTest = class(TUniForm)
    MainContainerPanel: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniLabel1: TUniLabel;
    UniPanel1: TUniPanel;
    PanRowCount: TUniPanel;
    UniContainerPanel1: TUniContainerPanel;
    PanOption: TUniPanel;
    UniLabel2: TUniLabel;
    EdSearch: TUniEdit;
    BtnAdd: TUniButton;
    BtnControl: TUniButton;
    BtnValidate: TUniButton;
    BtnUpdate: TUniButton;
    BtnDel: TUniButton;
    DBGrid: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure EdSearchChange(Sender: TObject);
    procedure DBGridSelectionChange(Sender: TObject);
    procedure BtnValidateClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnControlClick(Sender: TObject);
  private
    { Private declarations }
     procedure UpdateLoadData;
  public
    { Public declarations }
     procedure ShowData;
  end;

function FRadeTest: TFRadeTest;

var
   filter, search, init_query, query:string;
   exercice_filter :string;
   title :string = 'RADE TEST';
   FrmMode, FrmModeTitle : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, Main, UDataLaod, UEditRadeT, UFunction, UGlobal,
  ULoadData, UProject_Function, ServerModule, UEditRade;

function FRadeTest: TFRadeTest;
begin
  Result := TFRadeTest(DM.GetFormInstance(TFRadeTest));
end;

procedure TFRadeTest.UpdateLoadData;
begin
    //UPDATE CHECK VARIABLES
   FEditRadeT.id :=DM.QStand.FieldValues['id'];

   //UPDATE LOAD_DATA
   FEditRadeT.id:=DM.QStand.FieldValues['id'];
   FEditRadeT.DBLNavire.KeyValue :=DM.QStand.FieldValues['navire'];
   FEditRadeT.DBLConsignataire.KeyValue :=DM.QStand.FieldValues['consignataire'];
   FEditRadeT.Eddebut.DateTime :=DM.QStand.FieldValues['debut'];
   FEditRadeT.Edfin.DateTime :=DM.QStand.FieldValues['fin'];
end;

procedure TFRadeTest.BtnAddClick(Sender: TObject);
begin
    FEditRadeT.EditContext := FormContext;
    FEditRadeT.FmContext := AddContext;

    FEditRadeT.Caption := FrmEditTitle(title, AddTitle);
    FEditRadeT.ShowModal;
end;

procedure TFRadeTest.BtnControlClick(Sender: TObject);
begin
    FEditRadeT.Caption := FrmEditTitle(title, ControlTitle);

    FEditRadeT.ShowModal;
    FEditRadeT.BtnSave.Caption := ControlBtnCaption;
    FEditRadeT.BtnSave.IconCls := 'check2';
    FEditRadeT.FmContext := ControlContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM rade where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditRadeT.ShowModal;

               UpdateLoadData;

               //ENABLE DATA

               //UPDATE LOAD_DATA

               FEditRadeT.DBLNavire.ReadOnly:=True;
               FEditRadeT.DBLConsignataire.ReadOnly:=True;
               FEditRadeT.Eddebut.ReadOnly:=True;
               FEditRadeT.Edfin.ReadOnly:=True;



               //UPDATE EDIT COLOR
               FEditRadeT.DBLNavire.Color:=clWebLemonChiffon;
               FEditRadeT.DBLConsignataire.Color:=clWebLemonChiffon;
               FEditRadeT.Eddebut.Color:=clWebLemonChiffon;
               FEditRadeT.Edfin.Color:=clWebLemonChiffon;

           end

           else

end;

procedure TFRadeTest.BtnUpdateClick(Sender: TObject);
begin
     FEditRadeT.Caption := FrmEditTitle(title, UpdateTitle);

    FEditRadeT.ShowModal;
    FEditRadeT.FmContext := UpdateContext;
    FEditRadeT.BtnSave.IconCls := 'compose';

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM rade where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditRadeT.ShowModal;
               //UPDATE CHECK VARIABLES
               FEditRadeT.id :=DM.QStand.FieldValues['id'];


               //UPDATE LOAD_DATA
               FEditRadeT.id:=DM.QStand.FieldValues['id'];
               FEditRadeT.DBLNavire.KeyValue :=DM.QStand.FieldValues['navire'];
               FEditRadeT.DBLConsignataire.KeyValue :=DM.QStand.FieldValues['consignataire'];
               FEditRadeT.Eddebut.DateTime :=DM.QStand.FieldValues['debut'];
               FEditRadeT.Edfin.DateTime :=DM.QStand.FieldValues['fin'];
           end

           else
end;

procedure TFRadeTest.BtnValidateClick(Sender: TObject);
begin
    FEditRadeT.Caption := FrmEditTitle(title, ValidateTitle);

    FEditRadeT.ShowModal;
    FEditRadeT.BtnSave.Caption := ValidatBtnCaption;
    FEditRadeT.BtnSave.IconCls := 'check';
    FEditRadeT.FmContext := ValidatContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM rade where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditRadeT.ShowModal;

               UpdateLoadData;

               //ENABLE DATA

               //UPDATE LOAD_DATA
               FEditRadeT.DBLNavire.ReadOnly:=True;
               FEditRadeT.DBLConsignataire.ReadOnly:=True;
               FEditRadeT.Eddebut.ReadOnly:=True;
               FEditRadeT.Edfin.ReadOnly:=True;



               //UPDATE EDIT COLOR
               FEditRadeT.DBLNavire.Color:=clWebLightSalmon;
               FEditRadeT.DBLConsignataire.Color:=clWebLightSalmon;
               FEditRadeT.Eddebut.Color:=clWebLightSalmon;
               FEditRadeT.Edfin.Color:=clWebLightSalmon;






           end

           else

end;

procedure TFRadeTest.DBGridSelectionChange(Sender: TObject);
begin
  if DBGrid.DataSource.DataSet.FieldByName('control').AsString = '' then
    begin
        BtnControl.Enabled:=True;
        BtnValidate.Enabled:=False;
    end
    else
    begin
        BtnControl.Enabled:=False;
        BtnValidate.Enabled:=True;

    end;

if DBGrid.DataSource.DataSet.FieldByName('validation').AsString <> '' then
    begin
       BtnValidate.Enabled:=False;
    end
  else
end;

procedure TFRadeTest.EdSearchChange(Sender: TObject);
begin
     ShowData;
end;

procedure TFRadeTest.ShowData;
  begin
      filter:=' order by ref desc , debut desc ' ;

      if EdSearch.IsBlank then search:='' else
      search:=' AND (UPPER(N.nom_navire) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND R.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT * ,CONCAT(R.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_ex,  DATEDIFF( R.fin , R.debut)+1 AS sejour, CEILING((DATEDIFF( R.fin , R.debut)+1)/X.nombre_jour_taux_rade) as qte, '#13+
                   ' us.login_user as user_saisie , uc.login_user as user_control , uv.login_user as user_validation,  '#13+
                   ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                   ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                   ' case WHEN facturer_int = False THEN ''N''  ELSE ''O''	end as fact_int , '#13+
                   ' case WHEN facturer_pal = False THEN ''N''  ELSE ''O''	end as fact_pal , '#13+
                   ' "TEST" as TEST '#13+
                   ' FROM rade R '#13+
                   'INNER JOIN user as us on R. user_create=us.id_user '#13+
                   'LEFT JOIN user as uc on R.user_control=uc.id_user '#13+
                   'LEFT JOIN user as uv on R.user_validate=uv.id_user '#13+
                   'INNER JOIN consignataire C on R.consignataire=C.id_consignataire '#13+
                   'INNER JOIN navire  N on R.navire=N.id_navire '#13+
                   'INNER JOIN exercice Z on R.exercice=Z.id_exercice '#13+
                   'INNER JOIN taux_rade X on R.taux_rade=X.id_taux_rade '#13+
                   'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                   ' WHERE R.id is not null ';
      query:=init_query + exercice_filter + search+ filter;

      DM.DQ_Grid_RadeT.Close;
      DM.DQ_Grid_RadeT.SQL.Clear;
      DM.DQ_Grid_RadeT.SQL.Text := query;
      DM.DQ_Grid_RadeT.Open;
  end;

procedure TFRadeTest.UniFormShow(Sender: TObject);
begin
  PanTitle.Caption := FrmPanTitle(title, FrmModeTitle, LibExerciceInst);
  ShowData;
end;

end.

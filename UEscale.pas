unit UEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,  Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  uniButton, uniPanel, uniGUIBaseClasses;

type
  TFEscale = class(TUniForm)
    MainContainer: TUniContainerPanel;
    PanOp: TUniPanel;
    BtnDel: TUniButton;
    BtnUpdate: TUniButton;
    BtnAdd: TUniButton;
    EdSearch: TUniEdit;
    UniLabel1: TUniLabel;
    DBGrid: TUniDBGrid;
    BtnValidate: TUniButton;
    BtnControl: TUniButton;
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    PanRowCount: TUniPanel;
    procedure BtnAddClick(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure UniFormShow(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
    procedure BtnControlClick(Sender: TObject);
    procedure BtnValidateClick(Sender: TObject);
    procedure DBGridSelectionChange(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
      Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
    procedure EdSearchChange(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateLoadData;
  public
    { Public declarations }
    procedure ShowData;
  var
    FrmMode, FrmModeTitle : string;
  end;

function FEscale: TFEscale;

var
    filter, search, init_query, query:string;
    exercice_filter :string;
    title :string = 'ESCALE';
    FrmMode, FrmModeTitle : string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEditEscale, UGlobal, UFunction,
  UProject_Function;

function FEscale: TFEscale;
begin
  Result := TFEscale(DM.GetFormInstance(TFEscale));
end;

procedure TFEscale.UpdateLoadData;
begin
    //UPDATE CHECK VARIABLES
   FEditEscale.id_esc :=DM.QStand.FieldValues['id'];
   FEditEscale.num_port :=DM.QStand.FieldValues['num_port'];

   //UPDATE LOAD_DATA
   FEditEscale.id_esc:=DM.QStand.FieldValues['id'];
   FEditEscale.EdRefPort.Text :=DM.QStand.FieldValues['num_port'];
   FEditEscale.DBLNavire.KeyValue :=DM.QStand.FieldValues['navire'];
   FEditEscale.DBLPoste.KeyValue :=DM.QStand.FieldValues['post_quai'];
   FEditEscale.DBLConsignataire.KeyValue :=DM.QStand.FieldValues['consignataire'];
   FEditEscale.DBLProvenance.KeyValue :=DM.QStand.FieldValues['port_orgine'];
   FEditEscale.DBLDestination.KeyValue :=DM.QStand.FieldValues['port_dest'];
   FEditEscale.EdRade.DateTime :=DM.QStand.FieldValues['date_rade'];
   FEditEscale.EdAccostage.DateTime :=DM.QStand.FieldValues['date_accost'];
   FEditEscale.EdDepart.DateTime :=DM.QStand.FieldValues['date_depart'];
   FEditEscale.DBLObservation.KeyValue :=DM.QStand.FieldValues['observation'];
   FEditEscale.EdTonBrut.Value :=DM.QStand.FieldValues['tonne_brut'];
   FEditEscale.EdTonNet.Value :=DM.QStand.FieldValues['tonne_net'];
end;

procedure TFEscale.ShowData;
  begin
      filter:=' order by ref desc , date_accost desc ' ;

      if EdSearch.IsBlank then search:='' else

      search:=' AND (UPPER(N.nom_navire) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND E.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT * , CONCAT(E.ref, ''-'', RIGHT(Z.libelle_exercice, 2)) as ref_ex, case WHEN facturable_obs=TRUE THEN ''F'' ELSE ''N''	end as statut , '#13+
                   ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                   ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                   ' case WHEN facturer_int = ''''  THEN ''N''  ELSE ''O''	end as fact_int , '#13+
                   ' case WHEN facturer_pal = '''' THEN ''N''  ELSE ''O''	end as fact_pal , '#13+
                   ' case WHEN rapport= True THEN ''O'' ELSE ''''	end as rapport_esc ,  '#13+
                   ' po.libelle_port as orgine ,pd.libelle_port as destination , '#13+
                   ' us.login_user as user_saisie , uc.login_user as user_control , uv.login_user as user_validation '#13+
                   ' FROM escale E  '#13+
                   'INNER JOIN port as po on E.port_orgine=po.id_port '#13+
                   'LEFT JOIN port as pd on E.port_dest=pd.id_port '#13+
                   'INNER JOIN user as us on E. user_create=us.id_user '#13+
                   'LEFT JOIN user as uc on E.user_control=uc.id_user '#13+
                   'LEFT JOIN user as uv on E.user_validate=uv.id_user '#13+
                   'INNER JOIN consignataire C on E.consignataire=C.id_consignataire '#13+
                   'INNER JOIN navire  N on E.navire=N.id_navire '#13+
                   'INNER JOIN poste_quai Q on E.post_quai=Q.id_pq '#13+
                   'INNER JOIN exercice Z on E.exercice=Z.id_exercice '#13+
                   'INNER JOIN observation O on E.observation=O.id_obs '#13+
                   'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                    ' WHERE E.id is not null ';
      query:=init_query + exercice_filter+ search+ filter;

      DM.DQ_Grid_Escale.Close;
      DM.DQ_Grid_Escale.SQL.Clear;
      DM.DQ_Grid_Escale.SQL.Text := query;
      DM.DQ_Grid_Escale.Open;
  end;


procedure TFEscale.UniFormShow(Sender: TObject);
begin
  PanTitle.Caption := FrmPanTitle(title, FrmModeTitle, LibExerciceInst);
  ShowData();
end;

procedure TFEscale.BtnAddClick(Sender: TObject);
begin
    FEditEscale.EditContext := FormContext;
    FEditEscale.FmContext := AddContext;

    FEditEscale.Caption := FrmEditTitle(title, AddTitle);
    FEditEscale.ShowModal;
end;

procedure TFEscale.BtnControlClick(Sender: TObject);
begin
    FEditEscale.Caption := FrmEditTitle(title, ControlTitle);

    FEditEscale.ShowModal;
    FEditEscale.BtnSave.Caption := ControlBtnCaption;
    FEditEscale.BtnSave.IconCls := 'check2';
    FEditEscale.FmContext := ControlContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM escale where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditEscale.ShowModal;

               UpdateLoadData;

               //ENABLE DATA

               //UPDATE LOAD_DATA
               FEditEscale.EdRefPort.ReadOnly:=True;
               FEditEscale.DBLNavire.ReadOnly:=True;
               FEditEscale.DBLPoste.ReadOnly:=True;
               FEditEscale.DBLConsignataire.ReadOnly:=True;
               FEditEscale.DBLProvenance.ReadOnly:=True;
               FEditEscale.DBLDestination.ReadOnly:=True;
               FEditEscale.EdRade.ReadOnly:=True;
               FEditEscale.EdAccostage.ReadOnly:=True;
               FEditEscale.EdDepart.ReadOnly:=True;
               FEditEscale.DBLObservation.ReadOnly:=True;
               FEditEscale.EdTonBrut.ReadOnly:=True;
               FEditEscale.EdTonNet.ReadOnly:=True;



               //UPDATE EDIT COLOR
               FEditEscale.EdRefPort.Color:=clWebLemonChiffon;
               FEditEscale.DBLNavire.Color:=clWebLemonChiffon;
               FEditEscale.DBLPoste.Color:=clWebLemonChiffon;
               FEditEscale.DBLConsignataire.Color:=clWebLemonChiffon;
               FEditEscale.DBLProvenance.Color:=clWebLemonChiffon;
               FEditEscale.DBLDestination.Color:=clWebLemonChiffon;
               FEditEscale.EdRade.Color:=clWebLemonChiffon;
               FEditEscale.EdAccostage.Color:=clWebLemonChiffon;
               FEditEscale.EdDepart.Color:=clWebLemonChiffon;
               FEditEscale.DBLObservation.Color:=clWebLemonChiffon;
               FEditEscale.EdTonBrut.Color:=clWebLemonChiffon;
               FEditEscale.EdTonNet.Color:=clWebLemonChiffon;




           end

           else
end;

procedure TFEscale.BtnUpdateClick(Sender: TObject);
begin
    FEditEscale.Caption := FrmEditTitle(title, UpdateTitle);

    FEditEscale.ShowModal;
    FEditEscale.BtnSave.Caption := UpdateBtnCaption;
    FEditEscale.BtnSave.IconCls := 'compose';

    FEditEscale.FmContext := UpdateContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM escale where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditEscale.ShowModal;
               UpdateLoadData;
           end

           else
end;

procedure TFEscale.BtnValidateClick(Sender: TObject);
begin
    FEditEscale.Caption := FrmEditTitle(title, ValidateTitle);

    FEditEscale.ShowModal;
    FEditEscale.BtnSave.Caption := ValidatBtnCaption;
    FEditEscale.BtnSave.IconCls := 'check';
    FEditEscale.FmContext := ValidatContext;

     with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM escale where id=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               FEditEscale.ShowModal;

               UpdateLoadData;

               //ENABLE DATA

               //UPDATE LOAD_DATA
               FEditEscale.EdRefPort.ReadOnly:=True;
               FEditEscale.DBLNavire.ReadOnly:=True;
               FEditEscale.DBLPoste.ReadOnly:=True;
               FEditEscale.DBLConsignataire.ReadOnly:=True;
               FEditEscale.DBLProvenance.ReadOnly:=True;
               FEditEscale.DBLDestination.ReadOnly:=True;
               FEditEscale.EdRade.ReadOnly:=True;
               FEditEscale.EdAccostage.ReadOnly:=True;
               FEditEscale.EdDepart.ReadOnly:=True;
               FEditEscale.DBLObservation.ReadOnly:=True;
               FEditEscale.EdTonBrut.ReadOnly:=True;
               FEditEscale.EdTonNet.ReadOnly:=True;



               //UPDATE EDIT COLOR
               FEditEscale.EdRefPort.Color:=clWebLightSalmon;
               FEditEscale.DBLNavire.Color:=clWebLightSalmon;
               FEditEscale.DBLPoste.Color:=clWebLightSalmon;
               FEditEscale.DBLConsignataire.Color:=clWebLightSalmon;
               FEditEscale.DBLProvenance.Color:=clWebLightSalmon;
               FEditEscale.DBLDestination.Color:=clWebLightSalmon;
               FEditEscale.EdRade.Color:=clWebLightSalmon;
               FEditEscale.EdAccostage.Color:=clWebLightSalmon;
               FEditEscale.EdDepart.Color:=clWebLightSalmon;
               FEditEscale.DBLObservation.Color:=clWebLightSalmon;
               FEditEscale.EdTonBrut.Color:=clWebLightSalmon;
               FEditEscale.EdTonNet.Color:=clWebLightSalmon;




           end

           else
end;

procedure TFEscale.DBGridDrawColumnCell(Sender: TObject; ACol, ARow: Integer;
  Column: TUniDBGridColumn; Attribs: TUniCellAttribs);
begin

    if DBGrid.DataSource.DataSet.FieldByName('rapport_control').AsInteger = 1 then
      Attribs.Color:= clWebLemonChiffon
    else
    if DBGrid.DataSource.DataSet.FieldByName('rapport_validate').AsInteger = 1 then
      Attribs.Color:= clWebLightSalmon
    else
end;

procedure TFEscale.DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
begin
  PanRowCount.Caption := IntToStr(DBGrid.DataSource.DataSet.RecordCount) ;
  if  DM.DQ_Grid_Escale.RecordCount=0 then
      begin
            BtnUpdate.Enabled:=False;
            BtnDel.Enabled:=False;
            BtnControl.Enabled:=False;
            BtnValidate.Enabled:=False;
      end
    else
       begin
          BtnUpdate.Enabled:=true;
         // BtnDel.Enabled:=true;
          BtnControl.Enabled:=true;
          BtnValidate.Enabled:=true;
       end;
end;

procedure TFEscale.DBGridSelectionChange(Sender: TObject);
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
//if ((DBGrid.DataSource.DataSet.FieldByName('control').AsString = '') AND (DBGrid.DataSource.DataSet.FieldByName('validation').AsString = '')) then
//    begin
//      BtnUpdate.Enabled := True;
//    end
//    else
//     BtnUpdate.Enabled := False;




end;

procedure TFEscale.EdSearchChange(Sender: TObject);
begin
    ShowData;
end;

end.

unit USelectEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniLabel, uniEdit,
  uniPanel, uniGUIBaseClasses;

type
  TFSelectEscale = class(TUniForm)
    MainContainer: TUniContainerPanel;
    PanOp: TUniPanel;
    EdSearch: TUniEdit;
    UniLabel1: TUniLabel;
    DBGrid: TUniDBGrid;
    procedure UniFormShow(Sender: TObject);
    procedure EdSearchChange(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      procedure ShowData_Rapport;
      procedure ShowData_FactPal;
     var
     FrmMode, FrmModeTitle : string;
  end;

function FSelectEscale: TFSelectEscale;

var
    filter, search, init_query, query:string;
    exercice_filter :string;
    title :string = 'Liste Escale';



implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, UEditRapportEscale,
  UEditFactEscalePal;


procedure TFSelectEscale.DBGridDblClick(Sender: TObject);
begin
  if FrmMode = ModeRapport then
      begin
          if DBGrid.DataSource.DataSet.RecordCount > 0  then
                begin
                   FEditRapportEscale.EdRefInt.Text := DBGrid.DataSource.DataSet.FieldByName('ref').AsString;
                   FEditRapportEscale.EdRefPort.Text := DBGrid.DataSource.DataSet.FieldByName('num_port').AsString;
                   FEditRapportEscale.EdNavire.Text := DBGrid.DataSource.DataSet.FieldByName('nom_navire').AsString;
                   FEditRapportEscale.EdConsignataire.Text := DBGrid.DataSource.DataSet.FieldByName('nom_consignataire').AsString;
                   FEditRapportEscale.EdArrive.Text := DBGrid.DataSource.DataSet.FieldByName('date_accost').AsString;
                   FEditRapportEscale.EdPoste.Text := DBGrid.DataSource.DataSet.FieldByName('code_pq').AsString;
                   FEditRapportEscale.id_esc :=DBGrid.DataSource.DataSet.FieldByName('id').AsString;

                   close;
                end

                else
      end;

   if FrmMode = ModeFactPal then
      begin
          if DBGrid.DataSource.DataSet.RecordCount > 0  then
                begin
                   FEditFactEscalePal.EdRefInt.Text := DBGrid.DataSource.DataSet.FieldByName('ref').AsString;
                   FEditFactEscalePal.EdRefPort.Text := DBGrid.DataSource.DataSet.FieldByName('num_port').AsString;
                   FEditFactEscalePal.EdNavire.Text := DBGrid.DataSource.DataSet.FieldByName('nom_navire').AsString;
                   FEditFactEscalePal.EdConsignataire.Text := DBGrid.DataSource.DataSet.FieldByName('nom_consignataire').AsString;
                   FEditFactEscalePal.EdAccost.Text := DBGrid.DataSource.DataSet.FieldByName('date_accost').AsString;
                   FEditFactEscalePal.EdPoste.Text := DBGrid.DataSource.DataSet.FieldByName('code_pq').AsString;
                   FEditFactEscalePal.id_esc :=DBGrid.DataSource.DataSet.FieldByName('id').AsString;

                   close;
                end

                else
      end;


end;

procedure TFSelectEscale.EdSearchChange(Sender: TObject);
begin
  if FrmMode = ModeRapport then
  ShowData_Rapport
  else
  if FrmMode = ModeFactPal then
  ShowData_FactPal



end;

procedure TFSelectEscale.ShowData_Rapport;
  begin
      filter:=' order by date_accost desc' ;

      if EdSearch.IsBlank then search:='' else

       search:=' AND (UPPER(N.nom_navire) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND E.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT * ,case WHEN facturable_type_nav=TRUE THEN ''F'' ELSE ''N''	end as statut , '#13+
                   ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                   ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                   ' case WHEN rapport= True THEN ''o'' ELSE ''''	end as rapport_esc ,  '#13+
                   ' po.libelle_port as orgine ,pd.libelle_port as destination '#13+
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
                   'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                    ' WHERE rapport = False AND date_validate is not null ';
      query:=init_query + search+ filter;

      DM.DQ_Grid_Escale.Close;
      DM.DQ_Grid_Escale.SQL.Clear;
      DM.DQ_Grid_Escale.SQL.Text := query;
      DM.DQ_Grid_Escale.Open;
  end;

procedure TFSelectEscale.ShowData_FactPal;
  begin
      filter:=' order by date_accost desc' ;

      if EdSearch.IsBlank then search:='' else

       search:=' AND (UPPER(nom_navire) LIKE ''%'+UpperCase(EdSearch.Text)+'%'')';

       exercice_filter := ' AND E.exercice='''+ IdExerciceInst +'''';


      init_query:= 'SELECT * ,case WHEN facturable_type_nav=TRUE THEN ''F'' ELSE ''N''	end as statut , '#13+
                   ' case WHEN date_control is null THEN '''' ELSE ''O''	end as control , '#13+
                   ' case WHEN date_validate is null THEN '''' ELSE ''O''	end as validation , '#13+
                   ' case WHEN rapport= True THEN ''o'' ELSE ''''	end as rapport_esc ,  '#13+
                   ' po.libelle_port as orgine ,pd.libelle_port as destination '#13+
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
                   'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                    ' WHERE date_validate is not null AND E.facturer_pal=FALSE';
      query:=init_query + search+ filter;

      DM.DQ_Grid_Escale.Close;
      DM.DQ_Grid_Escale.SQL.Clear;
      DM.DQ_Grid_Escale.SQL.Text := query;
      DM.DQ_Grid_Escale.Open;
  end;


function FSelectEscale: TFSelectEscale;
begin
  Result := TFSelectEscale(DM.GetFormInstance(TFSelectEscale));
end;

procedure TFSelectEscale.UniFormShow(Sender: TObject);
begin
    if FrmMode = ModeRapport then
       ShowData_Rapport
    else
    if FrmMode = ModeFactPal then
       ShowData_FactPal
    else

end;

end.

unit UObservationEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Data.DB,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniRadioGroup, uniButton,
  uniLabel, uniEdit, uniPanel, uniGUIBaseClasses;

type
  TFObservationEscale = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    EdLibelle: TUniEdit;
    UniLabel2: TUniLabel;
    RadStatut: TUniRadioGroup;
    UniPanel2: TUniPanel;
    BtnAdd: TUniButton;
    BtnUpdate: TUniButton;
    BtnDelete: TUniButton;
    DBGrid: TUniDBGrid;
    UniSimplePanel1: TUniSimplePanel;
    BtnSave: TUniButton;
    BtnCancel: TUniButton;
    EdCode: TUniEdit;
    UniLabel1: TUniLabel;
    procedure UniFormShow(Sender: TObject);
    procedure DBGridRecordCount(Sender: TUniDBGrid; var RecCount: Integer);
    procedure BtnSaveClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     procedure ShowData;
     procedure ClearData;
      var
      id_obs,lib_obs, code_obs, facturable_obs: string;
      FmContext : string;
  end;

function FObservationEscale: TFObservationEscale;

var
    filter, search, init_query, query:string;
    title :string = 'Observation';

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal;

function FObservationEscale: TFObservationEscale;
begin
  Result := TFObservationEscale(DM.GetFormInstance(TFObservationEscale));
end;


procedure TFObservationEscale.BtnAddClick(Sender: TObject);
begin
  FmContext := AddContext;
  ClearData;
  EdLibelle.JSInterface.JSCall('focus' ,[]);
end;

procedure TFObservationEscale.BtnSaveClick(Sender: TObject);
begin
    //INSERT
  if FmContext = AddContext then
      begin
          if EdLibelle.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell?',mtWarning,[mbok]);
                 EdLibelle.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from observation where libelle_obs=:libelle_obs');
                   Parameters.ParamByName('libelle_obs').Value:=EdLibelle.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Observation poss?de dej? ce Libell?',mtError,[mbok]);
                       EdLibelle.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

            if EdCode.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
                 EdCode.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from observation where code_obs=:code_obs');
                   Parameters.ParamByName('code_obs').Value:=EdCode.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Observation poss?de dej? ce Code ',mtError,[mbok]);
                       EdCode.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

              if RadStatut.IsBlank then
                  begin
                     MessageDlg('Veuillez renseigner le Statut',mtWarning,[mbok]);
                     RadStatut.JSInterface.JSCall('focus' ,[]);
                     Abort;
                  end
              else

              begin
                    MessageDlg('Voulez-vous enregister ?', mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('INSERT INTO observation (libelle_obs, code_obs, facturable_obs ) Values (:libelle, :code, :statut   )');
                                                  Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                                   Parameters.ParamByName('code').Value:= EdCode.Text;
                                                  Parameters.ParamByName('statut').Value:= ABS(RadStatut.ItemIndex-1);
                                                  ExecSQL;
                                              end;
                                             ClearData;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_obs) from observation');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu?',mtConfirmation,[mbok]);
                                             ShowData;
                                             DM.DQ_Grid_Obs.Locate('id_obs',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
  if FmContext = UpdateContext then
    begin
     if EdLibelle.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell?',mtWarning,[mbok]);
               EdLibelle.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibelle.Text <> lib_obs) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from observation where libelle_obs=:libelle_obs');
                       Parameters.ParamByName('libelle_obs').Value:=EdLibelle.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Observation dej? ce Libell?',mtError,[mbok]);
                           EdLibelle.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;


       if EdCode.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdLibelle.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCode.Text <> code_obs) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from observation where code_obs=:code_obs');
                       Parameters.ParamByName('code_obs').Value:=EdLibelle.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Observation dej? ce Code',mtError,[mbok]);
                           EdCode.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        if RadStatut.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Statut ',mtWarning,[mbok]);
               RadStatut.JSInterface.JSCall('focus' ,[]);
               Abort;
            end;


        begin
              MessageDlg('Voulez-vous enregister les modifications ?', mtConfirmation, mbYesNo,
                    procedure(Sender: TComponent; Res: Integer)
                    begin
                      case Res of
                        mrYes :
                            begin
                                  with DM.QUpdate do
                                        begin
                                            SQL.Text := ('UPDATE observation SET libelle_obs=:libelle, code_obs=:code, facturable_obs=:statut WHERE id_obs=:id ');
                                            Parameters.ParamByName('id').Value:= id_obs;
                                            Parameters.ParamByName('libelle').Value:= EdLibelle.Text;
                                            Parameters.ParamByName('code').Value:= EdCode.Text;
                                            Parameters.ParamByName('statut').Value:= ABS(RadStatut.ItemIndex-1);
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu?e',mtConfirmation,[mbok]);
                                       ShowData;
                                       DM.DQ_Grid_Obs.Locate('id_obs',id_obs,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFObservationEscale.BtnUpdateClick(Sender: TObject);
begin
    FmContext := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM observation where id_obs=:id ');
           Parameters.ParamByName('id').Value:= DBGrid.DataSource.DataSet.FieldByName('id_obs').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               id_obs:=DM.QStand.FieldValues['id_obs'];
               lib_obs :=DM.QStand.FieldValues['libelle_obs'];
               code_obs :=DM.QStand.FieldValues['code_obs'];
               facturable_obs :=DM.QStand.FieldValues['facturable_obs'];

               EdLibelle.Text :=DM.QStand.FieldValues['libelle_obs'];
               EdCode.Text :=DM.QStand.FieldValues['code_obs'];
               RadStatut.ItemIndex :=1-(DM.QStand.FieldValues['facturable_obs']);
           end
end;

procedure TFObservationEscale.ClearData;
  begin
      EdLibelle.Clear;
      EdCode.Clear;
      RadStatut.ItemIndex:=-1;
  end;

procedure TFObservationEscale.DBGridRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
 if  DBGrid.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdate.Enabled:=true;
              BtnDelete.Enabled:=true;
        end
      else
  if  DBGrid.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdate.Enabled:=False;
            BtnDelete.Enabled:=False;
         end;
end;

procedure TFObservationEscale.ShowData;
  begin
      filter:=' order by libelle_obs ';

      init_query:= 'SELECT * ,case 	WHEN facturable_obs=TRUE THEN ''OUI''	 ELSE ''NON''	end as statut FROM observation' ;
      query:=init_query + search+ filter;

      DM.DQ_Grid_Obs.Close;
      DM.DQ_Grid_Obs.SQL.Clear;
      DM.DQ_Grid_Obs.SQL.Text := query;
      DM.DQ_Grid_Obs.Open;
  end;

procedure TFObservationEscale.UniFormShow(Sender: TObject);
begin
 FmContext := AddContext;

  BtnAdd.Caption := '';
  BtnUpdate.Caption := '';
  BtnDelete.Caption := '';
  ClearData;
  ShowData;
end;

end.

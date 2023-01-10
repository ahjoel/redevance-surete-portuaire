unit UInstallationPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses, Data.DB,
  uniGUIClasses, uniGUIForm, uniBasicGrid, uniDBGrid, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniLabel, uniEdit, uniButton, uniPanel,
  uniPageControl, uniGUIBaseClasses;

type
  TFInstallationPort = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PInstaPort: TUniPageControl;
    UniContainerPanel2: TUniContainerPanel;
    PanTitle: TUniPanel;
    UniPanel1: TUniPanel;
    BtnSavePQ: TUniButton;
    BtnCancelPQ: TUniButton;
    EdCodePQ: TUniEdit;
    EdLibPQ: TUniEdit;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    DBLIP: TUniDBLookupComboBox;
    UniLabel5: TUniLabel;
    UniPanel2: TUniPanel;
    BtnAddPQ: TUniButton;
    BtnUpdatePQ: TUniButton;
    BtnDeletePQ: TUniButton;
    DBGridPostQuai: TUniDBGrid;
    Installation: TUniTabSheet;
    UniContainerPanel3: TUniContainerPanel;
    UniPanel3: TUniPanel;
    UniPanel4: TUniPanel;
    BtSaveIP: TUniButton;
    BtCancelIP: TUniButton;
    EdCodeIP: TUniEdit;
    EdLibIP: TUniEdit;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    UniPanel5: TUniPanel;
    BtnAddIP: TUniButton;
    BtnUpdateIP: TUniButton;
    BtnDeleteIP: TUniButton;
    DBGridInstPort: TUniDBGrid;
    Poste: TUniTabSheet;
    procedure BtSaveIPClick(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure DBGridInstPortRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure DBGridPostQuaiRecordCount(Sender: TUniDBGrid;
      var RecCount: Integer);
    procedure BtnDeleteIPClick(Sender: TObject);
    procedure BtnUpdateIPClick(Sender: TObject);
    procedure BtnSavePQClick(Sender: TObject);
    procedure BtnUpdatePQClick(Sender: TObject);
    procedure BtnDeletePQClick(Sender: TObject);
    procedure BtnAddPQClick(Sender: TObject);
    procedure BtnCancelPQClick(Sender: TObject);
    procedure BtnAddIPClick(Sender: TObject);
    procedure BtCancelIPClick(Sender: TObject);
    procedure PosteBeforeActivate(Sender: TObject; var AllowActivate: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ShowDataIP;
    procedure ClearDataIP;

    procedure ShowDataPQ;
    procedure ClearDataPQ;

    var
    id_IP, code_IP, lib_IP: string;
    id_PQ, code_PQ, lib_PQ, ip_PQ: string;
    FmContextIP : string;
    FmContextPQ : string;
  end;

function FInstallationPort: TFInstallationPort;
var
    filter_IP, search_IP, init_query_IP, query_IP:string;
    filter_PQ, search_PQ, init_query_PQ, query_PQ:string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UDataLaod, UGlobal, ULoadData;

function FInstallationPort: TFInstallationPort;
begin
  Result := TFInstallationPort(DM.GetFormInstance(TFInstallationPort));
end;

procedure TFInstallationPort.ClearDataIP;
  begin
      EdLibIP.Clear;
      EdCodeIP.Clear;
  end;


procedure TFInstallationPort.ClearDataPQ;
  begin
      EdLibPQ.Clear;
      EdCodePQ.Clear ;
      DBLIP.KeyValue:=null;
  end;

procedure TFInstallationPort.BtCancelIPClick(Sender: TObject);
begin
    FmContextIP := AddContext;
    ClearDataIP;
    EdLibIP.JSInterface.JSCall('focus' ,[]);
end;

procedure TFInstallationPort.BtnAddIPClick(Sender: TObject);
begin
    FmContextIP := AddContext;
    ClearDataIP;
    EdLibIP.JSInterface.JSCall('focus' ,[]);
end;

procedure TFInstallationPort.BtnAddPQClick(Sender: TObject);
begin
    FmContextPQ := AddContext;
    ClearDataPQ;
    EdLibPQ.JSInterface.JSCall('focus' ,[]);
end;

procedure TFInstallationPort.BtnCancelPQClick(Sender: TObject);
begin
   FmContextPQ := AddContext;
    ClearDataPQ;
    EdLibPQ.JSInterface.JSCall('focus' ,[]);
end;

procedure TFInstallationPort.BtnDeleteIPClick(Sender: TObject);
begin
    with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from installation_port I, poste_quai P where I.id_ip=P.ip_pq AND  I.id_ip=:id_ip');
                   Parameters.ParamByName('id_ip').Value:=DBGridInstPort.DataSource.DataSet.FieldByName('id_ip').AsString;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Donn�e referenc�e, Suppression impossible',mtError,[mbok]);
                       Abort;
                   end
              else

              begin

                    MessageDlg('Voulez-vous Supprimer '+DBGridInstPort.DataSource.DataSet.FieldByName('libelle_ip').AsString , mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('DELETE FROM installation_port WHERE id_ip=:id');
                                                  Parameters.ParamByName('id').Value:= DBGridInstPort.DataSource.DataSet.FieldByName('id_ip').AsString;
                                                  ExecSQL;
                                              end;
                                             ShowDataIP;
                                end
                            end ;
                          end
                        );
              end;
end;

procedure TFInstallationPort.BtnDeletePQClick(Sender: TObject);
begin
      with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from poste_quai P, escale E where P.id_pq=E.post_quai AND  id_pq=:id_pq');
                   Parameters.ParamByName('id_pq').Value:=DBGridPostQuai.DataSource.DataSet.FieldByName('id_pq').AsString;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Donn�e referenc�e, Suppression impossible',mtError,[mbok]);
                       Abort;
                   end
              else

              begin

                    MessageDlg('Voulez-vous Supprimer '+DBGridPostQuai.DataSource.DataSet.FieldByName('libelle_pq').AsString , mtConfirmation, mbYesNo,
                          procedure(Sender: TComponent; Res: Integer)
                          begin
                            case Res of
                              mrYes :
                                  begin
                                        with DM.QSave do
                                              begin
                                                  SQL.Text := ('DELETE FROM poste_quai WHERE id_pq=:id');
                                                  Parameters.ParamByName('id').Value:= DBGridPostQuai.DataSource.DataSet.FieldByName('id_pq').AsString;
                                                  ExecSQL;
                                              end;
                                             ShowDataPQ;
                                end
                            end ;
                          end
                        );
              end;
end;

procedure TFInstallationPort.BtnSavePQClick(Sender: TObject);
begin
    //INSERT
  if FmContextPQ = AddContext then
      begin

        if EdLibPQ.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibPQ.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from poste_quai where libelle_pq=:libelle_pq');
                   Parameters.ParamByName('libelle_pq').Value:=EdLibPQ.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Poste poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibPQ.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdCodePQ.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
                 EdCodePQ.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from poste_quai where code_pq=:code_pq');
                   Parameters.ParamByName('code_pq').Value:=EdCodePQ.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Un Poste poss�de dej� ce Code',mtError,[mbok]);
                       EdCodePQ.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

              if DBLIP.IsBlank then
                  begin
                     MessageDlg('Veuillez s�lectionner  l''Installation Portuaire ',mtWarning,[mbok]);
                     DBLIP.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO poste_quai (code_pq, libelle_pq, ip_pq ) Values (:code, :libelle, :ip_pq  )');
                                                  Parameters.ParamByName('code').Value:= EdCodePQ.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibPQ.Text;
                                                  Parameters.ParamByName('ip_pq').Value:= DBLIP.KeyValue;
                                                  ExecSQL;
                                              end;
                                             ClearDataPQ;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_pq) from poste_quai');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataPQ;
                                             DM.DQ_Grid_PQ.Locate('id_pq',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
  if FmContextPQ = UpdateContext then
    begin
      if EdLibPQ.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
               EdLibPQ.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibPQ.Text <> lib_PQ) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from poste_quai where libelle_pq=:libelle_pq');
                       Parameters.ParamByName('libelle_pq').Value:=EdLibPQ.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Poste poss�de dej� ce Libell�',mtError,[mbok]);
                           EdLibPQ.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdCodePQ.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdCodePQ.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCodePQ.Text <> code_PQ) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from poste_quai where code_pq=:code_pq');
                       Parameters.ParamByName('code_pq').Value:=EdCodePQ.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Un Poste dej� ce Code',mtError,[mbok]);
                           EdCodePQ.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        if DBLIP.IsBlank then
            begin
               MessageDlg('Veuillez s�lectionner  l''Installation Portuaire ',mtWarning,[mbok]);
               DBLIP.JSInterface.JSCall('focus' ,[]);
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
                                            SQL.Text := ('UPDATE poste_quai SET code_pq=:code, libelle_pq=:libelle, ip_pq=:ip_pq  WHERE id_pq=:id ');
                                            Parameters.ParamByName('id').Value:= id_PQ;
                                            Parameters.ParamByName('code').Value:= EdCodePQ.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibPQ.Text;
                                            Parameters.ParamByName('ip_pq').Value:= DBLIP.KeyValue;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowDataPQ;
                                       DM.DQ_Grid_Pq.Locate('id_pq',id_PQ,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFInstallationPort.BtnUpdateIPClick(Sender: TObject);
begin
      FmContextIP := UpdateContext;
 with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM installation_port where id_ip=:id ');
           Parameters.ParamByName('id').Value:= DBGridInstPort.DataSource.DataSet.FieldByName('id_ip').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin
               id_IP:=DM.QStand.FieldValues['id_ip'];
               lib_IP :=DM.QStand.FieldValues['libelle_ip'];
               code_IP :=DM.QStand.FieldValues['code_ip'];

               EdLibIP.Text :=DM.QStand.FieldValues['libelle_ip'];
               EdCodeIP.Text :=DM.QStand.FieldValues['code_ip'];
           end
end;

procedure TFInstallationPort.BtnUpdatePQClick(Sender: TObject);
begin
      FmContextPQ := UpdateContext;
        with DM.QStand do
           begin
           close;
           SQL.Clear;
           sql.add('SELECT * FROM poste_quai where id_pq=:id ');
           Parameters.ParamByName('id').Value:= DBGridPostQuai.DataSource.DataSet.FieldByName('id_pq').AsString;
           ExecSQL;
           Open;
           end;

           if DM.QStand.RecordCount > 0 then
           begin

               id_PQ:=DM.QStand.FieldValues['id_pq'];
               code_PQ :=DM.QStand.FieldValues['code_pq'];
               lib_PQ :=DM.QStand.FieldValues['libelle_pq'];
               ip_PQ :=DM.QStand.FieldValues['ip_pq'];


               EdCodePQ.Text :=DM.QStand.FieldValues['code_pq'];
               EdLibPQ.Text :=DM.QStand.FieldValues['libelle_pq'];
               DBLIP.KeyValue :=DM.QStand.FieldValues['ip_pq'];
           end
end;

procedure TFInstallationPort.BtSaveIPClick(Sender: TObject);
begin
  //INSERT
  if FmContextIP = AddContext then
      begin

        if EdLibIP.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
                 EdLibIP.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from installation_port where libelle_ip=:libelle_ip');
                   Parameters.ParamByName('libelle_ip').Value:=EdLibIP.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Installation Portuaire poss�de dej� ce Libell�',mtError,[mbok]);
                       EdLibIP.JSInterface.JSCall('focus' ,[]);
                       Abort;
                   end
              else

          if EdCodeIP.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
                 EdCodeIP.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
          else
            with  DM.QCheck do
              begin
                   close;
                   SQL.Clear;
                   sql.add('select * from installation_port where code_ip=:code_ip');
                   Parameters.ParamByName('code_ip').Value:=EdCodeIP.text;
                   ExecSQL;
                   Open;
              end;
              if DM.QCheck.RecordCount > 0 then
                   begin
                       MessageDlg('Une Installation Portuaire poss�de dej� ce Code',mtError,[mbok]);
                       EdCodeIP.JSInterface.JSCall('focus' ,[]);
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
                                                  SQL.Text := ('INSERT INTO installation_port (code_ip, libelle_ip ) Values (:code, :libelle)');
                                                  Parameters.ParamByName('code').Value:= EdCodeIP.Text;
                                                  Parameters.ParamByName('libelle').Value:= EdLibIP.Text;
                                                  ExecSQL;
                                              end;
                                             ClearDataIP;

                                             with DM.QMax  do
                                               begin
                                                   close;
                                                   SQL.Clear;
                                                    SQL.Add('select max(id_ip) from installation_port');
                                                    ExecSQL;
                                                   Open;
                                               end;
                                             MessageDlg('Enregistrement effectu�',mtConfirmation,[mbok]);
                                             ShowDataIP;
                                             DM.DQ_Grid_IP.Locate('id_ip',dm.QMax.Fields[0].AsString,[loCaseInsensitive] );
                                end
                            end ;
                          end
                        );
              end;

      end

    else

//UPDATE
 if FmContextIP = UpdateContext then
    begin
      if EdLibIP.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Libell�',mtWarning,[mbok]);
               EdLibIP.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdLibIP.Text <> lib_IP) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from installation_port where libelle_ip=:libelle_ip');
                       Parameters.ParamByName('libelle_ip').Value:=EdLibIP.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Installation Portuaire poss�de dej� ce Libell�',mtError,[mbok]);
                           EdLibIP.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

       if EdCodeIP.IsBlank then
            begin
               MessageDlg('Veuillez renseigner le Code',mtWarning,[mbok]);
               EdCodeIP.JSInterface.JSCall('focus' ,[]);
               Abort;
            end ;

      if (EdCodeIP.Text <> code_IP) then
           begin
               with  DM.QCheck do
                  begin
                       close;
                       SQL.Clear;
                       sql.add('select * from installation_port where code_ip=:code_ip');
                       Parameters.ParamByName('code_ip').Value:=EdCodeIP.text;
                       ExecSQL;
                       Open;
                  end;
                  if DM.QCheck.RecordCount > 0 then
                       begin
                           MessageDlg('Une Installation Portuaire poss�de dej� ce Code ',mtError,[mbok]);
                           EdCodeIP.JSInterface.JSCall('focus' ,[]);
                           Abort;
                       end
           end ;

        begin
              MessageDlg('Voulez-vous enregister les modifications ?', mtConfirmation, mbYesNo,
                    procedure(Sender: TComponent; Res: Integer)
                    begin
                      case Res of
                        mrYes :
                            begin
                                  with DM.QUpdate do
                                        begin
                                            SQL.Text := ('UPDATE installation_port SET code_ip=:code, libelle_ip=:libelle WHERE id_ip=:id ');
                                            Parameters.ParamByName('id').Value:= id_IP;
                                            Parameters.ParamByName('code').Value:= EdCodeIP.Text;
                                            Parameters.ParamByName('libelle').Value:= EdLibIP.Text;
                                            ExecSQL;
                                        end;

                                       MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
                                       ShowDataIP;
                                       DM.DQ_Grid_IP.Locate('id_ip',id_IP,[loCaseInsensitive] );
                          end
                      end ;
                    end
                  );
        end;

    end
end;

procedure TFInstallationPort.DBGridInstPortRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
 if  DBGridInstPort.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdateIP.Enabled:=true;
              BtnDeleteIP.Enabled:=true;
        end
      else
  if  DBGridInstPort.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdateIP.Enabled:=False;
            BtnDeleteIP.Enabled:=False;
         end;
end;

procedure TFInstallationPort.DBGridPostQuaiRecordCount(Sender: TUniDBGrid;
  var RecCount: Integer);
begin
   if  DBGridPostQuai.DataSource.DataSet.RecordCount > 0 then
        begin
              BtnUpdatePQ.Enabled:=true;
              BtnDeletePQ.Enabled:=true;
        end
      else
  if  DBGridPostQuai.DataSource.DataSet.RecordCount = 0 then
         begin
            BtnUpdatePQ.Enabled:=False;
            BtnDeletePQ.Enabled:=False;
         end;
end;

procedure TFInstallationPort.PosteBeforeActivate(Sender: TObject;
  var AllowActivate: Boolean);
begin
    DM.DQ_DBL_IP.Close;
    DM.DQ_DBL_IP.SQL.Clear;
    DM.DQ_DBL_IP.SQL.Add('SELECT * FROM installation_port WHERE id_ip is not null order by libelle_ip');
    DM.DQ_DBL_IP.Open;
end;

procedure TFInstallationPort.ShowDataIP;
  begin
      filter_IP:=' order by libelle_ip';

      init_query_IP:= 'SELECT * FROM installation_port WHERE id_ip is not null ' ;
      query_IP:=init_query_IP + search_IP+ filter_IP;

      DM.DQ_Grid_IP.Close;
      DM.DQ_Grid_IP.SQL.Clear;
      DM.DQ_Grid_IP.SQL.Text := query_IP;
      DM.DQ_Grid_IP.Open;
  end;

procedure TFInstallationPort.ShowDataPQ;
  begin
      filter_PQ:=' order by libelle_pq';

      init_query_PQ:= 'SELECT * FROM poste_quai P, installation_port I WHERE P.ip_pq= I.id_ip  ' ;
      query_PQ:=init_query_PQ + search_PQ+ filter_PQ;

      DM.DQ_Grid_PQ.Close;
      DM.DQ_Grid_PQ.SQL.Clear;
      DM.DQ_Grid_PQ.SQL.Text := query_PQ;
      DM.DQ_Grid_PQ.Open;
  end;

procedure TFInstallationPort.UniFormShow(Sender: TObject);
begin
     //Intsllation Port
    FmContextIP := AddContext;

    ShowDataIP;

    BtnAddIP.Caption := '';
    BtnUpdateIP.Caption := '';
    BtnDeleteIP.Caption := '';

    //Port Quai
    FmContextPQ := AddContext;

    LoadDBLInstallationPort;

    ShowDataPQ;

    BtnAddPQ.Caption := '';
    BtnUpdatePQ.Caption := '';
    BtnDeletePQ.Caption := '';



end;

end.

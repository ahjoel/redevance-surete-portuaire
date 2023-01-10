unit UEditRapportEscale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Data.DB,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniEdit, uniButton, uniPanel, uniGUIBaseClasses,
  uniGroupBox, uniBasicGrid, uniStringGrid, uniLabel, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniDateTimePicker;

type
  TFEditRapportEscale = class(TUniForm)
    UniContainerPanel1: TUniContainerPanel;
    PanOps: TUniPanel;
    BtnCancel: TUniButton;
    BtnSave: TUniButton;
    BtnRapport: TUniButton;
    EdRapport: TUniEdit;
    UniPanel1: TUniPanel;
    UniSimplePanel5: TUniSimplePanel;
    UniGroupBox1: TUniGroupBox;
    UniSimplePanel1: TUniSimplePanel;
    BtnRechEscale: TUniButton;
    UniLabel4: TUniLabel;
    UniLabel5: TUniLabel;
    UniLabel6: TUniLabel;
    UniLabel7: TUniLabel;
    UniLabel8: TUniLabel;
    UniLabel9: TUniLabel;
    EdRefPort: TUniEdit;
    EdRefInt: TUniEdit;
    EdNavire: TUniEdit;
    EdConsignataire: TUniEdit;
    EdPoste: TUniEdit;
    EdArrive: TUniEdit;
    UniSimplePanel6: TUniSimplePanel;
    UniSimplePanelBtAddline: TUniSimplePanel;
    BtAddLine: TUniButton;
    UniSimplePanel2: TUniSimplePanel;
    StringGridRapport: TUniStringGrid;
    UniSimplePanelselectline: TUniSimplePanel;
    UniLabel1: TUniLabel;
    DBLMarchandise: TUniDBLookupComboBox;
    UniLabel2: TUniLabel;
    DBLAct: TUniDBLookupComboBox;
    EdQte: TUniNumberEdit;
    UniLabel3: TUniLabel;
    UniSimplePanelbtdeleteLine: TUniSimplePanel;
    BtDeleteLine: TUniButton;
    UniSimplePanel3: TUniSimplePanel;
    UniLabel10: TUniLabel;
    EdDate: TUniDateTimePicker;
    UniLabel11: TUniLabel;
    EdNumATP: TUniEdit;
    UniLabel12: TUniLabel;
    EdNumVoyage: TUniEdit;
    procedure UniFormShow(Sender: TObject);
    procedure BtnCancelClick(Sender: TObject);
    procedure BtnRechEscaleClick(Sender: TObject);
    procedure UniFormCreate(Sender: TObject);
    procedure BtAddLineClick(Sender: TObject);
    procedure BtDeleteLineClick(Sender: TObject);
    procedure StringGridRapportSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure StringGridRapportDrawCell(Sender: TObject; ACol, ARow: Integer;
      var Value: string; Attribs: TUniCellAttribs);
    procedure BtnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_rap_esc, escale, date, num_voyage, num_atp : string;
    FmContext : string;
    EditContext : string;

    id_esc : string;


    var
    posit : integer;
    cpt:Integer;

    procedure ClearData;
  end;

function FEditRapportEscale: TFEditRapportEscale;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UGlobal, ULoadData, USelectEscale, UFunction,
  UProject_Function, URapportEscale;

function FEditRapportEscale: TFEditRapportEscale;
begin
  Result := TFEditRapportEscale(DM.GetFormInstance(TFEditRapportEscale));
end;


procedure TFEditRapportEscale.BtAddLineClick(Sender: TObject);
var
      cpt, i,j:Integer;
      existe:Boolean;
begin
    if DBLMarchandise.IsBlank then
          begin
             MessageDlg('Veuillez s�lectionner  la Marchandise ',mtWarning,[mbok]);
             DBLMarchandise.JSInterface.JSCall('focus' ,[]);
             Abort;
          end
      else

    if DBLAct.IsBlank then
          begin
             MessageDlg('Veuillez s�lectionner  le Mouvement ',mtWarning,[mbok]);
             DBLAct.JSInterface.JSCall('focus' ,[]);
             Abort;
          end
      else
      if EdQte.Value <= 0 then
          begin
             MessageDlg('Veuillez renseigner la Quantite',mtWarning,[mbok]);
             EdQte.JSInterface.JSCall('focus' ,[]);
             Abort;
          end
      else

       //PREMIERE LIGNE
       if StringGridRapport.Cells[0,1]='' then //1ere ligne
                  begin
                      StringGridRapport.Cells[0,1]:='1';
                      StringGridRapport.Cells[1,1]:=DBLMarchandise.Text;
                      StringGridRapport.Cells[2,1]:=DBLAct.Text;
                      StringGridRapport.Cells[3,1]:=FloatToStr(EdQte.Value) ;
                  end
        else

         begin //+sieure ligne

            cpt:=StringGridRapport.RowCount;
            existe:=false;

            for i:=1 to cpt-1 do
            if ((StringGridRapport.Cells[1,i]= DBLMarchandise.Text) AND (StringGridRapport.Cells[2,i]= DBLAct.Text)) then
                 begin
                   MessageDlg('Ligne d�j� ajouter !',TMsgDlgType.mtError,[mbok]);
                   DBLMarchandise.JSInterface.JSCall('focus' ,[]);
                   Abort;

                 end;

            if not existe then
            begin
                StringGridRapport.RowCount:=StringGridRapport.RowCount+1;
                cpt:=StringGridRapport.RowCount-1;
                for j := 1 to StringGridRapport.RowCount-1 do
                begin
                  StringGridRapport.Cells[0,j]:=IntToStr(j);
                end;
                StringGridRapport.Cells[1,cpt]:=DBLMarchandise.Text;
                StringGridRapport.Cells[2,cpt]:=DBLAct.Text;
                StringGridRapport.Cells[3,cpt]:=FloatToStr(EdQte.Value) ;

            end;
        end;

        DBLMarchandise.KeyValue:=Null;
        DBLAct.KeyValue:=Null;
        EdQte.Value:=0;
end;

procedure TFEditRapportEscale.BtDeleteLineClick(Sender: TObject);
var
    i , j: integer;
begin
    if StringGridRapport.Cells[0,1] <>'' then

 //UNE SEUL LIGNE
    begin
      if StringGridRapport.RowCount=2 then  //1 ligne
        begin
        StringGridRapport.Cells[0,1]:='';
        StringGridRapport.Cells[1,1]:='';
        StringGridRapport.Cells[2,1]:='';
        StringGridRapport.Cells[3,1]:='';
        end
    else

      //PLUSIEURS LIGNE
       BEGIN
         // posit:=StringGridRapport.OnSelectCell();
          cpt:=StringGridRapport.RowCount;

           if posit=cpt-1 then
               begin     // derniere ligne
                  StringGridRapport.Cells[0,posit]:='';
                  StringGridRapport.Cells[1,posit]:='';
                  StringGridRapport.Cells[2,posit]:='';
                  StringGridRapport.Cells[3,posit]:='';

                  StringGridRapport.RowCount:=cpt-1;

              end
           else
            begin
                  for i:=posit to cpt-1 do
                      begin
                          StringGridRapport.Cells[0,i]:=StringGridRapport.Cells[0,i+1];
                          StringGridRapport.Cells[1,i]:=StringGridRapport.Cells[1,i+1];
                          StringGridRapport.Cells[2,i]:=StringGridRapport.Cells[2,i+1];
                          StringGridRapport.Cells[3,i]:=StringGridRapport.Cells[3,i+1];
                          StringGridRapport.RowCount:=cpt-1;

                           for j := 1 to StringGridRapport.RowCount-1 do
                             begin
                               StringGridRapport.Cells[0,j]:=IntToStr(j);
                             end;
                        end;

            end;
           END;


        end;
end;

procedure TFEditRapportEscale.BtnCancelClick(Sender: TObject);
begin
close;
end;

procedure TFEditRapportEscale.ClearData;
begin
//  pass
end;
procedure TFEditRapportEscale.StringGridRapportDrawCell(Sender: TObject; ACol,
  ARow: Integer; var Value: string; Attribs: TUniCellAttribs);
begin
    if StringGridRapport.Cells[0,1]='' then
                 BtDeleteLine.Enabled := False
        else

                BtDeleteLine.Enabled := True;
               
end;

procedure TFEditRapportEscale.StringGridRapportSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
 posit := ARow;
end;

procedure TFEditRapportEscale.BtnRechEscaleClick(Sender: TObject);
begin
    FSelectEscale.FrmMode := ModeRapport;
    FSelectEscale.ShowModal;
end;

procedure TFEditRapportEscale.BtnSaveClick(Sender: TObject);
var
      cpt, i,j:Integer;
      existe:Boolean;
begin
    if FmContext = AddContext then
      begin

        if EdRefPort.IsBlank then
              begin
                 MessageDlg('Veuillez s�lectionner l''Escale ',mtWarning,[mbok]);
                 BtnRechEscale.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdDate.DateTime=0 then
              begin
                 MessageDlg('Veuillez renseigner la Date',mtWarning,[mbok]);
                 EdDate.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdNumATP.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le N� ATP ',mtWarning,[mbok]);
                 EdNumATP.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if EdNumVoyage.IsBlank then
              begin
                 MessageDlg('Veuillez renseigner le N� Voyage ',mtWarning,[mbok]);
                 EdNumVoyage.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else

        if StringGridRapport.Cells[0,1]='' then
              begin
                 MessageDlg('Veuillez Ajouter une Ligne ',mtWarning,[mbok]);
                 DBLMarchandise.JSInterface.JSCall('focus' ,[]);
                 Abort;
              end
        else


        begin
          MessageDlg('Voulez-vous enregister ?', mtConfirmation, mbYesNo,
            procedure(Sender: TComponent; Res: Integer)
            var
                 i,j:Integer;
            begin
                  case Res of
                    mrYes :
                        begin
                        cpt:=StringGridRapport.RowCount;
                              with DM.QSave do
                                begin
                                    close;
                                    SQL.Clear;
                                    SQL.Add('INSERT INTO rapport_escale (escale_rap_esc, date, num_voyage, num_atp, user_create )'#13+
                                                         'Values ( :escale_rap_esc, :date, :num_voyage, :num_atp, :user_create )');
                                    Parameters.ParamByName('escale_rap_esc').Value:=id_esc;
                                    Parameters.ParamByName('date').Value:= msqlDateTime(EdDate);
                                    Parameters.ParamByName('num_voyage').Value:=EdNumVoyage.Text;
                                    Parameters.ParamByName('num_atp').Value:=EdNumATP.Text;
                                    Parameters.ParamByName('user_create').Value:=UserId;
                                    ExecSQL;
                                end;

                                //DERNIER RAPPORT
                                with DM.QMax do
                                   begin
                                   close;
                                   SQL.Clear;
                                   SQL.Add('select max(id_rap_esc) as maxrap from rapport_escale');
                                   Open;
                                   end;

                        for i:=1 to cpt-1 do
                             begin
                                  //Cl� de marchandise
                                  with DM.QStand do
                                               begin
                                               close;
                                               SQL.Clear;
                                               SQL.Add('select id_marchandise from marchandise where libelle_marchandise=:libelle');
                                               Parameters.ParamByName('libelle').Value:=StringGridRapport.Cells[1,i];
                                               Open;
                                               end;


                                  //Cl� de Mouvement
                                  with DM.QStand1 do
                                               begin
                                               close;
                                               SQL.Clear;
                                               SQL.Add('select id_action from action where libelle_action=:libelle');
                                               Parameters.ParamByName('libelle').Value:=StringGridRapport.Cells[2,i];
                                               Open;
                                               end;

                                  with DM.QSave do
                                                begin
                                                close;
                                                SQL.Clear;
                                                SQL.Add('INSERT INTO ligne_rapport_esc ( rapport_ligne_rap, marchandise_ligne_rap, qte_ligne_rap, mouvement_ligne_rap) Values (:rapport ,:marchandise ,:qte ,:mouvement)');
                                                Parameters.ParamByName('rapport').Value:=DM.QMax.FieldValues['maxrap'];
                                                Parameters.ParamByName('marchandise').Value:= DM.QStand.FieldValues['id_marchandise'];
                                                Parameters.ParamByName('mouvement').Value:= DM.QStand1.FieldValues['id_action'];
                                                Parameters.ParamByName('qte').Value:=StringGridRapport.Cells[3,i];
                                                ExecSQL;
                                                end;

                             End;

                             with DM.QUpdate do
                                          begin
                                              SQL.Text := ('UPDATE escale SET rapport=:rapport WHERE id=:id');
                                              Parameters.ParamByName('id').Value:= id_esc;
                                              Parameters.ParamByName('rapport').Value:= 1;
                                              ExecSQL;
                                          end;


                               MessageDlg('Enregistrement effectu�e',mtConfirmation,[mbok]);
                               FRapportEscale.ShowData;

                               DM.DQ_Grid_RapEsc.Locate('id',DM.QMax.FieldValues['maxrap'],[loCaseInsensitive] );
                           end
                        end ;
                      end
                                );
         end;

      end

    else

////  //UPDATE
//      if FmContext = UpdateContext then
//          begin
//            if EdRefPort.IsBlank then
//                  begin
//                     MessageDlg('Veuillez renseigner la R�f�rence Port',mtWarning,[mbok]);
//                     EdRefPort.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end ;
//
//           if (EdRefPort.Text <> num_port) then
//               begin
//                   with  DM.QCheck do
//                      begin
//                           close;
//                           SQL.Clear;
//                           sql.add('select * from escale where num_port=:num_port');
//                           Parameters.ParamByName('num_port').Value:=EdRefPort.text;
//                           ExecSQL;
//                           Open;
//                      end;
//                      if DM.QCheck.RecordCount > 0 then
//                           begin
//                               MessageDlg('Un Escale poss�de dej� cette R�f�rence Port ',mtError,[mbok]);
//                               EdRefPort.JSInterface.JSCall('focus' ,[]);
//                               Abort;
//                           end
//               end ;
//
//
//            if DBLNavire.IsBlank then
//                  begin
//                     MessageDlg('Veuillez s�lectionner le Navire',mtWarning,[mbok]);
//                     DBLNavire.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//
//             if DBLPoste.IsBlank then
//                  begin
//                     MessageDlg('Veuillez s�lectionner le Poste',mtWarning,[mbok]);
//                     DBLPoste.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end  ;
//
//
//             if DBLConsignataire.IsBlank then
//                  begin
//                     MessageDlg('Veuillez s�lectionner le Consignataire',mtWarning,[mbok]);
//                     DBLConsignataire.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end    ;
//
//             if DBLProvenance.IsBlank then
//                  begin
//                     MessageDlg('Veuillez s�lectionner la Provenance',mtWarning,[mbok]);
//                     DBLProvenance.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//             if DBLDestination.IsBlank then
//                  begin
//                     MessageDlg('Veuillez s�lectionner le Destination',mtWarning,[mbok]);
//                     DBLDestination.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//             if DBLProvenance.KeyValue = DBLDestination.KeyValue then
//                  begin
//                     MessageDlg('Provenance et Destination identique ',TMsgDlgType.mtError,[mbok]);
//                     DBLDestination.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//            if EdRade.IsBlank then
//                  begin
//                     MessageDlg('Veuillez renseigner la Date de Rade',mtWarning,[mbok]);
//                     EdRade.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//            if EdAccostage.IsBlank then
//                  begin
//                     MessageDlg('Veuillez renseigner la Date d''Accostage',mtWarning,[mbok]);
//                     EdAccostage.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//            if EdDepart.IsBlank then
//                  begin
//                     MessageDlg('Veuillez renseigner la Date de Depart',mtWarning,[mbok]);
//                     EdDepart.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//            if CBObservation.IsBlank then
//                  begin
//                     MessageDlg('Veuillez s�lectionner l''Observation ',mtWarning,[mbok]);
//                     CBObservation.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//            if EdTonBrut.IsBlank then
//                  begin
//                     MessageDlg('Veuillez renseigner le Tonnage Brut',mtWarning,[mbok]);
//                     EdTonBrut.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//            if EdTonNet.IsBlank then
//                  begin
//                     MessageDlg('Veuillez renseigner le Tonnage Net',mtWarning,[mbok]);
//                     EdTonNet.JSInterface.JSCall('focus' ,[]);
//                     Abort;
//                  end;
//
//                  begin
//                        MessageDlg('Voulez-vous appliquer les modifications ?', mtConfirmation, mbYesNo,
//                              procedure(Sender: TComponent; Res: Integer)
//                              begin
//                                case Res of
//                                  mrYes :
//                                      begin
//                                            with DM.QSave do
//                                                  begin
//                                                      SQL.Text := ('UPDATE escale SET  num_port=:num_port, navire=:navire, consignataire=:consignataire, post_quai=:post_quai, date_rade=:date_rade , date_accost=:date_accost, date_depart=:date_depart, port_orgine=:port_orgine,'#13+
//                                                              '  port_dest=:port_dest, tonne_net=:tonne_net, tonne_brut=:tonne_brut, observation=:observation WHERE id=:id');
//                                                      Parameters.ParamByName('id').Value:= id_esc;
//                                                      Parameters.ParamByName('num_port').Value:= EdRefPort.Text;
//                                                      Parameters.ParamByName('navire').Value:=DBLNavire.KeyValue;
//                                                      Parameters.ParamByName('consignataire').Value:= DBLConsignataire.KeyValue;
//                                                      Parameters.ParamByName('post_quai').Value:= DBLPoste.KeyValue;
//                                                     Parameters.ParamByName('date_rade').Value:=msqlDateTime(EdRade);
//                                                      Parameters.ParamByName('date_accost').Value:= msqlDateTime(EdAccostage);
//                                                      Parameters.ParamByName('date_depart').Value:=msqlDateTime(EdDepart);
//                                                      Parameters.ParamByName('port_orgine').Value:= DBLProvenance.KeyValue;
//                                                      Parameters.ParamByName('port_dest').Value:= DBLDestination.KeyValue;
//                                                      Parameters.ParamByName('tonne_net').Value:= EdTonNet.Value;
//                                                      Parameters.ParamByName('tonne_brut').Value:=EdTonBrut.Value;
//                                                      Parameters.ParamByName('observation').Value:= CBObservation.Text;
//                                                      ExecSQL;
//                                                  end;
//                                                 ClearData;
//
//                                               MessageDlg('modification effectu�e',mtConfirmation,[mbok]);
//                                               FEscale.ShowData;
//                                               DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
//                                               close;
//
//                                    end
//                                end ;
//                              end
//                            );
//                  end;
//
//          end
//  else
//
//  //CONTROL
//  if FmContext = ControlContext then
//
//          begin
//                MessageDlg('Voulez-vous marquer les informations suivantes comme "Control�es" ?', mtConfirmation, mbYesNo,
//                      procedure(Sender: TComponent; Res: Integer)
//                      begin
//                        case Res of
//                          mrYes :
//                              begin
//                                    with DM.QSave do
//                                          begin
//                                              SQL.Text := ('UPDATE escale SET rapport_control=:rapport_control,  user_control=:user_control, date_control=CURRENT_TIMESTAMP WHERE id=:id');
//                                              Parameters.ParamByName('id').Value:= id_esc;
//                                              Parameters.ParamByName('user_control').Value:= UserId;
//                                              Parameters.ParamByName('rapport_control').Value:= 0;
//                                              ExecSQL;
//                                          end;
//                                         ClearData;
//
//                                       MessageDlg('Control effectu�e',mtConfirmation,[mbok]);
//                                       FEscale.ShowData;
//                                       DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
//                                       close;
//
//                            end
//                        end ;
//                      end
//                    );
//          end
//
//         else
//
//  //VALIDATION
//  if FmContext = ValidatContext then
//          begin
//                MessageDlg('Voulez-vous marquer les informations suivantes comme "Valid�es" ?', mtConfirmation, mbYesNo,
//                      procedure(Sender: TComponent; Res: Integer)
//                      begin
//                        case Res of
//                          mrYes :
//                              begin
//                                    with DM.QSave do
//                                          begin
//                                              SQL.Text := ('UPDATE escale SET rapport_validate=:rapport_validate, user_validate=:user_validate, date_validate=CURRENT_TIMESTAMP WHERE id=:id');
//                                              Parameters.ParamByName('id').Value:= id_esc;
//                                              Parameters.ParamByName('user_validate').Value:= UserId;
//                                              Parameters.ParamByName('rapport_validate').Value:= 0;
//                                              ExecSQL;
//                                          end;
//                                         ClearData;
//
//                                       MessageDlg('Control effectu�e',mtConfirmation,[mbok]);
//                                       FEscale.ShowData;
//                                       DM.DQ_Grid_Escale.Locate('id',id_esc,[loCaseInsensitive] );
//                                       close;
//
//                            end
//                        end ;
//                      end
//                    );
//          end
end;

procedure TFEditRapportEscale.UniFormCreate(Sender: TObject);
begin
    StringGridRapport.Cells[0, 0] := 'N�';
    StringGridRapport.Cells[1, 0] := 'Marchandise';
    StringGridRapport.Cells[2, 0] := 'Mouvements';
    StringGridRapport.Cells[3, 0] := 'Qt�';


    StringGridRapport.ColWidths[0] := 30;
    StringGridRapport.ColWidths[1] := 230;
    StringGridRapport.ColWidths[2] := 230;
    StringGridRapport.ColWidths[3] := 60;


end;

procedure TFEditRapportEscale.UniFormShow(Sender: TObject);
begin
    LoadDBLMarchandise;
    LoadDBLAction;

    if FmContext=AddContext then
    begin
      EdDate.DateTime := 0;
    end;
end;

end.

unit UPrintOptionFactPal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGroupBox, uniPanel, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniLabel, uniDateTimePicker, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniRadioGroup, uniButton, uniStatusBar,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TFPrintOptionFactPAL = class(TUniForm)
    UniPanel1: TUniPanel;
    GBGroup: TUniGroupBox;
    CBGroup: TUniComboBox;
    GBSum: TUniGroupBox;
    CBSummary: TUniComboBox;
    BtnValidat: TUniButton;
    procedure BtnValidatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FPrintOptionFactPAL: TFPrintOptionFactPAL;
var
    query_print, group_filter, group_select : string;
    query_sum,  init_query_sum, order_sum, lib_sum, data_sum: string;
    query_group, init_query_group, data_group, filter_group, order_group , title_group: string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEtatsFacturePal, UGlobal, ULoadData, UReport;

function FPrintOptionFactPAL: TFPrintOptionFactPAL;
begin
  Result := TFPrintOptionFactPAL(DM.GetFormInstance(TFPrintOptionFactPAL));
end;

procedure TFPrintOptionFactPAL.BtnValidatClick(Sender: TObject);
begin
    if ((FEtatsFacturePal.DBGrid.DataSource.DataSet.RecordCount=0) OR (query.IsEmpty = True)) then
          begin
              MessageDlg('Aucune Donn�e � Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
    begin
          if CBGroup.Text = '' then
              begin
//               MAKE GROUPHEAD INVISIBLE
                 TfrxGroupHeader(FEtatsFacturePal.frxReport.FindObject('GroupHeader')).Visible :=false;
                 TfrxGroupHeader(FEtatsFacturePal.frxReport.FindObject('GroupHeader')).Condition :='frxDBDataset."id_factures_pal"';
                 TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('line')).Text :='[Line#]';
                 order_group := '';
              end

          else
              begin
                   TfrxGroupHeader(FEtatsFacturePal.frxReport.FindObject('GroupHeader')).Visible :=True;

                   case CBGroup.ItemIndex of
                        0 : begin
                              data_group := 'frxDBDataset."id_cons_fact"' ;
                              filter_group := ' GROUP BY L.id_cons_fact ' ;
                              order_group :=  ' ORDER BY L.id_cons_fact '  ;
                              title_group := '[frxDBDataset."cons_fact"]';
                            end;

                        1: begin
                              data_group := 'frxDBDataset."id_type_fact"' ;
                              filter_group := ' GROUP BY id_type_fact ' ;
                              order_group :=  ' ORDER BY id_type_fact  '  ;
                              title_group := '[frxDBDataset."code_type_fact"]';
                            end;

                        2 : begin
                              data_group := 'frxDBDataset."statut_fact"'  ;
                              filter_group := ' GROUP BY statut_fact ' ;
                              order_group :=  ' ORDER BY statut_fact '  ;
                              title_group := '[frxDBDataset."statut_fact"]';
                            end;

                        3 : begin
                              data_group := 'frxDBDataset."id_type_nav"'  ;
                              filter_group := ' GROUP BY id_type_nav ' ;
                              order_group :=  ' ORDER BY id_type_nav '  ;
                              title_group := '[frxDBDataset."code_type_nav"]';
                            end;

                        4 : begin
                              data_group := 'frxDBDataset."complement_statut"'  ;
                              filter_group := ' GROUP BY complement_statut ' ;
                              order_group :=  ' ORDER BY complement_statut '  ;
                              title_group := '[frxDBDataset."complement_statut"]';
                            end;
                    end;

                   //GROUP DATA
                   TfrxGroupHeader(FEtatsFacturePal.frxReport.FindObject('GroupHeader')).Condition :=data_group;
                   TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_group')).Text :=title_group ;
                   TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('line')).Text :='[Line]';
              end ;

            if CBSummary.Text = '' then
                begin
                FEtatsFacturePal.frxReport.Pages[1].Visible := False
                end
            else
               begin
                  case CBSummary.ItemIndex of
                    0 : begin
                          group_select := ' id_cons_fact ' ;
                          group_filter := ' GROUP BY id_cons_fact ' ;
                          lib_sum := 'CONSIGNATAIRE' ;
                          data_sum := '[frxDBDataset_sum."cons_fact"]'
                        end;

                    1 : begin
                          group_select := ' id_type_fact ' ;
                          group_filter := ' GROUP BY id_type_fact ' ;
                          lib_sum := 'TYPE DE FACTURE';
                          data_sum := '[frxDBDataset_sum."code_type_fact"]'
                        end;

                    2 : begin
                          group_select := ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact ' ;
                          group_filter := ' GROUP BY statut_fact ' ;
                          lib_sum := 'STATUT FACTURE' ;
                          data_sum := '[frxDBDataset_sum."statut_fact"]'
                        end;
                    3 : begin
                          group_select := ' id_type_nav ' ;
                          group_filter := ' GROUP BY id_type_nav ' ;
                          lib_sum := 'TYPE DE NAVIRE';
                          data_sum := '[frxDBDataset_sum."code_type_nav"]'
                        end;

                    4 : begin
                          group_select :=  ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI'' end as complement_statut ' ;
                          group_filter := ' GROUP BY complement_statut ' ;
                          lib_sum := 'FACTURATION DE COMPLEMENT'  ;
                          data_sum := '[frxDBDataset_sum."complement_statut"]'
                        end;
                   end;

                      order_sum := ' order by  nb_fact desc  ' ;
                      init_query_sum:= 'SELECT ' + group_select +  ', COUNT(id_factures_pal) AS nb_fact FROM ( '#13+
                             '  SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact,  R.ref AS ref_nav, N.nom_navire, N.id_navire, P.code_type_nav, P.id_type_nav, F.ref_facture_pal, T.code_type_fact, T.id_type_fact, '#13+
                             ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement, (montant_facture_pal-montant_complement_facture_pal) as montant_reel, '#13+
                             ' FLOOR (montant_facture_pal * 655.957) as montant_xof, '#13+
                             ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                             ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                             ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                             ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                             ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end AS validation, '#13+
                             ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut '#13+
                             ' FROM facture_pal F '#13+
                             ' LEFT JOIN rade R on F.rade_facture_pal=R.id '#13+
                             ' INNER JOIN exercice Z ON R.exercice = Z.id_exercice  '#13+
                             ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                             ' INNER JOIN consignataire K on R.consignataire=K.id_consignataire '#13+
                             ' INNER JOIN navire N on R.navire=N.id_navire '#13+
                             ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav '#13+
                             ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                             ' UNION '#13+
                             ' SELECT F.id_factures_pal, F.ref_facture_pal AS ref_fact, E.ref as ref_nav,  N.nom_navire, N.id_navire, P.code_type_nav, P.id_type_nav, F.ref_facture_pal, T.code_type_fact, T.id_type_fact, '#13+
                             ' F.montant_facture_pal as montant, F.montant_complement_facture_pal as complement,(montant_facture_pal-montant_complement_facture_pal) AS montant_reel, '#13+
                             ' FLOOR (montant_facture_pal * 655.957) as montant_xof, '#13+
                             ' F.date_emise_facture_pal, F.date_trans_facture_pal, F.date_ech_facture_pal, F.statut_facture_pal, C.nom_consignataire AS cons_fact, C.id_consignataire AS id_cons_fact, '#13+
                             ' K.nom_consignataire AS cons_nav, K.id_consignataire AS id_cons_nav, Z.id_exercice, Z.libelle_exercice, '#13+
                             ' case WHEN F.statut_facture_pal is null THEN ''N'' ELSE F.statut_facture_pal	end AS statut_fact, '#13+
                             ' case WHEN date_control_facture_pal is null THEN '''' ELSE ''O''	end as control, '#13+
                             ' case WHEN date_validate_facture_pal is null THEN '''' ELSE ''O''	end AS validation , '#13+
                             ' case WHEN montant_complement_facture_pal =0 THEN ''NON'' ELSE ''OUI''	end as complement_statut '#13+
                             ' FROM facture_pal F '#13+
                             ' LEFT JOIN escale E on F.escale_facture_pal=E.id '#13+
                             ' INNER JOIN exercice Z ON E.exercice = Z.id_exercice '#13+
                             ' INNER JOIN consignataire C ON F.consignataire_facture_pal=C.id_consignataire '#13+
                             ' INNER JOIN consignataire K on E.consignataire=K.id_consignataire '#13+
                             ' INNER JOIN navire N on E.navire=N.id_navire '#13+
                             ' LEFT JOIN type_navire P on N.type_navire= P.id_type_nav '#13+
                             ' INNER JOIN type_facture T on F.type_facture=T.id_type_fact '#13+
                             ' ) AS L WHERE L.id_factures_pal IS NOT NULL ';

                      query_sum := init_query_sum + filter_periode_em  + filter_consign_fact + filter_consign_nav + filter_CatFact + filter_TypeFact + filter_periode_ech + filter_navire + filter_TypeNav +filter_compl +group_filter + order_sum;
                      ExQuery(DM.QSum, query_sum);
//                            DM.QSum.Close;
//                            DM.QSum.SQL.Clear;
//                            DM.QSum.SQL.Text := query_sum;
//                            DM.QSum.sql.SaveToFile('D:\Nowtof.sql');
//                            DM.QSum.Open;

                      //SUMMARY DATA
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('sum_lib_title')).Text := lib_sum ;
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('sum_lib_data')).Text := data_sum ;
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('sum_lib_data')).Text := '[frxDBDataset_sum."cons_fact"]' ;
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('sum_nb_data')).Text := '[frxDBDataset_sum."nb_fact"]' ;
                      FEtatsFacturePal.frxReport.Pages[1].Visible := True ;


                      //SUMMARY CRITERIA
                      //MAIN REPORT CRITERIA
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_sum')).Text :=title_report ;
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_typefact_sum')).Text :=title_TypeFact ;
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_typenav_sum')).Text :=title_typeNav ;
                      TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_complement_sum')).Text :=title_compl ;
               end;


         begin
            //MAIN REPORT CRITERIA
            TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_report')).Text :=title_report ;
            TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_typefact')).Text :=title_TypeFact ;
            TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_typenav')).Text :=title_typeNav ;
            TfrxMemoView(FEtatsFacturePal.frxReport.FindObject('title_complement')).Text :=title_compl ;

            //EXECUTE QUERY AND PREVEIW
            query_print:= init_query_etat_fact_PAL + filter_periode_em  + filter_consign_fact + filter_consign_nav + filter_CatFact + filter_TypeFact + filter_periode_ech + filter_navire + filter_TypeNav +filter_compl + filter_statut + order_group;
            FReport.DataAndShowReport(DM.QPrint, query_print, FEtatsFacturePal.frxDBDataset, FEtatsFacturePal.frxReport, FEtatsFacturePal.frxPDFExport, FReport.URLFrame, 'Etat_Facture');
           end;

      end;

end;

end.

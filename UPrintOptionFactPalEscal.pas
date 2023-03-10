unit UPrintOptionFactPalEscal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniButton, uniMultiItem, uniComboBox,
  uniGUIBaseClasses, uniGroupBox, uniPanel, uniBasicGrid, uniDBGrid,
  uniLabel, uniDateTimePicker, uniDBComboBox, uniDBLookupComboBox, uniRadioGroup, uniStatusBar,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TFPrintOptionFactPALEscale = class(TUniForm)
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

function FPrintOptionFactPALEscale: TFPrintOptionFactPALEscale;

var
   query_print, group_filter, group_select, group_by : string;
    query_sum,  init_query_sum, order_sum, lib_sum, data_sum: string;
    query_group, init_query_group, data_group, filter_group, order_group , title_group: string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UPrintOptionFactPal, UEtatsFacturePal_Escale, UGlobal, ULoadData, UReport,
  Main;

function FPrintOptionFactPALEscale: TFPrintOptionFactPALEscale;
begin
  Result := TFPrintOptionFactPALEscale(DM.GetFormInstance(TFPrintOptionFactPALEscale));
end;

procedure TFPrintOptionFactPALEscale.BtnValidatClick(Sender: TObject);
begin
if ((FEtatsFacturePalEscale.DBGrid.DataSource.DataSet.RecordCount=0) OR (query.IsEmpty = True)) then
          begin
              MessageDlg('Aucune Donn?e ? Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
    begin
          group_by := ' GROUP BY L.id_factures_pal ' ;

          if CBGroup.ItemIndex = -1 then
              begin
//               MAKE GROUPHEAD INVISIBLE
                 TfrxGroupHeader(FEtatsFacturePalEscale.frxReport.FindObject('GroupHeader')).Visible :=false;
                 TfrxGroupHeader(FEtatsFacturePalEscale.frxReport.FindObject('GroupFooter')).Visible :=false;
                 TfrxGroupHeader(FEtatsFacturePalEscale.frxReport.FindObject('GroupHeader')).Condition :='frxDBDataset."id_factures_pal"';
                 TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('line')).Text :='[Line#]';
                 order_group := '';
              end

          else
              begin


                   case CBGroup.ItemIndex of
                        0 : begin
                              data_group := 'frxDBDataset."cons_fact"' ;
                              order_group :=  ' ORDER BY L.cons_fact '  ;
                              title_group := '[frxDBDataset."cons_fact"]';
                            end;

                        1: begin
                              data_group := 'frxDBDataset."libelle_cat_fact"' ;
                              order_group :=  ' ORDER BY libelle_cat_fact  '  ;
                              title_group := '[frxDBDataset."libelle_cat_fact"]';
                            end;

                        2: begin
                              data_group := 'frxDBDataset."libelle_type_fact"' ;
                              order_group :=  ' ORDER BY libelle_type_fact  '  ;
                              title_group := '[frxDBDataset."libelle_type_fact"]';
                            end;

                        3 : begin
                              data_group := 'frxDBDataset."statut_fact"'  ;
                              order_group :=  ' ORDER BY statut_fact '  ;
                              title_group := '[frxDBDataset."statut_fact"]';
                            end;

                        4 : begin
                              data_group := 'frxDBDataset."type_nav_real"'  ;
                              order_group :=  ' ORDER BY type_nav_real '  ;
                              title_group := '[frxDBDataset."type_nav_real"]';
                            end;

                        5 : begin
                              data_group := 'frxDBDataset."complement_statut"'  ;
                              order_group :=  ' ORDER BY complement_statut '  ;
                              title_group := '[frxDBDataset."complement_statut"]';
                            end;
                    end;

                   //MAKE VISIBLE GROUP HEADER AND FOOTER
                   TfrxGroupHeader(FEtatsFacturePalEscale.frxReport.FindObject('GroupHeader')).Visible :=True;
                   TfrxGroupHeader(FEtatsFacturePalEscale.frxReport.FindObject('GroupFooter')).Visible :=True;

                   //GROUP DATA
                   TfrxGroupHeader(FEtatsFacturePalEscale.frxReport.FindObject('GroupHeader')).Condition :=data_group;
                   TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_group')).Text :=title_group ;
                   TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('line')).Text :='[Line]';
              end ;

            if CBSummary.Text = '' then
                begin
                FEtatsFacturePalEscale.frxReport.Pages[1].Visible := False
                end
            else
               begin
                  case CBSummary.ItemIndex of
                    0 : begin
                          group_select := ' cons_fact ' ;
                          group_filter := ' GROUP BY cons_fact ' ;
                          lib_sum := 'CONSIGNATAIRE' ;
                          data_sum := '[frxDBDataset_sum."cons_fact"]'
                        end;

                    1 : begin
                          group_select := ' libelle_type_fact ' ;
                          group_filter := ' GROUP BY libelle_type_fact ' ;
                          lib_sum := 'TYPE DE FACTURE';
                          data_sum := '[frxDBDataset_sum."libelle_type_fact"]'
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

                      order_sum := ' order by  mt_fact desc  ' ;

                      query_sum := init_query_fact_PAL_sum + filter_periode_em  + filter_consign_fact + filter_consign_nav + filter_CatFact + filter_TypeFact + filter_periode_ech + filter_navire + filter_TypeNav +filter_compl +group_filter + order_sum;
                      query_sum := format(query_sum, [group_select]);

                      ExQuery(DM.QSum, query_sum);

                      //SUMMARY DATA
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('sum_lib_title')).Text := lib_sum ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('sum_lib_data')).Text := data_sum ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('sum_nb_data')).Text := '[frxDBDataset_sum."nb_fact"]' ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('sum_montant_fact_data')).Text := '[frxDBDataset_sum."mt_fact"]' ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('sum_montant_regle_data')).Text := '[frxDBDataset_sum."mt_regle"]' ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('sum_montant_solde_data')).Text := '[frxDBDataset_sum."mt_solde"]' ;
                      FEtatsFacturePalEscale.frxReport.Pages[1].Visible := True ;


                      //SUMMARY CRITERIA
                      //MAIN REPORT CRITERIA
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_sum')).Text :=title_report ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_typefact_sum')).Text :=title_TypeFact ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_typenav_sum')).Text :=title_typeNav ;
                      TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_complement_sum')).Text :=title_compl ;
               end;


         begin
            //MAIN REPORT CRITERIA
            TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_report')).Text :=title_report ;
            TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_typefact')).Text :=title_TypeFact ;
            TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_typenav')).Text :=title_typeNav ;
            TfrxMemoView(FEtatsFacturePalEscale.frxReport.FindObject('title_complement')).Text :=title_compl ;

            //EXECUTE QUERY AND PREVEIW
//            DM.QPrint.Close;
//            DM.QPrint.SQL.Clear;
//            DM.QPrint.SQL.Text := query_print;
//            DM.QPrint.sql.SaveToFile('D:\queryFact.sql');
//            DM.QPrint.Open;

            query_print:= init_query_fact_PAL + filter_periode_em  + filter_consign_fact + filter_consign_nav + filter_CatFact + filter_TypeFact + filter_periode_ech + filter_navire + filter_TypeNav +filter_compl + filter_statut + group_by + order_group;



            FReport.DataAndShowReport(DM.QPrint, query_print, FEtatsFacturePalEscale.frxDBDataset, FEtatsFacturePalEscale.frxReport, FEtatsFacturePalEscale.frxPDFExport, FReport.URLFrame, 'Etat_Factures');
           end;

end;
end;

end.

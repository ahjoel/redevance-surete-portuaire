unit UPrintOptionRadeReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGroupBox, uniPanel, uniBasicGrid, uniDBGrid,
  uniGUIBaseClasses, uniLabel, uniDateTimePicker, uniMultiItem, uniComboBox,
  uniDBComboBox, uniDBLookupComboBox, uniRadioGroup, uniButton, uniStatusBar,
  frxClass, frxExportBaseDialog, frxExportPDF, frxDBSet;

type
  TFPrintOptionRadeReport = class(TUniForm)
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

function FPrintOptionRadeReport: TFPrintOptionRadeReport;
var
    query_print, group_filter, group_select : string;
    query_sum,  init_query_sum, order_sum, lib_sum, data_sum: string;
    query_group, init_query_group, data_group, filter_group, order_group , title_group: string;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, UEtatsRade, UFunction, UProject_Function,
  UGlobal, ULoadData, UReport;

function FPrintOptionRadeReport: TFPrintOptionRadeReport;
begin
  Result := TFPrintOptionRadeReport(DM.GetFormInstance(TFPrintOptionRadeReport));
end;

procedure TFPrintOptionRadeReport.BtnValidatClick(Sender: TObject);
begin

    if ((FEtatsRade.DBGrid.DataSource.DataSet.RecordCount=0) OR (query.IsEmpty = True)) then
          begin
              MessageDlg('Aucune Donn�e � Imprimer',mtWarning,[mbok]);
              Abort;
          end
    else
    begin
          if CBGroup.ItemIndex = 0 then
              begin
//                 MAKE GROUPHEAD INVISIBLE
               TfrxGroupHeader(FEtatsRade.frxReport.FindObject('GroupHeader')).Visible :=false;
               TfrxGroupHeader(FEtatsRade.frxReport.FindObject('GroupHeader')).Condition :='frxDBDataset."id"';
               TfrxMemoView(FEtatsRade.frxReport.FindObject('line')).Text :='[Line#]';
               order_group := '';
              end

          else
            begin
                 TfrxGroupHeader(FEtatsRade.frxReport.FindObject('GroupHeader')).Visible :=True;

                 case CBGroup.ItemIndex of
                      1 : begin
                            data_group := 'frxDBDataset."consignataire"' ;
                            filter_group := ' GROUP BY consignataire ' ;
                            order_group :=  ' ORDER BY R.consignataire '  ;
                            title_group := '[frxDBDataset."nom_consignataire"]';
                          end;

                      2 : begin
                            data_group := 'frxDBDataset."libelle_type_nav"' ;
                            filter_group := ' GROUP BY N.type_navire ' ;
                            order_group :=  ' ORDER BY N.type_navire  '  ;
                            title_group := '[frxDBDataset."libelle_type_nav"]';
                          end;

                      3 : begin
                            data_group := 'frxDBDataset."fact_pal"'  ;
                            filter_group := ' GROUP BY fact_pal ' ;
                            order_group :=  ' ORDER BY fact_pal '  ;
                            title_group := '[frxDBDataset."fact_pal"]';
                          end;

                      4 : begin
                            data_group := 'frxDBDataset."fact_int"'  ;
                            filter_group := ' GROUP BY fact_int ' ;
                            order_group :=  ' ORDER BY fact_int '  ;
                            title_group := '[frxDBDataset."fact_int"]';
                          end;
                  end;

                 //GROUP DATA
                 TfrxGroupHeader(FEtatsRade.frxReport.FindObject('GroupHeader')).Condition :=data_group;
                 TfrxMemoView(FEtatsRade.frxReport.FindObject('title_group')).Text :=title_group ;
                 TfrxMemoView(FEtatsRade.frxReport.FindObject('line')).Text :='[Line]';
            end ;


            if CBSummary.ItemIndex = 0 then
                  FEtatsRade.frxReport.Pages[1].Visible := False
            else
               begin

                     case CBSummary.ItemIndex of
                        1 : begin
                              group_select := ' C.nom_consignataire ' ;
                              group_filter := ' GROUP BY R.consignataire ' ;
                              lib_sum := 'CONSIGNATAIRE' ;
                              data_sum := '[frxDBDataset_sum."nom_consignataire"]'
                            end;

                        2 : begin
                              group_select := ' T.libelle_type_nav ' ;
                              group_filter := ' GROUP BY N.type_navire ' ;
                              lib_sum := 'TYPE DE NAVIRE';
                              data_sum := '[frxDBDataset_sum."libelle_type_nav"]'
                            end;

                        3 : begin
                              group_select := ' case WHEN facturer_pal = "" THEN "NON"  ELSE "OUI"	end as fact_pal ' ;
                              group_filter := ' GROUP BY fact_pal ' ;
                              lib_sum := 'FACTUR� PAL' ;
                              data_sum := '[frxDBDataset_sum."fact_pal"]'
                            end;

                        4 : begin
                              group_select := ' case WHEN facturer_int = "" THEN "NON"  ELSE "OUI"	end as fact_int ' ;
                              group_filter := ' GROUP BY fact_int ' ;
                              lib_sum := 'FACTUR� INTERNE'  ;
                              data_sum := '[frxDBDataset_sum."fact_int"]'
                            end;
                    end;

                      order_sum := ' order by  nb_rade desc  ' ;
                      init_query_sum:= 'SELECT ' + group_select +  ', COUNT(R.id) as nb_rade '#13+
                             ' FROM rade R   '#13+
                             'INNER JOIN user as us on R. user_create=us.id_user  '#13+
                             'LEFT JOIN user as uc on R.user_control=uc.id_user '#13+
                             'LEFT JOIN user as uv on R.user_validate=uv.id_user  '#13+
                             'INNER JOIN consignataire C on R.consignataire=C.id_consignataire  '#13+
                             'INNER JOIN navire  N on R.navire=N.id_navire '#13+
                             'INNER JOIN exercice Z on R.exercice=Z.id_exercice  '#13+
                             'INNER JOIN taux_rade X on R.taux_rade=X.id_taux_rade '#13+
                             'LEFT JOIN type_navire T on N.type_navire=T.id_type_nav '#13+
                             ' WHERE R.id is not null';

                      query_sum := init_query_sum + filter_periode +  filter_consign + filter_TypeNave + filter_navire  +filter_fact_pal + filter_fact_int +group_filter+ order_sum;
                      ExQuery(DM.QSum, query_sum);

                      //SUMMARY DATA
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('sum_lib_title')).Text := lib_sum ;
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('sum_lib_data')).Text := data_sum ;
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('sum_nb_data')).Text := '[frxDBDataset_sum."nb_rade"]' ;
                      FEtatsRade.frxReport.Pages[1].Visible := True ;


                      //SUMMARY CRITERIA
                      //MAIN REPORT CRITERIA
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('title_sum')).Text :=title_report ;
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('title_typeNav_sum')).Text :=title_typeNav ;
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('title_navire_sum')).Text :=title_navire ;
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('title_factPAL_sum')).Text :=title_factPAL ;
                      TfrxMemoView(FEtatsRade.frxReport.FindObject('title_factInt_sum')).Text :=title_factInt ;
               end;


               begin
                  //MAIN REPORT CRITERIA
                  TfrxMemoView(FEtatsRade.frxReport.FindObject('title_report')).Text :=title_report ;
                  TfrxMemoView(FEtatsRade.frxReport.FindObject('title_typeNav')).Text :=title_typeNav ;
                  TfrxMemoView(FEtatsRade.frxReport.FindObject('title_navire')).Text :=title_navire ;
                  TfrxMemoView(FEtatsRade.frxReport.FindObject('title_factPAL')).Text :=title_factPAL ;
                  TfrxMemoView(FEtatsRade.frxReport.FindObject('title_factInt')).Text :=title_factInt ;

                  //EXECUTE QUERY AND PREVEIW
                  query_print:= init_query + filter_periode  + filter_consign + filter_TypeNave + filter_navire+filter_fact_pal + filter_fact_int+ order_group;
                  FReport.DataAndShowReport(DM.QPrint, query_print, FEtatsRade.frxDBDataset, FEtatsRade.frxReport, FEtatsRade.frxPDFExport, FReport.URLFrame, 'Etat_Rade');
                 end;

      end;


end;

end.

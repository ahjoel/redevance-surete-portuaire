object FRapportEscale: TFRapportEscale
  Left = 0
  Top = 0
  ClientHeight = 721
  ClientWidth = 1303
  Caption = 'Rapports Escale'
  OnShow = UniFormShow
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1303
    Height = 721
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -129
    ExplicitWidth = 1432
    ExplicitHeight = 700
    object PanOp: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 28
      Width = 1297
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 1426
      object BtnDel: TUniButton
        AlignWithMargins = True
        Left = 1215
        Top = 4
        Width = 78
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Supprimer'
        Align = alRight
        TabOrder = 1
        IconCls = 'delete'
        ExplicitLeft = 1344
      end
      object BtnUpdate: TUniButton
        AlignWithMargins = True
        Left = 1134
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Modifier'
        Align = alRight
        TabOrder = 2
        IconCls = 'compose'
        ExplicitLeft = 1263
      end
      object BtnAdd: TUniButton
        AlignWithMargins = True
        Left = 891
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Ajouter'
        Align = alRight
        TabOrder = 3
        IconCls = 'add'
        OnClick = BtnAddClick
        ExplicitLeft = 1020
      end
      object EdSearch: TUniEdit
        Left = 83
        Top = 5
        Width = 225
        Hint = 'Recherche ...'
        ShowHint = True
        ParentShowHint = False
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 4
      end
      object UniLabel1: TUniLabel
        Left = 10
        Top = 10
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'Recherche :'
        TabOrder = 5
      end
      object BtnValidate: TUniButton
        AlignWithMargins = True
        Left = 1053
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Valider'
        Align = alRight
        TabOrder = 6
        IconCls = 'check'
        ExplicitLeft = 1182
      end
      object BtnControl: TUniButton
        AlignWithMargins = True
        Left = 972
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Controler'
        Align = alRight
        TabOrder = 7
        IconCls = 'check2'
        ExplicitLeft = 1101
      end
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 64
      Width = 1303
      Height = 657
      Hint = ''
      DataSource = DM.DS_DQ_Grid_RapEsc
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 2
      Columns = <
        item
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          ReadOnly = True
        end
        item
          FieldName = 'date'
          Title.Alignment = taCenter
          Title.Caption = 'Date'
          Title.Font.Style = [fsBold]
          Width = 87
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 206
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'num_port'
          Title.Alignment = taCenter
          Title.Caption = 'N'#176' Escale PAL'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'num_voyage'
          Title.Alignment = taCenter
          Title.Caption = 'N'#176' Voyage'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'num_atp'
          Title.Alignment = taCenter
          Title.Caption = 'N'#176' ATP'
          Title.Font.Style = [fsBold]
          Width = 104
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'nom_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire'
          Title.Font.Style = [fsBold]
          Width = 182
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_accost'
          Title.Alignment = taCenter
          Title.Caption = 'Accostage'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_depart'
          Title.Alignment = taCenter
          Title.Caption = 'Depart'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'statut'
          Title.Alignment = taCenter
          Title.Caption = 'Statut'
          Title.Font.Style = [fsBold]
          Width = 49
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_pq'
          Title.Alignment = taCenter
          Title.Caption = ' Poste'
          Title.Font.Style = [fsBold]
          Width = 46
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'orgine'
          Title.Alignment = taCenter
          Title.Caption = ' Provenance'
          Title.Font.Style = [fsBold]
          Width = 91
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'destination'
          Title.Alignment = taCenter
          Title.Caption = ' Destination'
          Title.Font.Style = [fsBold]
          Width = 84
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'control'
          Title.Alignment = taCenter
          Title.Caption = 'C'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'validation'
          Title.Alignment = taCenter
          Title.Caption = 'V'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fact_int'
          Title.Alignment = taCenter
          Title.Caption = ' FI'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fact_pal'
          Title.Alignment = taCenter
          Title.Caption = ' FP'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1303
      Height = 25
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      ExplicitWidth = 1432
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1268
        Height = 25
        Hint = ''
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Style = [fsBold]
        TabOrder = 1
        BorderStyle = ubsNone
        Alignment = taLeftJustify
        Title = 'Escales'
        Caption = 'Rapports Escale'
        Color = clSkyBlue
        Layout = 'column'
        ExplicitWidth = 1397
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 35
        Height = 25
        Hint = ''
        Align = alLeft
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        Color = clSkyBlue
      end
    end
  end
end

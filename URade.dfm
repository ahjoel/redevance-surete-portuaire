object FRade: TFRade
  Left = 0
  Top = 0
  ClientHeight = 763
  ClientWidth = 1359
  Caption = 'Rades'
  OnShow = UniFormShow
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1359
    Height = 763
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 769
    object PanOp: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 28
      Width = 1353
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object BtnDel: TUniButton
        AlignWithMargins = True
        Left = 1271
        Top = 4
        Width = 78
        Height = 25
        Hint = ''
        Caption = 'Supprimer'
        Align = alRight
        TabOrder = 1
        IconCls = 'delete'
      end
      object BtnUpdate: TUniButton
        AlignWithMargins = True
        Left = 1190
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Modifier'
        Align = alRight
        TabOrder = 2
        IconCls = 'compose'
        OnClick = BtnUpdateClick
      end
      object BtnAdd: TUniButton
        AlignWithMargins = True
        Left = 947
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Ajouter'
        Align = alRight
        TabOrder = 3
        IconCls = 'add'
        OnClick = BtnAddClick
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
        OnChange = EdSearchChange
      end
      object UniLabel1: TUniLabel
        Left = 10
        Top = 12
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'Recherche :'
        TabOrder = 5
      end
      object BtnValidate: TUniButton
        AlignWithMargins = True
        Left = 1109
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Valider'
        Align = alRight
        TabOrder = 6
        IconCls = 'check'
        OnClick = BtnValidateClick
      end
      object BtnControl: TUniButton
        AlignWithMargins = True
        Left = 1028
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Controler'
        Align = alRight
        TabOrder = 7
        IconCls = 'check2'
        OnClick = BtnControlClick
      end
      object UniButton1: TUniButton
        AlignWithMargins = True
        Left = 866
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Rades Test'
        Align = alRight
        TabOrder = 8
        OnClick = UniButton1Click
        ExplicitTop = 5
      end
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 64
      Width = 1359
      Height = 699
      Hint = ''
      DataSource = DM.DS_Grid_Rade
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow, dgRowNumbers]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 2
      OnSelectionChange = DBGridSelectionChange
      OnDrawColumnCell = DBGridDrawColumnCell
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'ref_ex'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Int'
          Title.Font.Style = [fsBold]
          Width = 96
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 238
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
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
          Title.Font.Style = [fsBold]
          Width = 45
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'debut'
          Title.Alignment = taCenter
          Title.Caption = ' Debut'
          Title.Font.Style = [fsBold]
          Width = 95
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fin'
          Title.Alignment = taCenter
          Title.Caption = 'Fin'
          Title.Font.Style = [fsBold]
          Width = 95
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'sejour'
          Title.Alignment = taCenter
          Title.Caption = 'Nb Jours'
          Title.Font.Style = [fsBold]
          Width = 55
        end
        item
          FieldName = 'nombre_jour_taux_rade'
          Title.Alignment = taCenter
          Title.Caption = 'Base'
          Title.Font.Style = [fsBold]
          Width = 47
        end
        item
          FieldName = 'qte'
          Title.Alignment = taCenter
          Title.Caption = ' Qte'
          Title.Font.Style = [fsBold]
          Width = 44
        end
        item
          FieldName = 'control'
          Title.Alignment = taCenter
          Title.Caption = ' C'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'validation'
          Title.Alignment = taCenter
          Title.Caption = 'V'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fact_int'
          Title.Alignment = taCenter
          Title.Caption = ' FI'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fact_pal'
          Title.Alignment = taCenter
          Title.Caption = ' FP'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1359
      Height = 25
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1220
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
        Caption = 'Rades'
        Color = clSkyBlue
        Layout = 'column'
      end
      object UniPanel2: TUniPanel
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
      object PanRowCount: TUniPanel
        Left = 1255
        Top = 0
        Width = 104
        Height = 25
        Hint = ''
        Align = alRight
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        TabOrder = 3
        BorderStyle = ubsNone
        Alignment = taRightJustify
        Caption = ''
        Color = clSkyBlue
      end
    end
  end
end
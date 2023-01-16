object FReglements: TFReglements
  Left = 0
  Top = 0
  ClientHeight = 628
  ClientWidth = 1339
  Caption = 'R'#233'glements'
  OnShow = UniFormShow
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1339
    Height = 628
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object PanOp: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 28
      Width = 1333
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object BtnDel: TUniButton
        AlignWithMargins = True
        Left = 1251
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
        Left = 1170
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
        Left = 927
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
        Left = 1089
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
        Left = 1008
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
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 64
      Width = 1339
      Height = 564
      Hint = ''
      DataSource = DM.DS_Grid_Reglement
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
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
          FieldName = 'id_regle'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_regle'
          Title.Alignment = taCenter
          Title.Caption = 'Date Reg.'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'ref_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = 'Facture'
          Title.Font.Style = [fsBold]
          Width = 113
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_fact'
          Title.Alignment = taCenter
          Title.Caption = 'Type Fact.'
          Title.Font.Style = [fsBold]
          Width = 86
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_emise_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = ' Date Fact.'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'montant_xof'
          Title.Alignment = taCenter
          Title.Caption = 'Mt Fact.'
          Title.Font.Style = [fsBold]
          Width = 90
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'montant_regle'
          Title.Alignment = taCenter
          Title.Caption = 'Mt Regl'#233
          Title.Font.Style = [fsBold]
          Width = 90
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 200
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = ' Type Nav.'
          Title.Font.Style = [fsBold]
          Width = 66
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_reg'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire Reg.'
          Title.Font.Style = [fsBold]
          Width = 180
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_fact'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire Fact.'
          Title.Font.Style = [fsBold]
          Width = 180
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
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
          FieldName = 'st_reg'
          Title.Alignment = taCenter
          Title.Caption = ' St'
          Title.Font.Style = [fsBold]
          Width = 28
          Alignment = taCenter
        end>
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1339
      Height = 25
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 3
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1200
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
        Caption = 'R'#233'glements'
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
        Left = 1235
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

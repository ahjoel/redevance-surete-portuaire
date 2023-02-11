object FConsignataire: TFConsignataire
  Left = 0
  Top = 0
  ClientHeight = 564
  ClientWidth = 930
  Caption = 'Consignataire'
  OnShow = UniFormShow
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMaximize]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 930
    Height = 564
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 930
      Height = 29
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      Title = 'Escales'
      Caption = 'Consignataire'
      Color = clWhite
      Layout = 'column'
    end
    object PanOp: TUniPanel
      Left = 0
      Top = 29
      Width = 930
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      object BtnDel: TUniButton
        AlignWithMargins = True
        Left = 848
        Top = 4
        Width = 78
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Supprimer'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 1
        IconCls = 'delete'
      end
      object BtnUpdate: TUniButton
        AlignWithMargins = True
        Left = 767
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
        Left = 686
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
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 62
      Width = 930
      Height = 463
      Hint = ''
      DataSource = DM.DS_Grid_Consignataire
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow, dgRowNumbers]
      ReadOnly = True
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 3
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'nom_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Nom'
          Title.Font.Style = [fsBold]
          Width = 273
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Style = [fsBold]
          Width = 66
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'contact_consignataire'
          Title.Alignment = taCenter
          Title.Caption = ' Contacts'
          Title.Font.Style = [fsBold]
          Width = 111
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'email_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Email'
          Title.Font.Style = [fsBold]
          Width = 182
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'adresse_consignataire'
          Title.Alignment = taCenter
          Title.Caption = ' Adresse'
          Title.Font.Style = [fsBold]
          Width = 271
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
    object UniContainerPanel2: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 528
      Width = 924
      Height = 33
      Hint = ''
      ParentColor = False
      Color = clInfoBk
      Align = alBottom
      TabOrder = 4
      object BtnExport: TUniButton
        AlignWithMargins = True
        Left = 765
        Top = 3
        Width = 75
        Height = 27
        Hint = ''
        Caption = 'Exporter'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 1
        IconCls = 'action'
      end
      object BtnPrint: TUniButton
        AlignWithMargins = True
        Left = 846
        Top = 3
        Width = 75
        Height = 27
        Hint = ''
        Caption = 'Imprimer'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 2
        IconCls = 'print'
      end
      object PanRowCount: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 27
        Hint = ''
        Align = alLeft
        ParentFont = False
        Font.Color = clRed
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
        Caption = ''
        Color = clInfoBk
      end
    end
  end
end

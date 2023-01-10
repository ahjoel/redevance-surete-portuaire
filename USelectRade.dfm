object FSelectRade: TFSelectRade
  Left = 0
  Top = 0
  ClientHeight = 273
  ClientWidth = 739
  Caption = 'Selection Rade'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 739
    Height = 273
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 28
      Width = 739
      Height = 245
      Hint = ''
      DataSource = DM.DS_Grid_Rade
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 1
      OnDblClick = DBGridDblClick
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
          FieldName = 'ref'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Int'
          Title.Font.Style = [fsBold]
          Width = 80
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 193
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
          FieldName = 'debut'
          Title.Alignment = taCenter
          Title.Caption = ' Debut'
          Title.Font.Style = [fsBold]
          Width = 75
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fin'
          Title.Alignment = taCenter
          Title.Caption = 'Fin'
          Title.Font.Style = [fsBold]
          Width = 75
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'sejour'
          Title.Alignment = taCenter
          Title.Caption = 'NbJ'
          Title.Font.Style = [fsBold]
          Width = 35
        end
        item
          FieldName = 'nombre_jour_taux_rade'
          Title.Alignment = taCenter
          Title.Caption = 'Base'
          Title.Font.Style = [fsBold]
          Width = 35
        end
        item
          FieldName = 'qte'
          Title.Alignment = taCenter
          Title.Caption = ' Qte'
          Title.Font.Style = [fsBold]
          Width = 35
        end>
    end
    object EdSearch: TUniEdit
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 733
      Hint = 'Recherche ...'
      ShowHint = True
      ParentShowHint = False
      CharCase = ecUpperCase
      BorderStyle = ubsFrameLowered
      Text = ''
      Align = alTop
      TabOrder = 2
      EmptyText = 'Rechercher ...'
      OnChange = EdSearchChange
    end
  end
end

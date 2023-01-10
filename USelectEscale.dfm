object FSelectEscale: TFSelectEscale
  Left = 0
  Top = 0
  ClientHeight = 304
  ClientWidth = 786
  Caption = 'Liste Escale'
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
    Width = 786
    Height = 304
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object PanOp: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 780
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      object EdSearch: TUniEdit
        Left = 83
        Top = 5
        Width = 438
        Hint = 'Recherche ...'
        ShowHint = True
        ParentShowHint = False
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
        OnChange = EdSearchChange
      end
      object UniLabel1: TUniLabel
        Left = 10
        Top = 10
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'Recherche :'
        TabOrder = 2
      end
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 39
      Width = 786
      Height = 265
      Hint = ''
      DataSource = DM.DS_Grid_Escale
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 2
      OnDblClick = DBGridDblClick
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
          FieldName = 'ref'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Int'
          Title.Font.Style = [fsBold]
          Width = 60
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'num_port'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Port'
          Title.Font.Style = [fsBold]
          Width = 60
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
          Width = 181
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
          Title.Font.Style = [fsBold]
          Width = 40
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
          ShowToolTipAlways = False
          FieldName = 'nom_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire'
          Title.Font.Style = [fsBold]
          Width = 164
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_accost'
          Title.Alignment = taCenter
          Title.Caption = 'Accostage'
          Title.Font.Style = [fsBold]
          Width = 82
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_pq'
          Title.Alignment = taCenter
          Title.Caption = ' Poste'
          Title.Font.Style = [fsBold]
          Width = 43
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
          FieldName = 'rapport_esc'
          Title.Alignment = taCenter
          Title.Caption = ' R'
          Title.Font.Style = [fsBold]
          Width = 30
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'commentaire_control'
          Title.Alignment = taCenter
          Title.Caption = 'commentaire_control'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'commentaire_validate'
          Title.Alignment = taCenter
          Title.Caption = 'commentaire_validate'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'rapport_control'
          Title.Caption = 'rapport_control'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'rapport_validate'
          Title.Caption = 'rapport_validate'
          Width = 64
          Visible = False
        end>
    end
  end
end

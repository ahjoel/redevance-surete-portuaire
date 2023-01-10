object FTypeNavire: TFTypeNavire
  Left = 0
  Top = 0
  ClientHeight = 313
  ClientWidth = 455
  Caption = 'Types Navire'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 455
    Height = 313
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 362
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 455
      Height = 27
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      Title = 'Escales'
      Caption = 'Types Navire'
      Color = clWhite
      Layout = 'column'
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 27
      Width = 455
      Height = 59
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      object EdCode: TUniEdit
        Left = 275
        Top = 26
        Width = 78
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object EdLibelle: TUniEdit
        Left = 44
        Top = 26
        Width = 197
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 2
      end
      object UniLabel1: TUniLabel
        Left = 275
        Top = 7
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Code'
        TabOrder = 3
      end
      object UniLabel2: TUniLabel
        Left = 44
        Top = 7
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Libell'#233
        TabOrder = 4
      end
      object UniSimplePanel1: TUniSimplePanel
        AlignWithMargins = True
        Left = 368
        Top = 4
        Width = 83
        Height = 51
        Hint = ''
        ParentColor = False
        Align = alRight
        TabOrder = 5
        ExplicitLeft = 371
        ExplicitTop = 1
        ExplicitHeight = 65
        object BtnSave: TUniButton
          Left = 0
          Top = 0
          Width = 83
          Height = 25
          Hint = ''
          Caption = 'Enregistrer'
          Align = alTop
          TabOrder = 1
          IconCls = 'bookmarks'
          OnClick = BtnSaveClick
        end
        object BtnCancel: TUniButton
          Left = 0
          Top = 26
          Width = 83
          Height = 25
          Hint = ''
          Caption = 'Annuler'
          Align = alBottom
          TabOrder = 2
          IconCls = 'delete'
          OnClick = BtnCancelClick
          ExplicitTop = 40
        end
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 86
      Width = 44
      Height = 227
      Hint = ''
      Align = alLeft
      TabOrder = 3
      Caption = ''
      ExplicitTop = 94
      ExplicitHeight = 268
      object BtnAdd: TUniButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 36
        Height = 30
        Hint = 'Ajouter'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Ajouter'
        Align = alTop
        TabOrder = 1
        IconAlign = iaTop
        IconCls = 'add'
        OnClick = BtnAddClick
      end
      object BtnUpdate: TUniButton
        AlignWithMargins = True
        Left = 4
        Top = 40
        Width = 36
        Height = 30
        Hint = 'Modifier'
        ShowHint = True
        ParentShowHint = False
        Caption = 'Modifier'
        Align = alTop
        TabOrder = 2
        IconAlign = iaTop
        IconCls = 'compose'
        OnClick = BtnUpdateClick
      end
      object BtnDelete: TUniButton
        AlignWithMargins = True
        Left = 4
        Top = 76
        Width = 36
        Height = 30
        Hint = 'Supprimer'
        Enabled = False
        ShowHint = True
        ParentShowHint = False
        Caption = 'Supprimer'
        Align = alTop
        TabOrder = 3
        IconAlign = iaTop
        IconCls = 'trash'
        OnClick = BtnDeleteClick
      end
    end
    object DBGrid: TUniDBGrid
      Left = 44
      Top = 86
      Width = 411
      Height = 227
      Hint = ''
      DataSource = DM.DS_Grid_TypeNav
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 4
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'libelle_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Libell'#233
          Title.Font.Style = [fsBold]
          Width = 257
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Style = [fsBold]
          Width = 99
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
end

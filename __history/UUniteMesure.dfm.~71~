object FUniteMesure: TFUniteMesure
  Left = 0
  Top = 0
  ClientHeight = 309
  ClientWidth = 612
  Caption = 'Unit'#233' Mesure'
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
    Width = 612
    Height = 309
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 612
      Height = 22
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      Title = 'Escales'
      Caption = 'Unit'#233' Mesure'
      Color = clWhite
      Layout = 'column'
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 22
      Width = 612
      Height = 67
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      object BtnSave: TUniButton
        AlignWithMargins = True
        Left = 527
        Top = 3
        Width = 80
        Height = 25
        Hint = ''
        Caption = 'Enregistrer'
        TabOrder = 3
        IconCls = 'bookmarks'
        OnClick = BtnSaveClick
      end
      object BtnCancel: TUniButton
        AlignWithMargins = True
        Left = 527
        Top = 36
        Width = 80
        Height = 25
        Hint = ''
        Caption = 'Annuler'
        TabOrder = 4
        IconCls = 'delete'
        OnClick = BtnCancelClick
      end
      object EdCode: TUniEdit
        Left = 19
        Top = 31
        Width = 121
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object EdDesc: TUniEdit
        Left = 240
        Top = 31
        Width = 241
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 2
      end
      object UniLabel1: TUniLabel
        Left = 19
        Top = 12
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Code'
        TabOrder = 5
      end
      object UniLabel2: TUniLabel
        Left = 240
        Top = 12
        Width = 53
        Height = 13
        Hint = ''
        Caption = 'Description'
        TabOrder = 6
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 89
      Width = 44
      Height = 220
      Hint = ''
      Align = alLeft
      TabOrder = 3
      Caption = ''
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
      Top = 89
      Width = 568
      Height = 220
      Hint = ''
      DataSource = DM.DS_Grid_UM
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 4
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id_unite'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'code_unite'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Style = [fsBold]
          Width = 148
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'description_unite'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Style = [fsBold]
          Width = 355
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
end

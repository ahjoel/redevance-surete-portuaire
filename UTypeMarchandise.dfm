object FTypeMarchandise: TFTypeMarchandise
  Left = 0
  Top = 0
  ClientHeight = 461
  ClientWidth = 799
  Caption = 'Types Marchandises'
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
    Width = 799
    Height = 461
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 192
    ExplicitTop = 152
    ExplicitWidth = 256
    ExplicitHeight = 128
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 799
      Height = 27
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      Title = 'Escales'
      Caption = 'Types Marchandise'
      Color = clWhite
      Layout = 'column'
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 27
      Width = 799
      Height = 67
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      object EdCode: TUniEdit
        Left = 19
        Top = 31
        Width = 121
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object EdLibelle: TUniEdit
        Left = 184
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
        TabOrder = 4
      end
      object UniLabel2: TUniLabel
        Left = 184
        Top = 12
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Libell'#233
        TabOrder = 5
      end
      object UniLabel3: TUniLabel
        Left = 473
        Top = 12
        Width = 63
        Height = 13
        Hint = ''
        Caption = 'Unit'#233' Mesure'
        TabOrder = 6
      end
      object DBLUnite: TUniDBLookupComboBox
        Left = 473
        Top = 31
        Width = 200
        Hint = ''
        ListField = 'description_unite'
        ListSource = DM.DS_DBL_UM
        KeyField = 'id_unite'
        ListFieldIndex = 0
        ClearButton = True
        TabOrder = 3
        Color = clWindow
      end
      object BtnCancel: TUniButton
        Left = 716
        Top = 36
        Width = 80
        Height = 25
        Hint = ''
        Caption = 'Annuler'
        TabOrder = 7
        IconCls = 'delete'
        OnClick = BtnCancelClick
      end
      object BtnSave: TUniButton
        Left = 716
        Top = 4
        Width = 81
        Height = 25
        Hint = ''
        Caption = 'Enregistrer'
        TabOrder = 8
        IconCls = 'bookmarks'
        OnClick = BtnSaveClick
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 94
      Width = 44
      Height = 367
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
      Top = 94
      Width = 755
      Height = 367
      Hint = ''
      DataSource = DM.DS_Grid_TM
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 4
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id_type_march'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'libelle_type_march'
          Title.Alignment = taCenter
          Title.Caption = 'Libell'#233
          Title.Font.Style = [fsBold]
          Width = 371
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_march'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Style = [fsBold]
          Width = 144
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'description_unite'
          Title.Alignment = taCenter
          Title.Caption = 'Unit'#233
          Title.Font.Style = [fsBold]
          Width = 156
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
end

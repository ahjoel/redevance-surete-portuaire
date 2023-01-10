object FExercice: TFExercice
  Left = 0
  Top = 0
  ClientHeight = 272
  ClientWidth = 503
  Caption = 'Exercices'
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
    Width = 503
    Height = 272
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 599
    ExplicitHeight = 360
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 503
      Height = 27
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      Title = 'Escales'
      Caption = 'Exercices'
      Color = clWhite
      Layout = 'column'
      ExplicitWidth = 599
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 27
      Width = 503
      Height = 45
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 599
      object EdLibelle: TUniEdit
        Left = 53
        Top = 11
        Width = 109
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 12
        Top = 16
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Libell'#233
        TabOrder = 2
      end
      object BtnCancel: TUniButton
        Left = 412
        Top = 8
        Width = 81
        Height = 25
        Hint = ''
        Caption = 'Annuler'
        TabOrder = 3
        IconCls = 'delete'
        OnClick = BtnCancelClick
      end
      object BtnSave: TUniButton
        Left = 321
        Top = 8
        Width = 81
        Height = 25
        Hint = ''
        Caption = 'Enregistrer'
        TabOrder = 4
        IconCls = 'bookmarks'
        OnClick = BtnSaveClick
      end
      object RadActif: TUniRadioGroup
        Left = 191
        Top = 0
        Width = 106
        Height = 40
        Hint = ''
        Items.Strings = (
          'Oui'
          'Non')
        Caption = 'Actif'
        TabOrder = 5
        Columns = 2
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 72
      Width = 44
      Height = 200
      Hint = ''
      Align = alLeft
      TabOrder = 3
      Caption = ''
      ExplicitTop = 79
      ExplicitHeight = 281
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
      end
    end
    object DBGrid: TUniDBGrid
      Left = 44
      Top = 72
      Width = 459
      Height = 200
      Hint = ''
      DataSource = DM.DS_Grid_Exo
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
          FieldName = 'id_exercice'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'libelle_exercice'
          Title.Alignment = taCenter
          Title.Caption = 'Libell'#233
          Title.Font.Style = [fsBold]
          Width = 192
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'statut'
          Title.Alignment = taCenter
          Title.Caption = 'Actif'
          Title.Font.Style = [fsBold]
          Width = 160
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
end

object FExercice: TFExercice
  Left = 0
  Top = 0
  ClientHeight = 229
  ClientWidth = 323
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
    Width = 323
    Height = 229
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 503
    ExplicitHeight = 272
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 323
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
      ExplicitWidth = 503
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 27
      Width = 323
      Height = 60
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 394
      object EdLibelle: TUniEdit
        Left = 15
        Top = 23
        Width = 82
        Hint = ''
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 15
        Top = 7
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Libell'#233
        TabOrder = 2
      end
      object RadActif: TUniRadioGroup
        Left = 113
        Top = 6
        Width = 106
        Height = 41
        Hint = ''
        Items.Strings = (
          'Oui'
          'Non')
        Caption = 'Actif'
        TabOrder = 3
        Columns = 2
      end
      object UniSimplePanel1: TUniSimplePanel
        AlignWithMargins = True
        Left = 238
        Top = 4
        Width = 81
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alRight
        TabOrder = 4
        ExplicitLeft = 312
        ExplicitTop = 1
        ExplicitHeight = 58
        object BtnSave: TUniButton
          Left = 0
          Top = 0
          Width = 81
          Height = 25
          Hint = ''
          Caption = 'Enregistrer'
          Align = alTop
          TabOrder = 1
          IconCls = 'bookmarks'
          OnClick = BtnSaveClick
          ExplicitLeft = 13
          ExplicitTop = 8
        end
        object BtnCancel: TUniButton
          Left = 0
          Top = 27
          Width = 81
          Height = 25
          Hint = ''
          Caption = 'Annuler'
          Align = alBottom
          TabOrder = 2
          IconCls = 'delete'
          OnClick = BtnCancelClick
          ExplicitLeft = 13
          ExplicitTop = 8
        end
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 87
      Width = 44
      Height = 142
      Hint = ''
      Align = alLeft
      TabOrder = 3
      Caption = ''
      ExplicitTop = 72
      ExplicitHeight = 200
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
      Top = 87
      Width = 279
      Height = 142
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
          Width = 108
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'statut'
          Title.Alignment = taCenter
          Title.Caption = 'Actif'
          Title.Font.Style = [fsBold]
          Width = 111
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
end

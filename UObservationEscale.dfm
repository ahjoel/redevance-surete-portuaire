object FObservationEscale: TFObservationEscale
  Left = 0
  Top = 0
  ClientHeight = 341
  ClientWidth = 560
  Caption = 'Observations Escale'
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
    Width = 560
    Height = 341
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 599
    ExplicitHeight = 360
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 560
      Height = 27
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 1
      Title = 'Escales'
      Caption = 'Observations Escale'
      Color = clWhite
      Layout = 'column'
      ExplicitWidth = 535
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 27
      Width = 560
      Height = 60
      Hint = ''
      Align = alTop
      TabOrder = 2
      Caption = ''
      object EdLibelle: TUniEdit
        Left = 12
        Top = 25
        Width = 189
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 50
        Text = ''
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 12
        Top = 6
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Libell'#233
        TabOrder = 4
      end
      object RadStatut: TUniRadioGroup
        Left = 353
        Top = 8
        Width = 106
        Height = 40
        Hint = ''
        Items.Strings = (
          'Oui'
          'Non')
        Caption = 'Facturable'
        TabOrder = 3
        Columns = 2
      end
      object UniSimplePanel1: TUniSimplePanel
        AlignWithMargins = True
        Left = 471
        Top = 4
        Width = 85
        Height = 52
        Hint = ''
        ParentColor = False
        Align = alRight
        TabOrder = 5
        object BtnSave: TUniButton
          Left = 0
          Top = 0
          Width = 85
          Height = 25
          Hint = ''
          Caption = 'Enregistrer'
          Align = alTop
          TabOrder = 1
          IconCls = 'bookmarks'
          OnClick = BtnSaveClick
          ExplicitLeft = -6
          ExplicitTop = 2
        end
        object BtnCancel: TUniButton
          Left = 0
          Top = 27
          Width = 85
          Height = 25
          Hint = ''
          Caption = 'Annuler'
          Align = alBottom
          TabOrder = 2
          IconCls = 'delete'
          ExplicitLeft = 19
          ExplicitTop = 11
          ExplicitWidth = 81
        end
      end
      object EdCode: TUniEdit
        Left = 236
        Top = 25
        Width = 93
        Hint = ''
        CharCase = ecUpperCase
        MaxLength = 15
        Text = ''
        TabOrder = 2
      end
      object UniLabel1: TUniLabel
        Left = 236
        Top = 6
        Width = 25
        Height = 13
        Hint = ''
        Caption = 'Code'
        TabOrder = 6
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 87
      Width = 44
      Height = 254
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
      Width = 516
      Height = 254
      Hint = ''
      DataSource = DM.DS_Grid_Obs
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
          FieldName = 'id_obs'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'libelle_obs'
          Title.Alignment = taCenter
          Title.Caption = 'Libell'#233
          Title.Font.Style = [fsBold]
          Width = 281
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_obs'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Style = [fsBold]
          Width = 111
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'statut'
          Title.Alignment = taCenter
          Title.Caption = 'Facturable'
          Title.Font.Style = [fsBold]
          Width = 87
        end>
    end
  end
end

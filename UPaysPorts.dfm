object FPaysPorts: TFPaysPorts
  Left = 0
  Top = 0
  ClientHeight = 380
  ClientWidth = 648
  Caption = 'Pays & Ports'
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
    Width = 648
    Height = 380
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -25
    ExplicitWidth = 644
    ExplicitHeight = 332
    object PInstaPort: TUniPageControl
      Left = 0
      Top = 0
      Width = 648
      Height = 380
      Hint = ''
      ActivePage = Pays
      Align = alClient
      TabOrder = 1
      object Pays: TUniTabSheet
        Hint = ''
        Caption = 'Pays'
        object UniContainerPanel3: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 640
          Height = 352
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniPanel3: TUniPanel
            Left = 0
            Top = 0
            Width = 640
            Height = 22
            Hint = ''
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
            Title = 'Escales'
            Caption = 'Pays'
            Color = clWhite
            Layout = 'column'
          end
          object UniPanel4: TUniPanel
            Left = 0
            Top = 22
            Width = 640
            Height = 67
            Hint = ''
            Align = alTop
            TabOrder = 2
            Caption = ''
            object BtSavePays: TUniButton
              AlignWithMargins = True
              Left = 551
              Top = 3
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Enregistrer'
              TabOrder = 3
              IconCls = 'bookmarks'
              OnClick = BtSavePaysClick
            end
            object BtCancelPays: TUniButton
              AlignWithMargins = True
              Left = 551
              Top = 34
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Annuler'
              TabOrder = 4
              IconCls = 'delete'
              OnClick = BtCancelPaysClick
            end
            object EdCodePays: TUniEdit
              Left = 379
              Top = 31
              Width = 121
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 2
            end
            object EdLibPays: TUniEdit
              Left = 44
              Top = 31
              Width = 293
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 1
            end
            object UniLabel3: TUniLabel
              Left = 379
              Top = 15
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'Code'
              TabOrder = 5
            end
            object UniLabel4: TUniLabel
              Left = 44
              Top = 12
              Width = 29
              Height = 13
              Hint = ''
              Caption = 'Libell'#233
              TabOrder = 6
            end
          end
          object UniPanel5: TUniPanel
            Left = 0
            Top = 89
            Width = 44
            Height = 263
            Hint = ''
            Align = alLeft
            TabOrder = 3
            Caption = ''
            object BtnAddPays: TUniButton
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
              OnClick = BtnAddPaysClick
            end
            object BtnUpdatePays: TUniButton
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
              OnClick = BtnUpdatePaysClick
            end
            object BtnDeletePays: TUniButton
              AlignWithMargins = True
              Left = 4
              Top = 76
              Width = 36
              Height = 30
              Hint = 'Supprimer'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Supprimer'
              Align = alTop
              TabOrder = 3
              IconAlign = iaTop
              IconCls = 'trash'
              OnClick = BtnDeletePaysClick
            end
          end
          object DBGridPays: TUniDBGrid
            Left = 44
            Top = 89
            Width = 596
            Height = 263
            Hint = ''
            DataSource = DM.DS_Grid_Pays
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            WebOptions.Paged = False
            LoadMask.Message = 'Loading data...'
            StripeRows = False
            Align = alClient
            TabOrder = 4
            OnRecordCount = DBGridPaysRecordCount
            Columns = <
              item
                FieldName = 'id_pays'
                Title.Alignment = taCenter
                Title.Caption = 'id'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'libelle_pays'
                Title.Alignment = taCenter
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 319
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_pays'
                Title.Alignment = taCenter
                Title.Caption = 'Code'
                Title.Font.Style = [fsBold]
                Width = 91
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
      end
      object Ports: TUniTabSheet
        Hint = ''
        Caption = 'Ports'
        OnBeforeActivate = PortsBeforeActivate
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 715
        ExplicitHeight = 469
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 640
          Height = 352
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object PanTitle: TUniPanel
            Left = 0
            Top = 0
            Width = 640
            Height = 22
            Hint = ''
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
            Title = 'Escales'
            Caption = 'Ports'
            Color = clWhite
            Layout = 'column'
          end
          object UniPanel1: TUniPanel
            Left = 0
            Top = 22
            Width = 640
            Height = 67
            Hint = ''
            Align = alTop
            TabOrder = 2
            Caption = ''
            ExplicitWidth = 715
            object BtnSavePort: TUniButton
              AlignWithMargins = True
              Left = 551
              Top = 3
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Enregistrer'
              TabOrder = 4
              IconCls = 'bookmarks'
              OnClick = BtnSavePortClick
            end
            object BtnCancelPort: TUniButton
              AlignWithMargins = True
              Left = 551
              Top = 35
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Annuler'
              TabOrder = 5
              IconCls = 'delete'
              OnClick = BtnCancelPortClick
            end
            object EdCodePort: TUniEdit
              Left = 227
              Top = 31
              Width = 78
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 2
            end
            object EdLibPort: TUniEdit
              Left = 16
              Top = 31
              Width = 169
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 1
            end
            object UniLabel1: TUniLabel
              Left = 228
              Top = 12
              Width = 25
              Height = 13
              Hint = ''
              Caption = 'Code'
              TabOrder = 6
            end
            object UniLabel2: TUniLabel
              Left = 16
              Top = 12
              Width = 29
              Height = 13
              Hint = ''
              Caption = 'Libelle'
              TabOrder = 7
            end
            object DBLPays: TUniDBLookupComboBox
              Left = 343
              Top = 31
              Width = 202
              Hint = ''
              ListField = 'libelle_pays'
              ListSource = DM.DS_DBL_Pays
              KeyField = 'id_pays'
              ListFieldIndex = 0
              ClearButton = True
              TabOrder = 3
              Color = clWindow
              Style = csDropDown
            end
            object UniLabel5: TUniLabel
              Left = 343
              Top = 12
              Width = 23
              Height = 13
              Hint = ''
              Caption = 'Pays'
              TabOrder = 8
            end
          end
          object UniPanel2: TUniPanel
            Left = 0
            Top = 89
            Width = 44
            Height = 263
            Hint = ''
            Align = alLeft
            TabOrder = 3
            Caption = ''
            object BtnAddPort: TUniButton
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
              OnClick = BtnAddPortClick
            end
            object BtnUpdatePort: TUniButton
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
              OnClick = BtnUpdatePortClick
            end
            object BtnDeletePort: TUniButton
              AlignWithMargins = True
              Left = 4
              Top = 76
              Width = 36
              Height = 30
              Hint = 'Supprimer'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Supprimer'
              Align = alTop
              TabOrder = 3
              IconAlign = iaTop
              IconCls = 'trash'
              OnClick = BtnDeletePortClick
            end
          end
          object DBGridPort: TUniDBGrid
            Left = 44
            Top = 89
            Width = 596
            Height = 263
            Hint = ''
            DataSource = DM.DS_Grid_Port
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            WebOptions.Paged = False
            LoadMask.Message = 'Loading data...'
            StripeRows = False
            Align = alClient
            TabOrder = 4
            OnRecordCount = DBGridPortRecordCount
            Columns = <
              item
                FieldName = 'id_port'
                Title.Alignment = taCenter
                Title.Caption = 'id'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'libelle_port'
                Title.Alignment = taCenter
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 244
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_port'
                Title.Alignment = taCenter
                Title.Caption = 'Code'
                Title.Font.Style = [fsBold]
                Width = 72
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                ShowToolTipAlways = False
                FieldName = 'libelle_pays'
                Title.Alignment = taCenter
                Title.Caption = 'Pays'
                Title.Font.Style = [fsBold]
                Width = 206
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
      end
    end
  end
end

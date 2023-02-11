object FAction: TFAction
  Left = 0
  Top = 0
  ClientHeight = 425
  ClientWidth = 710
  Caption = 'Mouvements'
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
    Width = 710
    Height = 425
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 248
    ExplicitTop = 80
    ExplicitWidth = 256
    ExplicitHeight = 128
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 0
      Width = 710
      Height = 425
      Hint = ''
      ActivePage = PageAction
      Align = alClient
      TabOrder = 1
      object PageAction: TUniTabSheet
        Hint = ''
        Caption = 'Mouvements'
        OnBeforeActivate = PageActionBeforeActivate
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 289
        ExplicitHeight = 193
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 702
          Height = 397
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object PanTitle: TUniPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 22
            Hint = ''
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
            Title = 'Escales'
            Caption = 'Mouvements'
            Color = clWhite
            Layout = 'column'
          end
          object UniPanel1: TUniPanel
            Left = 0
            Top = 22
            Width = 702
            Height = 67
            Hint = ''
            Align = alTop
            TabOrder = 2
            Caption = ''
            ExplicitWidth = 675
            object BtnSaveAct: TUniButton
              AlignWithMargins = True
              Left = 619
              Top = 3
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Enregistrer'
              TabOrder = 4
              IconCls = 'bookmarks'
              OnClick = BtnSaveActClick
            end
            object BtnCancelAct: TUniButton
              AlignWithMargins = True
              Left = 619
              Top = 36
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Annuler'
              TabOrder = 5
              IconCls = 'delete'
              OnClick = BtnCancelActClick
            end
            object EdCodeAct: TUniEdit
              Left = 306
              Top = 31
              Width = 78
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 2
            end
            object EdLibAct: TUniEdit
              Left = 16
              Top = 31
              Width = 241
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 1
            end
            object UniLabel1: TUniLabel
              Left = 307
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
            object DBLNatureAct: TUniDBLookupComboBox
              Left = 428
              Top = 31
              Width = 175
              Hint = ''
              ListField = 'libelle_nature'
              ListSource = DM.DS_DBL_Nat
              KeyField = 'id_nature'
              ListFieldIndex = 0
              ClearButton = True
              TabOrder = 3
              Color = clWindow
            end
            object UniLabel5: TUniLabel
              Left = 428
              Top = 12
              Width = 33
              Height = 13
              Hint = ''
              Caption = 'Nature'
              TabOrder = 8
            end
          end
          object UniPanel2: TUniPanel
            Left = 0
            Top = 89
            Width = 44
            Height = 308
            Hint = ''
            Align = alLeft
            TabOrder = 3
            Caption = ''
            object BtnAddAct: TUniButton
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
              OnClick = BtnAddActClick
            end
            object BtnUpdateAct: TUniButton
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
              OnClick = BtnUpdateActClick
            end
            object BtnDeleteAct: TUniButton
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
            end
          end
          object DBGridAction: TUniDBGrid
            Left = 44
            Top = 89
            Width = 658
            Height = 308
            Hint = ''
            DataSource = DM.DS_Grid_Action
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            WebOptions.Paged = False
            LoadMask.Message = 'Loading data...'
            StripeRows = False
            Align = alClient
            TabOrder = 4
            OnRecordCount = DBGridActionRecordCount
            Columns = <
              item
                FieldName = 'id_action'
                Title.Alignment = taCenter
                Title.Caption = 'id'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'libelle_action'
                Title.Alignment = taCenter
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 315
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_action'
                Title.Alignment = taCenter
                Title.Caption = 'Code'
                Title.Font.Style = [fsBold]
                Width = 102
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                ShowToolTipAlways = False
                FieldName = 'libelle_nature'
                Title.Alignment = taCenter
                Title.Caption = 'Nature'
                Title.Font.Style = [fsBold]
                Width = 206
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
      end
      object PageNature: TUniTabSheet
        Hint = ''
        Caption = 'Natures'
        object UniContainerPanel3: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 702
          Height = 397
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniPanel3: TUniPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 22
            Hint = ''
            Align = alTop
            ParentFont = False
            Font.Color = clBlack
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
            Title = 'Escales'
            Caption = 'Natures'
            Color = clWhite
            Layout = 'column'
          end
          object UniPanel4: TUniPanel
            Left = 0
            Top = 22
            Width = 702
            Height = 67
            Hint = ''
            Align = alTop
            TabOrder = 2
            Caption = ''
            object BtSaveNat: TUniButton
              AlignWithMargins = True
              Left = 618
              Top = 2
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Enregistrer'
              TabOrder = 3
              IconCls = 'bookmarks'
              OnClick = BtSaveNatClick
            end
            object BtCancelNat: TUniButton
              AlignWithMargins = True
              Left = 618
              Top = 35
              Width = 80
              Height = 25
              Hint = ''
              Caption = 'Annuler'
              TabOrder = 4
              IconCls = 'delete'
              OnClick = BtCancelNatClick
            end
            object EdCodeNat: TUniEdit
              Left = 379
              Top = 31
              Width = 121
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 2
            end
            object EdLibNat: TUniEdit
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
            Height = 308
            Hint = ''
            Align = alLeft
            TabOrder = 3
            Caption = ''
            object BtnAddNat: TUniButton
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
              OnClick = BtnAddNatClick
            end
            object BtnUpdateNat: TUniButton
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
              OnClick = BtnUpdateNatClick
            end
            object BtnDeleteNat: TUniButton
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
              OnClick = BtnDeleteNatClick
            end
          end
          object DBGridNature: TUniDBGrid
            Left = 44
            Top = 89
            Width = 658
            Height = 308
            Hint = ''
            DataSource = DM.Ds_Grid_Nature
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            WebOptions.Paged = False
            LoadMask.Message = 'Loading data...'
            StripeRows = False
            Align = alClient
            TabOrder = 4
            OnRecordCount = DBGridNatureRecordCount
            Columns = <
              item
                FieldName = 'id_nature'
                Title.Alignment = taCenter
                Title.Caption = 'id'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'libelle_nature'
                Title.Alignment = taCenter
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 355
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_nature'
                Title.Alignment = taCenter
                Title.Caption = 'Code'
                Title.Font.Style = [fsBold]
                Width = 148
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
      end
    end
  end
end

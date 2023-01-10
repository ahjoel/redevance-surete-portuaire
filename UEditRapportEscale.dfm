object FEditRapportEscale: TFEditRapportEscale
  Left = 0
  Top = 0
  ClientHeight = 425
  ClientWidth = 852
  Caption = 'Edition Rapport Escale'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMaximize]
  MonitoredKeys.Keys = <>
  OnCreate = UniFormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 852
    Height = 425
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1245
    ExplicitHeight = 466
    object PanOps: TUniPanel
      Left = 0
      Top = 389
      Width = 852
      Height = 36
      Hint = ''
      Align = alBottom
      TabOrder = 1
      Caption = ''
      object BtnCancel: TUniButton
        AlignWithMargins = True
        Left = 770
        Top = 4
        Width = 78
        Height = 28
        Hint = ''
        Caption = 'Annuler'
        Align = alRight
        TabOrder = 2
        IconCls = 'delete'
        OnClick = BtnCancelClick
      end
      object BtnSave: TUniButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 93
        Height = 28
        Hint = ''
        Caption = 'Enregistrer'
        Align = alLeft
        TabOrder = 1
        Default = True
        IconCls = 'bookmarks'
        OnClick = BtnSaveClick
      end
      object BtnRapport: TUniButton
        AlignWithMargins = True
        Left = 103
        Top = 4
        Width = 93
        Height = 28
        Hint = ''
        Visible = False
        Caption = 'Rapporter'
        Align = alLeft
        TabOrder = 3
        Default = True
        IconCls = 'warning_black'
      end
      object EdRapport: TUniEdit
        AlignWithMargins = True
        Left = 208
        Top = 7
        Width = 313
        Hint = ''
        Visible = False
        ShowHint = True
        ParentShowHint = False
        MaxLength = 255
        Text = ''
        TabOrder = 4
        EmptyText = 'Commentaire rapport'
      end
    end
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 852
      Height = 389
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = ''
      object UniSimplePanel5: TUniSimplePanel
        Left = 1
        Top = 1
        Width = 850
        Height = 90
        Hint = ''
        ParentColor = False
        Align = alTop
        TabOrder = 1
        object UniGroupBox1: TUniGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 844
          Height = 84
          Hint = ''
          Caption = 'Informations Accostage'
          Align = alClient
          ParentColor = False
          Color = clInfoBk
          TabOrder = 1
          object UniSimplePanel1: TUniSimplePanel
            Left = 741
            Top = 15
            Width = 101
            Height = 67
            Hint = ''
            ParentColor = False
            Align = alRight
            TabOrder = 1
            object BtnRechEscale: TUniButton
              Left = 0
              Top = 0
              Width = 101
              Height = 67
              Hint = ''
              Caption = 'Recherches Escale'
              Align = alClient
              TabOrder = 1
              IconAlign = iaBottom
              IconCls = 'search'
              OnClick = BtnRechEscaleClick
            end
          end
          object UniLabel4: TUniLabel
            Left = 16
            Top = 24
            Width = 40
            Height = 13
            Hint = ''
            Caption = 'Ref Port'
            TabOrder = 2
          end
          object UniLabel5: TUniLabel
            Left = 18
            Top = 59
            Width = 34
            Height = 13
            Hint = ''
            Caption = 'Ref Int'
            TabOrder = 3
          end
          object UniLabel6: TUniLabel
            Left = 171
            Top = 24
            Width = 31
            Height = 13
            Hint = ''
            Caption = 'Navire'
            TabOrder = 4
          end
          object UniLabel7: TUniLabel
            Left = 171
            Top = 59
            Width = 66
            Height = 13
            Hint = ''
            Caption = 'Consignataire'
            TabOrder = 5
          end
          object UniLabel8: TUniLabel
            Left = 535
            Top = 24
            Width = 27
            Height = 13
            Hint = ''
            Caption = 'Poste'
            TabOrder = 6
          end
          object UniLabel9: TUniLabel
            Left = 535
            Top = 59
            Width = 29
            Height = 13
            Hint = ''
            Caption = 'Arriv'#233
            TabOrder = 7
          end
          object EdRefPort: TUniEdit
            Left = 72
            Top = 20
            Width = 75
            Hint = ''
            Text = ''
            TabOrder = 8
            Color = clSkyBlue
            ReadOnly = True
          end
          object EdRefInt: TUniEdit
            Left = 72
            Top = 53
            Width = 75
            Hint = ''
            Text = ''
            TabOrder = 9
            Color = clSkyBlue
            ReadOnly = True
          end
          object EdNavire: TUniEdit
            Left = 257
            Top = 20
            Width = 250
            Hint = ''
            Text = ''
            TabOrder = 10
            Color = clSkyBlue
            ReadOnly = True
          end
          object EdConsignataire: TUniEdit
            Left = 257
            Top = 53
            Width = 250
            Hint = ''
            Text = ''
            TabOrder = 11
            Color = clSkyBlue
            ReadOnly = True
          end
          object EdPoste: TUniEdit
            Left = 578
            Top = 20
            Width = 80
            Hint = ''
            Text = ''
            TabOrder = 12
            Color = clSkyBlue
            ReadOnly = True
          end
          object EdArrive: TUniEdit
            Left = 578
            Top = 53
            Width = 80
            Hint = ''
            Text = ''
            TabOrder = 13
            Color = clSkyBlue
            ReadOnly = True
          end
        end
      end
      object UniSimplePanel6: TUniSimplePanel
        Left = 1
        Top = 142
        Width = 288
        Height = 246
        Hint = ''
        ParentColor = False
        Color = clCream
        Align = alLeft
        TabOrder = 2
        ExplicitTop = 97
        ExplicitHeight = 447
        object UniSimplePanelBtAddline: TUniSimplePanel
          Left = 0
          Top = 161
          Width = 288
          Height = 35
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 2
          object BtAddLine: TUniButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 282
            Height = 29
            Hint = 'Ajoute Ligne'
            ShowHint = True
            ParentShowHint = False
            Caption = 'Ajouter'
            Align = alClient
            ParentFont = False
            Font.Color = clGreen
            Font.Style = [fsBold]
            TabOrder = 1
            IconAlign = iaRight
            IconCls = 'right'
            OnClick = BtAddLineClick
          end
        end
        object UniSimplePanelselectline: TUniSimplePanel
          Left = 0
          Top = 0
          Width = 288
          Height = 161
          Hint = ''
          ParentColor = False
          Color = clCream
          Align = alTop
          TabOrder = 1
          object UniLabel1: TUniLabel
            Left = 3
            Top = 4
            Width = 60
            Height = 13
            Hint = ''
            Caption = 'Marchandise'
            TabOrder = 1
          end
          object DBLMarchandise: TUniDBLookupComboBox
            Left = 3
            Top = 23
            Width = 279
            Hint = ''
            ListField = 'libelle_marchandise'
            ListSource = DM.DS_DBL_March
            KeyField = 'id_marchandise'
            ListFieldIndex = 0
            ClearButton = True
            TabOrder = 2
            Color = clWindow
          end
          object UniLabel2: TUniLabel
            Left = 3
            Top = 56
            Width = 56
            Height = 13
            Hint = ''
            Caption = 'Mouvement'
            TabOrder = 3
          end
          object DBLAct: TUniDBLookupComboBox
            Left = 3
            Top = 75
            Width = 279
            Hint = ''
            ListField = 'libelle_action'
            ListSource = DM.DS_DBL_Act
            KeyField = 'id_action'
            ListFieldIndex = 0
            ClearButton = True
            TabOrder = 4
            Color = clWindow
          end
          object EdQte: TUniNumberEdit
            Left = 3
            Top = 124
            Width = 76
            Hint = ''
            MaxLength = 8
            Alignment = taRightJustify
            TabOrder = 5
            EmptyText = '0'
            BlankValue = 0
            DecimalSeparator = ','
          end
          object UniLabel3: TUniLabel
            Left = 3
            Top = 105
            Width = 42
            Height = 13
            Hint = ''
            Caption = 'Quantit'#233
            TabOrder = 6
          end
        end
        object UniSimplePanelbtdeleteLine: TUniSimplePanel
          Left = 0
          Top = 196
          Width = 288
          Height = 35
          Hint = ''
          ParentColor = False
          Align = alTop
          TabOrder = 3
          object BtDeleteLine: TUniButton
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 282
            Height = 29
            Hint = 'Retirer Ligne'
            Enabled = False
            ShowHint = True
            ParentShowHint = False
            Caption = 'Retirer'
            Align = alClient
            ParentFont = False
            Font.Color = clRed
            Font.Style = [fsBold]
            TabOrder = 1
            IconCls = 'left'
            OnClick = BtDeleteLineClick
          end
        end
      end
      object UniSimplePanel2: TUniSimplePanel
        Left = 289
        Top = 142
        Width = 562
        Height = 246
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 3
        object StringGridRapport: TUniStringGrid
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 556
          Height = 240
          Hint = ''
          FixedCols = 0
          RowCount = 2
          ColCount = 4
          Options = [goVertLine, goHorzLine, goRowSelect, goAlwaysShowEditor]
          Columns = <>
          HeaderTitleAlign = taCenter
          OnDrawCell = StringGridRapportDrawCell
          OnSelectCell = StringGridRapportSelectCell
          Align = alClient
          TabOrder = 1
        end
      end
      object UniSimplePanel3: TUniSimplePanel
        AlignWithMargins = True
        Left = 4
        Top = 94
        Width = 844
        Height = 45
        Hint = ''
        ParentColor = False
        Color = clMoneyGreen
        Align = alTop
        TabOrder = 4
        object UniLabel10: TUniLabel
          Left = 16
          Top = 20
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Date'
          TabOrder = 1
        end
        object EdDate: TUniDateTimePicker
          Left = 52
          Top = 14
          Width = 116
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object UniLabel11: TUniLabel
          Left = 244
          Top = 20
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'N'#176' ATP'
          TabOrder = 3
        end
        object EdNumATP: TUniEdit
          Left = 284
          Top = 14
          Width = 121
          Hint = ''
          Text = ''
          TabOrder = 4
        end
        object UniLabel12: TUniLabel
          Left = 470
          Top = 20
          Width = 51
          Height = 13
          Hint = ''
          Caption = 'N'#176' Voyage'
          TabOrder = 5
        end
        object EdNumVoyage: TUniEdit
          Left = 540
          Top = 14
          Width = 121
          Hint = ''
          Text = ''
          TabOrder = 6
        end
      end
    end
  end
end
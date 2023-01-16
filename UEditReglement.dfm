object FEditReglement: TFEditReglement
  Left = 0
  Top = 0
  ClientHeight = 303
  ClientWidth = 719
  Caption = 'Edition de R'#233'glement'
  OnShow = UniFormShow
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 719
    Height = 303
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -56
    ExplicitWidth = 721
    ExplicitHeight = 333
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 719
      Height = 303
      Hint = ''
      Align = alClient
      TabOrder = 1
      Caption = ''
      object Group_reg: TUniGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 199
        Width = 711
        Height = 55
        Hint = ''
        Caption = '  Infos R'#233'glement '
        Align = alClient
        TabOrder = 2
        ExplicitWidth = 713
        ExplicitHeight = 53
        object UniLabel11: TUniLabel
          Left = 12
          Top = 27
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Montant'
          TabOrder = 4
        end
        object UniLabel14: TUniLabel
          Left = 399
          Top = 27
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Consignataire'
          TabOrder = 5
        end
        object DBLConsignataire: TUniDBLookupComboBox
          Left = 483
          Top = 22
          Width = 215
          Hint = ''
          ListField = 'nom_consignataire'
          ListSource = DM.DS_DBL_Cons
          KeyField = 'id_consignataire'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 3
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel12: TUniLabel
          Left = 228
          Top = 27
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Date'
          TabOrder = 6
        end
        object EdDateReg: TUniDateTimePicker
          Left = 271
          Top = 22
          Width = 102
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object EdReg: TUniFormattedNumberEdit
          Left = 78
          Top = 22
          Width = 131
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 1
          EmptyText = '0'
          BlankValue = 0
          DecimalPrecision = 0
          DecimalSeparator = ','
          ThousandSeparator = #160
        end
      end
      object Group_infos: TUniGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 79
        Width = 711
        Height = 114
        Hint = ''
        Caption = '  Infos Facture   '
        Align = alTop
        ParentColor = False
        Color = 10469119
        TabOrder = 4
        object lbfact: TUniLabel
          Left = 13
          Top = 24
          Width = 37
          Height = 13
          Hint = ''
          Caption = 'Facture'
          TabOrder = 1
        end
        object EdFacture: TUniEdit
          Left = 78
          Top = 18
          Width = 228
          Hint = ''
          Text = ''
          TabOrder = 2
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel7: TUniLabel
          Left = 394
          Top = 24
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Consignataire'
          TabOrder = 3
        end
        object EdConsignataire: TUniEdit
          Left = 477
          Top = 18
          Width = 212
          Hint = ''
          Text = ''
          TabOrder = 4
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel4: TUniLabel
          Left = 13
          Top = 56
          Width = 48
          Height = 13
          Hint = ''
          Caption = 'Emmission'
          TabOrder = 5
        end
        object EdEmmissionFact: TUniEdit
          Left = 78
          Top = 51
          Width = 130
          Hint = ''
          Text = ''
          TabOrder = 6
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel5: TUniLabel
          Left = 257
          Top = 56
          Width = 46
          Height = 13
          Hint = ''
          Caption = 'Ech'#233'ance'
          TabOrder = 7
        end
        object EdEcheanceFact: TUniEdit
          Left = 330
          Top = 51
          Width = 130
          Hint = ''
          Text = ''
          TabOrder = 8
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel1: TUniLabel
          Left = 13
          Top = 89
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Montant'
          TabOrder = 9
        end
        object EdTypeFact: TUniEdit
          Left = 559
          Top = 51
          Width = 130
          Hint = ''
          Text = ''
          TabOrder = 10
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel9: TUniLabel
          Left = 502
          Top = 56
          Width = 24
          Height = 13
          Hint = ''
          Caption = 'Type'
          TabOrder = 11
        end
        object UniLabel2: TUniLabel
          Left = 257
          Top = 89
          Width = 27
          Height = 13
          Hint = ''
          Caption = 'R'#233'gl'#233
          TabOrder = 12
        end
        object EdMontantFact: TUniFormattedNumberEdit
          Left = 78
          Top = 84
          Width = 130
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 13
          Color = clSkyBlue
          ReadOnly = True
          EmptyText = '0'
          BlankValue = 0
          DecimalPrecision = 0
          DecimalSeparator = ','
          ThousandSeparator = #160
        end
        object UniLabel3: TUniLabel
          Left = 502
          Top = 89
          Width = 26
          Height = 13
          Hint = ''
          Caption = 'Solde'
          TabOrder = 14
        end
        object EdMontReg: TUniFormattedNumberEdit
          Left = 330
          Top = 84
          Width = 130
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 15
          Color = clSkyBlue
          ReadOnly = True
          EmptyText = '0'
          BlankValue = 0
          DecimalPrecision = 0
          DecimalSeparator = ','
          ThousandSeparator = #160
        end
        object EdMontSolde: TUniFormattedNumberEdit
          Left = 559
          Top = 84
          Width = 130
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 16
          Color = clSkyBlue
          ReadOnly = True
          EmptyText = '0'
          BlankValue = 0
          DecimalPrecision = 0
          DecimalSeparator = ','
          ThousandSeparator = #160
        end
      end
      object Group_rech: TUniGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 711
        Height = 69
        Hint = ''
        Caption = ' Recherche  '
        Align = alTop
        ParentColor = False
        Color = 8454143
        TabOrder = 1
        object BtnRechFact: TUniButton
          AlignWithMargins = True
          Left = 654
          Top = 18
          Width = 52
          Height = 46
          Hint = ''
          Caption = ''
          Align = alRight
          TabOrder = 2
          IconAlign = iaBottom
          IconCls = 'search'
          OnClick = BtnRechFactClick
        end
        object edRechDateEm: TUniDateTimePicker
          Left = 310
          Top = 36
          Width = 103
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object UniLabel17: TUniLabel
          Left = 310
          Top = 18
          Width = 74
          Height = 13
          Hint = ''
          Caption = 'Date Emmission'
          TabOrder = 4
        end
        object UniLabel15: TUniLabel
          Left = 12
          Top = 17
          Width = 77
          Height = 13
          Hint = ''
          Caption = 'Num'#233'ro Facture'
          TabOrder = 5
        end
        object EdRechNumFact: TUniEdit
          Left = 13
          Top = 36
          Width = 244
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          TabOrder = 0
        end
      end
      object PanOps: TUniPanel
        AlignWithMargins = True
        Left = 4
        Top = 260
        Width = 711
        Height = 39
        Hint = ''
        Align = alBottom
        TabOrder = 3
        Caption = ''
        object BtnCancel: TUniButton
          AlignWithMargins = True
          Left = 629
          Top = 4
          Width = 78
          Height = 31
          Hint = ''
          Caption = 'Annuler'
          Align = alRight
          TabOrder = 2
          IconCls = 'delete'
        end
        object BtnSave: TUniButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 93
          Height = 31
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
          Height = 31
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
          Top = 9
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
    end
  end
end

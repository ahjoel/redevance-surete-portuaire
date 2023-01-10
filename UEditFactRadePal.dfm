object FEditFactRadePal: TFEditFactRadePal
  Left = 0
  Top = 0
  ClientHeight = 333
  ClientWidth = 721
  Caption = 'Edition Facture Rade PAL'
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
    Width = 721
    Height = 333
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 1
    ExplicitWidth = 852
    ExplicitHeight = 425
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 721
      Height = 333
      Hint = ''
      Align = alClient
      TabOrder = 1
      Caption = ''
      object Group_fact: TUniGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 199
        Width = 713
        Height = 85
        Hint = ''
        Caption = '  Infos Facture  '
        Align = alTop
        TabOrder = 2
        ExplicitWidth = 782
        object EdDateEmis: TUniDateTimePicker
          Left = 78
          Top = 53
          Width = 114
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 4
        end
        object UniLabel10: TUniLabel
          Left = 13
          Top = 59
          Width = 51
          Height = 13
          Hint = ''
          Caption = 'Date Emis.'
          TabOrder = 7
        end
        object UniLabel11: TUniLabel
          Left = 12
          Top = 27
          Width = 52
          Height = 13
          Hint = ''
          Caption = 'N'#176' Facture'
          TabOrder = 8
        end
        object EdNumFact: TUniEdit
          Left = 78
          Top = 22
          Width = 114
          Hint = ''
          CharCase = ecUpperCase
          Text = ''
          TabOrder = 1
        end
        object UniLabel14: TUniLabel
          Left = 226
          Top = 27
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Consignataire'
          TabOrder = 9
        end
        object DBLConsignataire: TUniDBLookupComboBox
          Left = 301
          Top = 22
          Width = 194
          Hint = ''
          ListField = 'nom_consignataire'
          ListSource = DM.DS_DBL_Cons
          KeyField = 'id_consignataire'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 2
          Color = clWindow
          Style = csDropDown
        end
        object EdDateTrans: TUniDateTimePicker
          Left = 301
          Top = 53
          Width = 100
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 5
        end
        object UniLabel3: TUniLabel
          Left = 227
          Top = 59
          Width = 57
          Height = 13
          Hint = ''
          Caption = 'Date Trans.'
          TabOrder = 10
        end
        object UniLabel12: TUniLabel
          Left = 530
          Top = 27
          Width = 40
          Height = 13
          Hint = ''
          Caption = 'Montant'
          TabOrder = 11
        end
        object EdMontFact: TUniFormattedNumberEdit
          Left = 586
          Top = 22
          Width = 102
          Hint = ''
          Alignment = taRightJustify
          TabOrder = 3
          EmptyText = '0.00'
          BlankValue = 0
          DecimalSeparator = '.'
          ThousandSeparator = #160
        end
        object EdDateEch: TUniDateTimePicker
          Left = 586
          Top = 50
          Width = 102
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 6
        end
        object UniLabel13: TUniLabel
          Left = 530
          Top = 59
          Width = 47
          Height = 13
          Hint = ''
          Caption = 'Date Ech.'
          TabOrder = 12
        end
      end
      object Group_infos: TUniGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 79
        Width = 713
        Height = 114
        Hint = ''
        Caption = '  Infos Rade  '
        Align = alTop
        ParentColor = False
        Color = 10469119
        TabOrder = 3
        object UniLabel6: TUniLabel
          Left = 13
          Top = 24
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Navire'
          TabOrder = 1
        end
        object EdNavire: TUniEdit
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
          Left = 362
          Top = 24
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Consignataire'
          TabOrder = 3
        end
        object EdConsignataire: TUniEdit
          Left = 445
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
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Arriv'#233
          TabOrder = 5
        end
        object Edarrive: TUniEdit
          Left = 78
          Top = 51
          Width = 120
          Hint = ''
          Text = ''
          TabOrder = 6
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel8: TUniLabel
          Left = 256
          Top = 56
          Width = 33
          Height = 13
          Hint = ''
          Caption = 'Depart'
          TabOrder = 7
        end
        object Eddepart: TUniEdit
          Left = 310
          Top = 51
          Width = 120
          Hint = ''
          Text = ''
          TabOrder = 8
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel5: TUniLabel
          Left = 478
          Top = 56
          Width = 34
          Height = 13
          Hint = ''
          Caption = 'Ref Int'
          TabOrder = 9
        end
        object EdRefInt: TUniEdit
          Left = 537
          Top = 51
          Width = 120
          Hint = ''
          Text = ''
          TabOrder = 10
          Color = clSkyBlue
          ReadOnly = True
        end
        object EdQte: TUniEdit
          Left = 537
          Top = 84
          Width = 120
          Hint = ''
          Text = ''
          TabOrder = 11
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel2: TUniLabel
          Left = 478
          Top = 89
          Width = 18
          Height = 13
          Hint = ''
          Caption = 'Qt'#233
          TabOrder = 12
        end
        object EdBase: TUniEdit
          Left = 310
          Top = 84
          Width = 120
          Hint = ''
          Text = ''
          TabOrder = 13
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel1: TUniLabel
          Left = 256
          Top = 89
          Width = 23
          Height = 13
          Hint = ''
          Caption = 'Base'
          TabOrder = 14
        end
        object EdNbJours: TUniEdit
          Left = 78
          Top = 84
          Width = 120
          Hint = ''
          Text = ''
          TabOrder = 15
          Color = clSkyBlue
          ReadOnly = True
        end
        object UniLabel9: TUniLabel
          Left = 12
          Top = 89
          Width = 42
          Height = 13
          Hint = ''
          Caption = 'Nb Jours'
          TabOrder = 16
        end
      end
      object Group_rech: TUniGroupBox
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 713
        Height = 69
        Hint = ''
        Caption = ' Recherche  '
        Align = alTop
        ParentColor = False
        Color = 8454143
        TabOrder = 1
        ExplicitWidth = 835
        object BtnRechRade: TUniButton
          AlignWithMargins = True
          Left = 656
          Top = 18
          Width = 52
          Height = 46
          Hint = ''
          Caption = 'DM.DS_DBL_Cat_Fact'
          Align = alRight
          TabOrder = 3
          IconAlign = iaBottom
          IconCls = 'search'
          OnClick = BtnRechRadeClick
        end
        object edRechArrive: TUniDateTimePicker
          Left = 514
          Top = 36
          Width = 103
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
        object UniLabel17: TUniLabel
          Left = 514
          Top = 17
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Arriv'#233
          TabOrder = 5
        end
        object DBLRechCons: TUniDBLookupComboBox
          Left = 246
          Top = 36
          Width = 241
          Hint = ''
          ListField = 'nom_consignataire'
          ListSource = DM.DS_DBL_Cons
          KeyField = 'id_consignataire'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel16: TUniLabel
          Left = 246
          Top = 17
          Width = 66
          Height = 13
          Hint = ''
          Caption = 'Consignataire'
          TabOrder = 6
        end
        object DBLRechNavire: TUniDBLookupComboBox
          Left = 12
          Top = 36
          Width = 214
          Hint = ''
          ListField = 'nom_navire'
          ListSource = DM.DS_DBL_Navire
          KeyField = 'id_navire'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 0
          Color = clWindow
          Style = csDropDown
        end
        object UniLabel15: TUniLabel
          Left = 12
          Top = 17
          Width = 31
          Height = 13
          Hint = ''
          Caption = 'Navire'
          TabOrder = 7
        end
      end
      object PanOps: TUniPanel
        AlignWithMargins = True
        Left = 4
        Top = 293
        Width = 713
        Height = 36
        Hint = ''
        Align = alBottom
        TabOrder = 4
        Caption = ''
        object BtnCancel: TUniButton
          AlignWithMargins = True
          Left = 631
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
    end
  end
end

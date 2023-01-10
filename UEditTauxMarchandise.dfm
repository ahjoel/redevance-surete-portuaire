object FEditTauxMarchandise: TFEditTauxMarchandise
  Left = 0
  Top = 0
  ClientHeight = 150
  ClientWidth = 529
  Caption = 'Edit Taux Marchandise'
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
    Width = 529
    Height = 150
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 72
    ExplicitWidth = 256
    ExplicitHeight = 128
    object UniPanel1: TUniPanel
      Left = 0
      Top = 115
      Width = 529
      Height = 35
      Hint = ''
      Align = alBottom
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 599
      object BtnSave: TUniButton
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 93
        Height = 27
        Hint = ''
        Caption = 'Enregistrer'
        Align = alLeft
        TabOrder = 1
        Default = True
        IconCls = 'bookmarks'
        OnClick = BtnSaveClick
        ExplicitLeft = 3
        ExplicitTop = 3
      end
      object BtnCancel: TUniButton
        AlignWithMargins = True
        Left = 447
        Top = 4
        Width = 78
        Height = 27
        Hint = ''
        Caption = 'Annuler'
        Align = alRight
        TabOrder = 2
        IconCls = 'delete'
        ExplicitLeft = 517
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 0
      Width = 529
      Height = 115
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 599
      object DBLOperation: TUniDBLookupComboBox
        Left = 20
        Top = 33
        Width = 487
        Hint = ''
        ListField = 'libelle'
        ListSource = DM.DS_DBL_Ope
        KeyField = 'id_operation'
        ListFieldIndex = 0
        ClearButton = True
        TabOrder = 1
        Color = clWindow
      end
      object UniLabel3: TUniLabel
        Left = 20
        Top = 14
        Width = 48
        Height = 13
        Hint = ''
        Caption = 'Op'#233'ration'
        TabOrder = 2
      end
      object UniLabel4: TUniLabel
        Left = 216
        Top = 64
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Taux ('#8364')'
        TabOrder = 3
      end
      object EdMontantTauxMarch: TUniFormattedNumberEdit
        Left = 216
        Top = 83
        Width = 90
        Hint = ''
        Alignment = taRightJustify
        TabOrder = 4
        MaxValue = 9999999.000000000000000000
        BlankValue = 0
        DecimalUseOSDefault = True
        DecimalPrecision = 3
      end
      object EdDateDebutTauxMarch: TUniDateTimePicker
        Left = 20
        Top = 83
        Width = 115
        Hint = ''
        ParentShowHint = False
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 5
        EmptyText = '  /  /    '
      end
      object UniLabel1: TUniLabel
        Left = 20
        Top = 64
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Debut'
        TabOrder = 6
      end
      object LbFin: TUniLabel
        Left = 392
        Top = 64
        Width = 14
        Height = 13
        Hint = ''
        Caption = 'Fin'
        TabOrder = 7
      end
      object EdDateFinTauxMarch: TUniDateTimePicker
        Left = 392
        Top = 83
        Width = 115
        Hint = ''
        DateTime = 44811.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 8
        EmptyText = '  /  /    '
      end
    end
  end
end

object FEditTauxRade: TFEditTauxRade
  Left = 0
  Top = 0
  ClientHeight = 154
  ClientWidth = 469
  Caption = 'Edit Taux Rade'
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
    Width = 469
    Height = 154
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 470
    ExplicitHeight = 132
    object UniPanel1: TUniPanel
      Left = 0
      Top = 119
      Width = 469
      Height = 35
      Hint = ''
      Align = alBottom
      TabOrder = 1
      Caption = ''
      ExplicitTop = 97
      ExplicitWidth = 470
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
      end
      object BtnCancel: TUniButton
        AlignWithMargins = True
        Left = 387
        Top = 4
        Width = 78
        Height = 27
        Hint = ''
        Caption = 'Annuler'
        Align = alRight
        TabOrder = 2
        IconCls = 'delete'
        OnClick = BtnCancelClick
        ExplicitLeft = 388
      end
    end
    object UniPanel2: TUniPanel
      Left = 0
      Top = 0
      Width = 469
      Height = 119
      Hint = ''
      Align = alClient
      TabOrder = 2
      Caption = ''
      ExplicitWidth = 470
      ExplicitHeight = 97
      object UniLabel7: TUniLabel
        Left = 20
        Top = 20
        Width = 66
        Height = 13
        Hint = ''
        Caption = 'Nombre Jours'
        TabOrder = 1
      end
      object EdNbJours: TUniNumberEdit
        Left = 96
        Top = 13
        Width = 110
        Hint = ''
        MaxLength = 8
        Alignment = taRightJustify
        TabOrder = 2
        BlankValue = 0
        DecimalSeparator = ','
      end
      object UniLabel4: TUniLabel
        Left = 260
        Top = 15
        Width = 41
        Height = 13
        Hint = ''
        Caption = 'Taux ('#8364')'
        TabOrder = 3
      end
      object EdMontantTaux: TUniFormattedNumberEdit
        Left = 328
        Top = 13
        Width = 110
        Hint = ''
        Alignment = taRightJustify
        TabOrder = 4
        MaxValue = 9999999.000000000000000000
        BlankValue = 0
        DecimalUseOSDefault = True
        DecimalPrecision = 3
      end
      object EdDebut: TUniDateTimePicker
        Left = 96
        Top = 80
        Width = 110
        Hint = ''
        DateTime = 44799.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 6
        EmptyText = '  /  /    '
      end
      object UniLabel1: TUniLabel
        Left = 20
        Top = 87
        Width = 29
        Height = 13
        Hint = ''
        Caption = 'Debut'
        TabOrder = 7
      end
      object LbFin: TUniLabel
        Left = 260
        Top = 87
        Width = 14
        Height = 13
        Hint = ''
        Visible = False
        Caption = 'Fin'
        TabOrder = 8
      end
      object EdFin: TUniDateTimePicker
        Left = 328
        Top = 80
        Width = 110
        Hint = ''
        Visible = False
        DateTime = 44811.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 9
        EmptyText = '  /  /    '
      end
      object UniLabel2: TUniLabel
        Left = 20
        Top = 50
        Width = 64
        Height = 13
        Hint = ''
        Caption = 'Type Facture'
        TabOrder = 10
      end
      object DBLTypeFact: TUniDBLookupComboBox
        Left = 96
        Top = 46
        Width = 342
        Hint = ''
        ListField = 'libelle_type_fact'
        ListSource = DM.DS_DBL_TypeFact
        KeyField = 'id_type_fact'
        ListFieldIndex = 0
        ClearButton = True
        TabOrder = 5
        Color = clWindow
        Style = csDropDown
      end
    end
  end
end

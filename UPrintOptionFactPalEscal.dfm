object FPrintOptionFactPALEscale: TFPrintOptionFactPALEscale
  Left = 0
  Top = 0
  ClientHeight = 211
  ClientWidth = 384
  Caption = 'Options Impression Etat Facture PAL | Escale'
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object GBGroup: TUniGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 378
    Height = 84
    Hint = ''
    Caption = 'Groupage'
    Align = alTop
    TabOrder = 0
    object CBGroup: TUniComboBox
      AlignWithMargins = True
      Left = 13
      Top = 24
      Width = 348
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Consignataire'
        'Categorie Facture'
        'Type Facture'
        'Statut'
        'Type navire'
        'Compl'#233'ment')
      TabOrder = 1
      ClearButton = True
      IconItems = <>
    end
  end
  object GBSum: TUniGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 93
    Width = 378
    Height = 134
    Hint = ''
    Caption = 'Sommaire'
    Align = alTop
    TabOrder = 1
    ExplicitTop = 69
    ExplicitWidth = 373
    object CBSummary: TUniComboBox
      AlignWithMargins = True
      Left = 16
      Top = 24
      Width = 345
      Hint = ''
      Style = csDropDownList
      Text = ''
      Items.Strings = (
        'Consignataire'
        'Categorie Facture'
        'Type Facture'
        'Statut'
        'Type navire'
        'Compl'#233'ment')
      TabOrder = 1
      ClearButton = True
      IconItems = <>
    end
  end
  object BtnValidat: TUniButton
    Left = 159
    Top = 156
    Width = 90
    Height = 31
    Hint = ''
    Caption = 'Aper'#231'u'
    TabOrder = 2
    IconCls = 'print'
    OnClick = BtnValidatClick
  end
end

object FPrintOptionReglement: TFPrintOptionReglement
  Left = 0
  Top = 0
  ClientHeight = 172
  ClientWidth = 277
  Caption = 'Options Impression Etat R'#233'glement'
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 172
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    ExplicitWidth = 284
    ExplicitHeight = 173
    object GBGroup: TUniGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 269
      Height = 60
      Hint = ''
      Caption = 'Groupage'
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 276
      object CBGroup: TUniComboBox
        AlignWithMargins = True
        Left = 13
        Top = 24
        Width = 236
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Consignataire'
          'Cat'#233'gorie Facture'
          'Type Facture'
          'Type navire')
        TabOrder = 1
        ClearButton = True
        IconItems = <>
      end
    end
    object GBSum: TUniGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 70
      Width = 269
      Height = 60
      Hint = ''
      Caption = 'Sommaire'
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 276
      object CBSummary: TUniComboBox
        AlignWithMargins = True
        Left = 16
        Top = 24
        Width = 233
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          'Consignataire'
          'Cat'#233'gorie Facture'
          'Type Facture'
          'Type navire')
        TabOrder = 1
        ClearButton = True
        IconItems = <>
      end
    end
    object BtnValidat: TUniButton
      Left = 95
      Top = 136
      Width = 90
      Height = 31
      Hint = ''
      Caption = 'Aper'#231'u'
      TabOrder = 3
      IconCls = 'print'
      OnClick = BtnValidatClick
    end
  end
end

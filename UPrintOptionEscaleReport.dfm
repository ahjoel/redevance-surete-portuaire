object FPrintOptionEscaleReport: TFPrintOptionEscaleReport
  Left = 0
  Top = 0
  ClientHeight = 171
  ClientWidth = 294
  Caption = 'Options Impression Etat Rade'
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniPanel1: TUniPanel
    Left = 0
    Top = 0
    Width = 294
    Height = 171
    Hint = ''
    Align = alClient
    TabOrder = 0
    Caption = ''
    object GBGroup: TUniGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 286
      Height = 60
      Hint = ''
      Caption = 'Groupage'
      Align = alTop
      TabOrder = 1
      object CBGroup: TUniComboBox
        Left = 13
        Top = 24
        Width = 258
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          ''
          'Consignataire'
          'Type navire'
          'Inst. Port'
          'Poste Quai'
          'Observation'
          'Facturable'
          'Factur'#233' PAL'
          'Factur'#233' INT')
        TabOrder = 1
        IconItems = <>
      end
    end
    object GBSum: TUniGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 70
      Width = 286
      Height = 60
      Hint = ''
      Caption = 'Sommaire'
      Align = alTop
      TabOrder = 2
      object CBSummary: TUniComboBox
        Left = 16
        Top = 24
        Width = 255
        Hint = ''
        Style = csDropDownList
        Text = ''
        Items.Strings = (
          ''
          'Consignataire'
          'Type navire'
          'Inst. Port'
          'Poste Quai'
          'Observation'
          'Facturable'
          'Factur'#233' PAL'
          'Factur'#233' INT')
        TabOrder = 1
        IconItems = <>
      end
    end
    object BtnValidat: TUniButton
      Left = 114
      Top = 134
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

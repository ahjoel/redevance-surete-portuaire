object FFactInterne: TFFactInterne
  Left = 0
  Top = 0
  ClientHeight = 648
  ClientWidth = 1356
  Caption = 'Facture PAL Interne'
  WindowState = wsMaximized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1356
    Height = 648
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -238
    ExplicitTop = -97
    ExplicitWidth = 1386
    ExplicitHeight = 745
    object PanOp: TUniPanel
      AlignWithMargins = True
      Left = 3
      Top = 28
      Width = 1350
      Height = 33
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = ''
      ExplicitWidth = 1380
      object BtnDel: TUniButton
        AlignWithMargins = True
        Left = 1268
        Top = 4
        Width = 78
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Supprimer'
        Align = alRight
        TabOrder = 1
        IconCls = 'delete'
        ExplicitLeft = 1298
      end
      object BtnUpdate: TUniButton
        AlignWithMargins = True
        Left = 1187
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Modifier'
        Align = alRight
        TabOrder = 2
        IconCls = 'compose'
        ExplicitLeft = 1217
      end
      object EdSearch: TUniEdit
        Left = 83
        Top = 5
        Width = 225
        Hint = 'Recherche ...'
        ShowHint = True
        ParentShowHint = False
        CharCase = ecUpperCase
        Text = ''
        TabOrder = 3
      end
      object UniLabel1: TUniLabel
        Left = 10
        Top = 10
        Width = 58
        Height = 13
        Hint = ''
        Caption = 'Recherche :'
        TabOrder = 4
      end
      object BtnValidate: TUniButton
        AlignWithMargins = True
        Left = 1106
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Enabled = False
        Caption = 'Valider'
        Align = alRight
        TabOrder = 5
        IconCls = 'check'
        ExplicitLeft = 1136
      end
      object BtnControl: TUniButton
        AlignWithMargins = True
        Left = 1025
        Top = 4
        Width = 75
        Height = 25
        Hint = ''
        Caption = 'Controler'
        Align = alRight
        TabOrder = 6
        IconCls = 'check2'
        ExplicitLeft = 1055
      end
      object UniMenuButton1: TUniMenuButton
        AlignWithMargins = True
        Left = 939
        Top = 4
        Width = 80
        Height = 25
        Hint = ''
        DropdownMenu = PopupMenu_add
        Caption = 'Ajouter'
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
          84FF848484FF848484FF848484FF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
          94FFD4B494FFD4B494FFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
          94FFD4B494FFD4B494FFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
          94FFD4B494FFD4B494FFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFF848484FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFD4B494FFD4B494FFD4B494FFD4B494FFD4B494FFD4B4
          94FFD4B494FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF97A776FF97A776FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFF
          FFFFFFFFFFFFFFFFFFFF97A776FF97A776FFFFFFFF00FFFFFF00FFFFFF00FFFF
          FF00848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFF
          FFFF97A776FF97A776FF97A776FF97A776FF97A776FF97A776FFFFFFFF00FFFF
          FF00848484FFFFFFFFFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFF
          FFFF97A776FF97A776FF97A776FF97A776FF97A776FF97A776FFFFFFFF00FFFF
          FF00848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFF97A776FF97A776FF97A7760097A77600FFFFFF00FFFF
          FF00848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
          84FF848484FFFFFFFFFF97A776FF97A776FF97A7760097A77600}
        Align = alRight
        TabOrder = 7
        ExplicitLeft = 969
      end
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1356
      Height = 25
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 1386
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1321
        Height = 25
        Hint = ''
        Align = alClient
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -15
        Font.Style = [fsBold]
        TabOrder = 1
        BorderStyle = ubsNone
        Alignment = taLeftJustify
        Title = 'Escales'
        Caption = 'Factures Emises Interne'
        Color = clSkyBlue
        Layout = 'column'
        ExplicitWidth = 1351
        object PanRowCount: TUniPanel
          Left = 1217
          Top = 0
          Width = 104
          Height = 25
          Hint = ''
          Align = alRight
          ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          TabOrder = 1
          BorderStyle = ubsNone
          Alignment = taRightJustify
          Caption = ''
          Color = clSkyBlue
          ExplicitLeft = 1247
        end
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 35
        Height = 25
        Hint = ''
        Align = alLeft
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        Color = clSkyBlue
      end
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 64
      Width = 1356
      Height = 584
      Hint = ''
      DataSource = DM.DS_Grid_FactInterne
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow, dgRowNumbers]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 3
      Columns = <
        item
          FieldName = 'id_factures_pal'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'ref_fact'
          Title.Alignment = taCenter
          Title.Caption = 'N'#176' Facture'
          Title.Font.Style = [fsBold]
          Width = 110
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_emise_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = 'Emise'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_trans_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = 'Transmis'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_ech_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = 'Ech'#233'ance'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'ref_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Int'
          Title.Font.Style = [fsBold]
          Width = 70
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_fact'
          Title.Alignment = taCenter
          Title.Caption = ' Type'
          Title.Font.Style = [fsBold]
          Width = 95
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 160
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'cons_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Consign Nav.'
          Title.Font.Style = [fsBold]
          Width = 160
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_fact'
          Title.Alignment = taCenter
          Title.Caption = 'Consign Fact.'
          Title.Font.Style = [fsBold]
          Width = 160
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'montant_reel'
          Title.Alignment = taCenter
          Title.Caption = 'Mt R ('#8364')'
          Title.Font.Style = [fsBold]
          Width = 70
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'complement'
          Title.Alignment = taCenter
          Title.Caption = 'Compl.('#8364')'
          Title.Font.Style = [fsBold]
          Width = 70
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'montant'
          Title.Alignment = taCenter
          Title.Caption = 'Mt T ('#8364')'
          Title.Font.Style = [fsBold]
          Width = 70
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'montant_xof'
          Title.Alignment = taCenter
          Title.Caption = ' Mt T(XOF)'
          Title.Font.Style = [fsBold]
          Width = 100
          Alignment = taRightJustify
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'mont_regle'
          Title.Alignment = taCenter
          Title.Caption = 'Mt R'#233'gl'#233
          Title.Font.Style = [fsBold]
          Width = 100
          Alignment = taRightJustify
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'mont_solde'
          Title.Alignment = taCenter
          Title.Caption = 'Solde'
          Title.Font.Style = [fsBold]
          Width = 100
          Alignment = taRightJustify
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'control'
          Title.Alignment = taCenter
          Title.Caption = 'C'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'validation'
          Title.Alignment = taCenter
          Title.Caption = 'V'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'st_fact'
          Title.Caption = 'St'
          Title.Font.Style = [fsBold]
          Width = 31
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'commentaire_control'
          Title.Alignment = taCenter
          Title.Caption = 'commentaire_control'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'commentaire_validate'
          Title.Alignment = taCenter
          Title.Caption = 'commentaire_validate'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'rapport_control'
          Title.Caption = 'rapport_control'
          Width = 64
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'rapport_validate'
          Title.Caption = 'rapport_validate'
          Width = 64
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
  object PopupMenu_add: TUniPopupMenu
    Images = UniImageList1
    Left = 328
    Top = 416
    object E1: TUniMenuItem
      Caption = 'Escale'
      ImageIndex = 0
    end
    object R1: TUniMenuItem
      Caption = 'Rade'
      ImageIndex = 1
      OnClick = R1Click
    end
  end
  object UniImageList1: TUniImageList
    Left = 448
    Top = 296
    Bitmap = {
      494C010102000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      00000000000000000000000000000000000000000000000000003D3D3E575657
      5FA05A5B65AC5A5B65AC5A5B65AC5A5B65AC5A5B65AC5A5B65AC5A5B65AC5A5B
      65AC55565E9F3D3D3E5700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFF2F2F7FFF2F2F7FFF2F2F7FFF2F2F7FFF2F2F7FFF2F2F7FFF2F2F7FFF2F2
      F7FFB8B9C8FF70717AC200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFC6C7D6FFC1C2D2FFC4C5D5FFC1C2D2FFC2C3D3FFC0C1D2FFC1C2D2FFEBEB
      F1FFB8B9C8FF70717AC2000000000000000002020203323232453535354C3535
      354C3535354C3535354C3535354C3535354C3535354C3535354C3535354C3737
      374F3A3A3A562C2C2C3900000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFC5C6D6FF8A90B4FF848BB8FF8389B3FF828AB7FF8086AEFFBFC0D1FFEBEC
      F2FFB8B9C8FF70717AC200000000000000000F0F0F104E4C26F9ABA825FFABA8
      25FFABA825FFABA825FFABA825FFABA825FFABA825FFABA825FFABA825FFA9A4
      22FF968909FF635B0AFF21212128000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFEAEAF0FF7D92D7FF86A1F8FF86A1F8FF86A1F8FF8099EDFFC4C7DBFFF2F2
      F7FFB8B9C8FF70717AC20000000000000000000000012F2F3FE342415BFF4241
      5BFF42415BFF42415BFF42415BFF42415BFF42415BFF42415BFF4E4D6BFF6C6A
      96FF464341FF454236FF38384ECD000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFADB3D2FF85A0F6FF86A1F8FF86A1F8FF86A1F8FF86A1F8FF96A0CCFFF2F2
      F7FFB8B9C8FF70717AC200000000000000003E3E40693E3EC6F94949FEFF4949
      FEFF4949FEFF4949FEFF4949FEFF4949FEFF4949FEFF4949FEFF4949FEFF4949
      FEFF4444FCFF2727EEFF1E1E85F9151515180000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFB9BDD7FF7D8DC5FF7B90D7FF849FF5FF7992DDFF8997D0FF9097BEFFF2F2
      F7FFB8B9C8FF70717AC200000000000000002C2C46D53737B8FB3737B8FB3838
      B8FB3838B8FB3737B6FA3739B6FA373AB6FA3738B6FA3737B6FA3738B6FA373A
      B6FA393BBDFA3333F4FF2424E2FF393951B90000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFF2F2F7FFBABDCEFFB0A9AAFF9EA1B9FFADA5A5FFD9D9E0FFC7C8D7FFF2F2
      F7FFB8B9C8FF70717AC200000000000000003535354B7D7670F7C3BAAFFFBAAE
      9DFFA79B87FF464644B12A4358F04280B8FF264763FF5195C6FF274864FF4280
      B8FF254059F7353561D11E1E80F81C1C42EB0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFF2F2F7FFBABDCEFFB3A696FFB8B5BBFFBDAD92FFCDCDD6FFC7C8D7FFF2F2
      F7FFB8B9C8FF70717AC2000000000000000031313143807B74F8BFB7AEFF8982
      75FF787066FF4C4B49B62D4960EF4485BFFF274A67FF559BCEFF284B68FF4485
      BFFF2A4963F60202020307070708030303040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFF2F2F7FF949DB8FF90B2D0FF90B2D0FF90B2D0FF919FBCFFE3E3ECFFF2F2
      F7FFB8B9C8FF70717AC200000000000000004141416C424141E15D5B58F45855
      52FC44423FF94D4B4BBD344451D84A88B5FF22415BFF3D74A9FF283E50EF3838
      39532A2A2A360000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFF2F2F7FFD4DAE7FF99AEC8FFAAC3D9FF99AFC9FFC5CEDEFFF2F2F7FFF2F2
      F7FFB8B9C8FF70717AC20000000000000000000000004847479AF4E7D5FFE4D4
      B9FF5F5C55D9000000003A4B58D15BA7DEFF2A4F6FFF4A8FCEFF304B64EB0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B84C1F2F2
      F7FFF2F2F7FFF2F2F7FFE3E4ECFFF2F2F7FFD2D3DFFFF2F2F7FFF2F2F7FFF2F2
      F7FFB8B9C8FF70717AC2000000000000000000000000434343725E5A56D7625E
      55EE52504DBA000000003435354A3E3F40684041426F41434576373838500000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006C6E83D29296
      B1F89697B5FB9697B5FB9697B5FB9697B5FB9697B5FB9697B5FB9697B5FB9697
      B5FB7B7E9EF85E6072C8000000000000000000000000000000001C1C1C203C3C
      3C60000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000056596FBA7E88
      B3EC6372ADF386A1F8FF86A1F8FF86A1F8FF86A1F8FF86A1F8FF86A1F8FF86A1
      F8FF6379CBFF4E577DC200000000000000000000000000000000010101020E0E
      0E0F000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000020202035759
      66A16670A1EA94ACFAFF94ACFAFF94ACFAFF94ACFAFF94ACFAFF94ACFAFF94AC
      FAFF6C82CDFF4E577DC200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      02034D4F5889565A72B8565C76BE565C76BE565C76BE565C76BE565C76BE565C
      76BE51556AAD3B3C3E5700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000E00300000000000000000000000000000000000000000000
      000000000000}
  end
  object frxReport: TfrxReport
    Version = '6.9.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44952.308087986110000000
    ReportOptions.LastChange = 44952.308087986110000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 240
    Top = 232
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_det_rap_esc'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      TitleBeforeHeader = False
      object PageHeader_sum: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo46: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 1.102350000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SYG - RSP')
          ParentFont = False
        end
      end
      object ReportTitle_sum: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 126.811070000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 56.692950000000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Facture n'#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 56.692950000000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."date_rappport"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Width = 105.826808270000000000
          Height = 22.677170240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Segoe UI Black'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'FACTURE RSP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 71.811070000000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Date')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 71.811070000000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."date_rappport"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Top = 56.692950000000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Client')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 56.692950000000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."date_rappport"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Top = 71.811070000000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Navire')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133890000000000000
          Top = 71.811070000000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."date_rappport"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 555.590910000000000000
          Top = 86.929190000000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            'Ech'#233'ance')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 86.929190000000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."date_rappport"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897637800000000000
        Top = 215.433210000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 38.795300000000000000
          Width = 41.574803150000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'N'#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 80.370005510000000000
          Width = 374.173347950000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Libell'#233)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 453.732283460000000000
          Width = 56.692913390000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Qt'#233)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 574.677145820000000000
          Width = 105.826791180000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Montant')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 509.220780000000000000
          Width = 68.031442360000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Taux')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 415.748300000000000000
        Width = 718.110700000000000000
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 611.448536960000000000
          Top = 6.779530000000000000
          Width = 106.662163040000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[PAGE#] / [TOTALPAGES#]')
          ParentFont = False
          VAlign = vaCenter
        end
        object SysMemo2: TfrxSysMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = 6.779530000000000000
          Width = 110.140423920000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[TIME] [DATE]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Height = 15.118110240000000000
        ParentFont = False
        Top = 294.803340000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_det_rap_esc'
        RowCount = 0
        object line: TfrxMemoView
          AllowVectorExport = True
          Left = 38.795300000000000000
          Width = 41.574803150000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 80.370005510000000000
          Width = 374.173228346456700000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."libelle_marchandise"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 453.661417320000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."libelle_action"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 578.456675820000000000
          Width = 102.047261180000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."qte_ligne_rap"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 509.220472440000000000
          Width = 68.031442360000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."libelle_action"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Width = 102.047261180000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."qte_ligne_rap"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxPDFExport: TfrxPDFExport
    ShowDialog = False
    FileName = 'UniServerModule.NewCacheFileUrl(False, '#39'pdf'#39', '#39#39', '#39#39', AUrl);'
    UseFileCache = True
    DefaultPath = #39#39';'
    ShowProgress = False
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = True
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 336
    Top = 224
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset_det_rap_esc'
    CloseDataSource = False
    DataSource = DM.DS_Details_RapEsc
    BCDToCurrency = False
    Left = 152
    Top = 240
  end
end
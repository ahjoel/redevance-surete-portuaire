object FEtatsFacturePalEscale: TFEtatsFacturePalEscale
  Left = 0
  Top = 0
  ClientHeight = 571
  ClientWidth = 1234
  Caption = 'Editions Etats des Factures PAL | Escales'
  OnShow = UniFormShow
  WindowState = wsMinimized
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1234
    Height = 25
    Hint = ''
    ParentColor = False
    Align = alTop
    TabOrder = 0
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 1234
      Height = 25
      Hint = ''
      Align = alRight
      ParentFont = False
      Font.Height = -15
      Font.Style = [fsBold]
      TabOrder = 1
      BorderStyle = ubsNone
      Alignment = taLeftJustify
      Caption = 'Etats Factures PAL | Escales'
      Color = clSkyBlue
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 0
    Top = 25
    Width = 1234
    Height = 546
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object UniPanel2: TUniPanel
      Left = 0
      Top = 504
      Width = 1234
      Height = 42
      Hint = ''
      Align = alBottom
      TabOrder = 1
      Caption = ''
      object PanRowCount: TUniPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 99
        Height = 34
        Hint = ''
        Align = alLeft
        ParentFont = False
        Font.Color = clRed
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 1
        Caption = ''
        Color = clInfoBk
      end
      object BtnPrint: TUniButton
        AlignWithMargins = True
        Left = 1155
        Top = 4
        Width = 75
        Height = 34
        Hint = ''
        Caption = 'Imprimer'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 2
        IconCls = 'print'
        OnClick = BtnPrintClick
        ExplicitLeft = 1154
      end
      object BtnExport: TUniButton
        AlignWithMargins = True
        Left = 1074
        Top = 4
        Width = 75
        Height = 34
        Hint = ''
        Caption = 'Exporter'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 3
        IconCls = 'action'
        ExplicitLeft = 1073
      end
    end
    object UniGroupBox1: TUniGroupBox
      Left = 0
      Top = 0
      Width = 1234
      Height = 118
      Hint = ''
      Caption = 'Option De Recherche'
      Align = alTop
      TabOrder = 2
      object UniGroupBox2: TUniGroupBox
        Left = 3
        Top = 16
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'Periode Emission'
        TabOrder = 1
        object EdPeriode2_Em: TUniDateTimePicker
          Left = 132
          Top = 15
          Width = 95
          Hint = ''
          DateTime = 44949.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
      end
      object UniGroupBox3: TUniGroupBox
        Left = 3
        Top = 67
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'P'#233'riode Ech'#233'ance'
        TabOrder = 2
        object EdPeriode1_Ech: TUniDateTimePicker
          Left = 14
          Top = 16
          Width = 95
          Hint = ''
          DateTime = 44949.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
        end
        object EdPeriode2_Ech: TUniDateTimePicker
          Left = 133
          Top = 15
          Width = 95
          Hint = ''
          DateTime = 44949.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
        end
      end
      object EdPeriode1_Em: TUniDateTimePicker
        Left = 17
        Top = 31
        Width = 95
        Hint = ''
        DateTime = 44949.000000000000000000
        DateFormat = 'dd/MM/yyyy'
        TimeFormat = 'HH:mm:ss'
        TabOrder = 3
      end
      object UniLabel1: TUniLabel
        Left = 118
        Top = 35
        Width = 6
        Height = 13
        Hint = ''
        Caption = #224
        TabOrder = 4
      end
      object UniGroupBox4: TUniGroupBox
        Left = 249
        Top = 16
        Width = 216
        Height = 45
        Hint = ''
        Caption = 'Consignataire Fact'
        TabOrder = 5
        object DBLConsignataire_Fact: TUniDBLookupComboBox
          Left = 3
          Top = 15
          Width = 190
          Hint = ''
          ListField = 'nom_consignataire'
          ListSource = DM.DS_DBL_Cons_fact
          KeyField = 'id_consignataire'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
        end
      end
      object GBNavire: TUniGroupBox
        Left = 250
        Top = 67
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Navire'
        TabOrder = 6
        object DBLNavire: TUniDBLookupComboBox
          Left = 3
          Top = 13
          Width = 190
          Hint = ''
          ListField = 'nom_navire'
          ListSource = DM.DS_DBL_Navire
          KeyField = 'id_navire'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
        end
      end
      object GBConsignataire_Nav: TUniGroupBox
        Left = 485
        Top = 16
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Consignataire Nav'
        TabOrder = 7
        object DBLConsignataire_Nav: TUniDBLookupComboBox
          Left = 5
          Top = 15
          Width = 190
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
      end
      object GBTypeFact: TUniGroupBox
        Left = 711
        Top = 15
        Width = 330
        Height = 45
        Hint = ''
        Caption = 'Type Facture'
        TabOrder = 8
        object DBLCatFact: TUniDBLookupComboBox
          Left = 8
          Top = 16
          Width = 125
          Hint = ''
          ListField = 'libelle_cat_fact'
          ListSource = DM.DS_DBL_Cat_Fact
          KeyField = 'id_cat'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
          OnChange = DBLCatFactChange
        end
        object DBLTypeFact: TUniDBLookupComboBox
          Left = 155
          Top = 16
          Width = 159
          Hint = ''
          ListField = 'code_type_fact'
          ListSource = DM.DS_DBL_TypeFact
          KeyField = 'id_type_fact'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 2
          Color = clWindow
          Style = csDropDown
        end
      end
      object GBTypeNav: TUniGroupBox
        Left = 485
        Top = 66
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Type Navire'
        TabOrder = 9
        object DBLTypeNavire: TUniDBLookupComboBox
          Left = 10
          Top = 15
          Width = 183
          Hint = ''
          ListField = 'libelle_type_nav'
          ListSource = DM.DS_DBL_TypeNavire
          KeyField = 'id_type_nav'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
        end
      end
      object GBFacturable: TUniGroupBox
        Left = 711
        Top = 66
        Width = 121
        Height = 45
        Hint = ''
        Caption = 'Compl'#233'ment'
        TabOrder = 10
        object CBComplement: TUniComboBox
          Left = 16
          Top = 15
          Width = 84
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'OUI'
            'NON')
          TabOrder = 1
          ClearButton = True
          IconItems = <>
        end
      end
      object GBStatut: TUniGroupBox
        Left = 860
        Top = 66
        Width = 181
        Height = 45
        Hint = ''
        Caption = 'Statut'
        TabOrder = 11
        object CBStatut: TUniComboBox
          Left = 5
          Top = 15
          Width = 158
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'IMPAY'#201'ES'
            'REGL'#201'ES'
            'PARTIELLEMENT PAY'#201'ES')
          TabOrder = 1
          ClearButton = True
          IconItems = <>
        end
      end
      object UniPanel3: TUniPanel
        AlignWithMargins = True
        Left = 1082
        Top = 18
        Width = 147
        Height = 95
        Hint = ''
        Align = alRight
        TabOrder = 12
        Caption = ''
        object BtnRecherche: TUniButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 139
          Height = 35
          Hint = ''
          Caption = 'Rechercher'
          Align = alTop
          ParentFont = False
          Font.Height = -12
          Font.Style = [fsBold]
          TabOrder = 1
          IconCls = 'search'
          OnClick = BtnRechercheClick
        end
        object BtnReinitialise: TUniButton
          AlignWithMargins = True
          Left = 4
          Top = 56
          Width = 139
          Height = 35
          Hint = ''
          Caption = 'R'#233'initialiser'
          Align = alBottom
          ParentFont = False
          Font.Height = -12
          Font.Style = [fsBold]
          TabOrder = 2
          IconCls = 'refresh'
          OnClick = BtnReinitialiseClick
        end
      end
    end
    object DBGrid: TUniDBGrid
      AlignWithMargins = True
      Left = 0
      Top = 115
      Width = 1231
      Height = 387
      Hint = ''
      DataSource = DM.DS_Grid_FactPal
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow, dgRowNumbers]
      WebOptions.Paged = False
      LoadMask.Message = 'Loading data...'
      TabOrder = 3
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id_factures_pal'
          Title.Caption = 'id'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'ref_fact'
          Title.Caption = 'N'#176' Facture'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 110
        end
        item
          FieldName = 'date_emise_facture_pal'
          Title.Caption = ' Emise'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 85
        end
        item
          FieldName = 'date_trans_facture_pal'
          Title.Caption = 'Transmission'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 90
        end
        item
          FieldName = 'date_ech_facture_pal'
          Title.Caption = 'Echeance'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 70
        end
        item
          FieldName = 'ref_nav'
          Title.Caption = 'Ref Int'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 85
        end
        item
          FieldName = 'code_type_fact'
          Title.Caption = 'Type Facture'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 90
        end
        item
          FieldName = 'nom_navire'
          Title.Caption = ' Navire'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 120
        end
        item
          FieldName = 'cons_nav'
          Title.Caption = 'Consignataire Nav'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 130
        end
        item
          FieldName = 'cons_fact'
          Title.Caption = 'Consignataire Fact'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 130
        end
        item
          FieldName = 'montant_reel'
          Title.Caption = 'Mt Reel'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 80
        end
        item
          FieldName = 'complement'
          Title.Caption = 'Complement'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 90
        end
        item
          FieldName = 'montant'
          Title.Caption = 'Montant'
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Width = 90
        end
        item
          FieldName = 'montant_xof'
          Title.Caption = 'Montant (XOF)'
          Width = 64
        end
        item
          FieldName = 'mont_regle'
          Title.Caption = 'Mt Regl'#233
          Width = 64
        end
        item
          FieldName = 'mont_solde'
          Title.Caption = 'Solde'
          Width = 64
        end
        item
          FieldName = 'control'
          Title.Caption = 'C'
          Width = 64
        end
        item
          FieldName = 'validation'
          Title.Caption = 'V'
          Width = 64
        end
        item
          FieldName = 'st_fact'
          Title.Caption = 'St'
          Width = 64
        end
        item
          FieldName = 'commentaire_control'
          Title.Caption = 'commentaire_control'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'commentaire_validate'
          Title.Caption = 'commentaire_validate'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'rapport_control'
          Title.Caption = 'rapport_control'
          Width = 64
          Visible = False
        end
        item
          FieldName = 'rapport_validate'
          Title.Caption = 'rapport_validate'
          Width = 64
          Visible = False
        end>
    end
  end
  object frxReport: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44860.737619745400000000
    ReportOptions.LastChange = 44953.622727928240000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 264
    Top = 192
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_fact_pal_es'
      end
      item
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_fact_pal_es'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 5.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      TitleBeforeHeader = False
      object PageHeader_sum: TfrxPageHeader
        FillType = ftBrush
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
        Frame.Typ = []
        Height = 92.795300000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        object title_summary: TfrxMemoView
          AllowVectorExport = True
          Left = 0.833333340000000000
          Top = 18.914656670000000000
          Width = 716.929810000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8W = (
            'SOMMAIRE')
          ParentFont = False
        end
        object title_sum: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTE DES FACTURES PAL')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 51.854924780000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Type Facture')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 63.193495250000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Type Navire')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 74.532077930000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Compl'#233'ment')
          ParentFont = False
        end
        object title_typefact_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893483810000000000
          Top = 51.854924780000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_typenav_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893483810000000000
          Top = 63.193495250000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_complement_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893483810000000000
          Top = 74.532077930000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object Memo66: TfrxMemoView
          AllowVectorExport = True
          Left = 3.102350010000000000
          Top = 38.015770000000000000
          Width = 39.972668260000000000
          Height = 11.941128260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CRIT'#201'RES')
          ParentFont = False
        end
      end
      object ColumnHeader_sum: TfrxColumnHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object Memo47: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 37.795263390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_lib_title: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 37.795263390000000000
          Width = 264.566880310000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176)
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_nb_title: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 302.362143700000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'NOMBRE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 377.952694880000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'MONTANT FACT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo65: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 491.338521650000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'MONTANT REGLE')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo68: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 604.724348420000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'MONTANT SOLDE')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary_sum: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 302.362180310000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_total: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 377.952731490000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."mt_fact">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 302.362180310000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."nb_fact">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo70: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 491.338558260000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."mt_regle">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo71: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 604.724385030000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."mt_solde">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter_sum: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object SysMemo3: TfrxSysMemoView
          Align = baLeft
          AllowVectorExport = True
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
      object MasterData_sum: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_fact_pal_es'
        RowCount = 0
        object Memo50: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 37.795263390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_lib_data: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 37.795263390000000000
          Width = 264.566880310000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_nb_data: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 302.362143700000000000
          Top = -0.028424360000000010
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_montant_fact_data: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 377.952694880000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_montant_regle_data: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 491.338521650000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_montant_solde_data: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 604.724348420000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 7.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      Duplex = dmVertical
      Frame.Typ = []
      MirrorMode = []
      TitleBeforeHeader = False
      object PageFooter_main: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 442.205010000000000000
        Width = 1069.606990000000000000
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 962.944826960000000000
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
      object PageHeader_main: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 1069.606990000000000000
        object Memo3: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = -0.779530000000000000
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
      object ColumnHeader_main: TfrxColumnHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897637800000000000
        Top = 170.078850000000000000
        Width = 1069.606990000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 37.795275590000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Align = baLeft
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 75.590551181102360000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Numero')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 219.212598424645700000
          Width = 56.692913390000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Ref Nav')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 275.905511814645700000
          Width = 68.031496060000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Type')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 343.937007874645700000
          Width = 128.503937010000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Navire')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1043.149606301654000000
          Width = 26.456692910000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'St')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 472.440944884645700000
          Width = 117.165354330708700000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Consignataire Nav.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 589.606299215354400000
          Width = 117.165354330708700000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Consignataire Fact.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 706.771653546063100000
          Width = 41.574803149606300000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Mt R ('#8364')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 748.346456695669400000
          Width = 45.354330710000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Cpl.('#8364')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 793.700787405669400000
          Width = 45.354330710000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Mt T('#8364')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 839.055118115669400000
          Width = 68.031496060000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Mt T (XOF)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 113.385826771102400000
          Width = 52.913385826771650000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Emise')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 166.299212597874000000
          Width = 52.913385826771650000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Ech'#233'ance')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 907.086614175669400000
          Width = 68.031496062992130000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Mt R'#233'gl'#233)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 975.118110238661500000
          Width = 68.031496062992130000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haRight
          Memo.UTF8W = (
            'Mt Sode')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle_main: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        Height = 75.590600000000000000
        ParentFont = False
        Top = 71.811070000000000000
        Width = 1069.606990000000000000
        object title_report: TfrxMemoView
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTE DES FACTURE PAL')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000010000000000
          Top = 19.278965220000000000
          Width = 47.531728260000000000
          Height = 11.941128260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CRIT'#201'RES')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 36.236240000000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Type Facture')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 47.574810470000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Type Navire')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 58.913393150000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Compl'#233'ment')
          ParentFont = False
        end
        object title_typefact: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893483810000000000
          Top = 36.236240000000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_typenav: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893483810000000000
          Top = 47.574810470000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_complement: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893483810000000000
          Top = 58.913393150000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -8
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
      end
      object MasterData_main: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Height = 18.897637800000000000
        ParentFont = False
        Top = 287.244280000000000000
        Width = 1069.606990000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_fact_pal_es'
        RowCount = 0
        Stretched = True
        object line: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 37.795275590000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[Line]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo21: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 75.590551180000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."ref_fact"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 219.212598426771700000
          Width = 56.692913390000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."ref_nav"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 275.905511816771700000
          Width = 68.031496060000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_type_fact"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 343.937007876771700000
          Width = 128.503937010000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."nom_navire"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1043.149606296772000000
          Width = 26.456692910000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset."st_fact"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 472.440944886771700000
          Width = 117.165354330000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."cons_nav"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 589.606299216771700000
          Width = 117.165354330000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."cons_fact"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 706.771653546771700000
          Width = 41.574803150000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."montant_reel"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 748.346456696771700000
          Width = 45.354330710000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."complement"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 793.700787406771700000
          Width = 45.354330710000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."montant"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 839.055118116771700000
          Width = 68.031496060000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."montant_xof"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 113.385826770000000000
          Width = 52.913385830000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_emise_facture_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 166.299212600000000000
          Width = 52.913385826771650000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_ech_facture_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 907.086614176771700000
          Width = 68.031496060000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."mont_regle"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 975.118110236771700000
          Width = 68.031496060000000000
          Height = 18.897637800000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."mont_solde"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 249.448980000000000000
        Width = 1069.606990000000000000
        Condition = 'frxDBDataset_fact_pal_es.""'
        ReprintOnNewPage = True
        StartNewPage = True
        object title_group: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = -1.220470000000000000
          Width = 1069.606990000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight]
          Frame.Width = 0.100000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 404.409710000000000000
        Width = 1069.606990000000000000
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Width = 1069.606990000000000000
          Height = 15.118110240000000000
          Fill.BackColor = 15000804
          Fill.ForeColor = clNone
          Frame.Typ = []
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 839.055118110000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."montant_xof">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 907.087200000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."mont_regle">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 975.118740000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."mont_solde">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter: TfrxGroupFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 328.819110000000000000
        Width = 1069.606990000000000000
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 1069.606990000000000000
          Height = 15.118110240000000000
          Fill.ForeColor = clNone
          Frame.Typ = []
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Width = 861.732510470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SOUS - TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 839.055118110000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."montant_xof">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 907.087200000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."mont_regle">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 975.118740000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."mont_solde">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Memo35: TfrxMemoView
        AllowVectorExport = True
        Left = -3.779530000000000000
        Top = 404.409710000000000000
        Width = 831.496270470000000000
        Height = 15.118110240000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'Arial Narrow'
        Font.Style = [fsBold]
        Frame.Typ = []
        HAlign = haCenter
        Memo.UTF8W = (
          'TOTAL')
        ParentFont = False
        VAlign = vaCenter
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
    Left = 264
    Top = 256
  end
  object frxDBDataset_sum: TfrxDBDataset
    UserName = 'frxDBDataset_sum_fact_pal_es'
    CloseDataSource = False
    DataSet = DM.QSum
    BCDToCurrency = False
    Left = 176
    Top = 256
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset_fact_pal_es'
    CloseDataSource = False
    DataSource = DM.DS_Grid_Escale
    BCDToCurrency = False
    Left = 176
    Top = 192
  end
end

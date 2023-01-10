object FEtatsReglement: TFEtatsReglement
  Left = 0
  Top = 0
  ClientHeight = 685
  ClientWidth = 1319
  Caption = 'Editions Etats des R'#233'gl'#233'ments'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1319
    Height = 685
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 1234
    ExplicitHeight = 668
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1319
      Height = 36
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 1234
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1284
        Height = 36
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
        Caption = 'Etats R'#233'glement'
        Color = clSkyBlue
        Layout = 'column'
        ExplicitWidth = 1199
      end
      object UniPanel2: TUniPanel
        Left = 0
        Top = 0
        Width = 35
        Height = 36
        Hint = ''
        Align = alLeft
        TabOrder = 2
        BorderStyle = ubsNone
        Caption = ''
        Color = clSkyBlue
      end
    end
    object UniGroupBox1: TUniGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 39
      Width = 1313
      Height = 118
      Hint = ''
      Caption = 'Options de Recherche'
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 1228
      object GBPeriode_Em: TUniGroupBox
        Left = 3
        Top = 16
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'Periode R'#233'glement'
        TabOrder = 1
        object EdPeriode1_Em: TUniDateTimePicker
          Left = 4
          Top = 15
          Width = 95
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
          ScreenMask.WaitData = True
        end
        object EdPeriode2_Em: TUniDateTimePicker
          Left = 123
          Top = 15
          Width = 95
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
          ScreenMask.WaitData = True
        end
        object UniLabel1: TUniLabel
          Left = 110
          Top = 20
          Width = 6
          Height = 13
          Hint = ''
          Caption = #225
          TabOrder = 3
        end
      end
      object GBConsignataire_Fact: TUniGroupBox
        Left = 250
        Top = 16
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Consignataire Fact'
        TabOrder = 2
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
      object GBTypeFact: TUniGroupBox
        Left = 701
        Top = 15
        Width = 330
        Height = 45
        Hint = ''
        Caption = 'Type Facture'
        TabOrder = 3
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
      object GBNavire: TUniGroupBox
        Left = 250
        Top = 66
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Navire'
        TabOrder = 4
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
      object UniPanel3: TUniPanel
        AlignWithMargins = True
        Left = 1161
        Top = 18
        Width = 147
        Height = 95
        Hint = ''
        Align = alRight
        TabOrder = 5
        Caption = ''
        ExplicitLeft = 1076
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
        end
      end
      object GBConsignataire_Nav: TUniGroupBox
        Left = 475
        Top = 16
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Consignataire R'#233'glement'
        TabOrder = 6
        object DBLConsignataire_Nav: TUniDBLookupComboBox
          Left = 9
          Top = 20
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
      object GBPeriode_Ech: TUniGroupBox
        Left = 3
        Top = 64
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'Periode Facture'
        TabOrder = 7
        object EdPeriode1_Ech: TUniDateTimePicker
          Left = 4
          Top = 15
          Width = 95
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 1
          ScreenMask.WaitData = True
        end
        object EdPeriode2_Ech: TUniDateTimePicker
          Left = 123
          Top = 15
          Width = 95
          Hint = ''
          DateTime = 44809.000000000000000000
          DateFormat = 'dd/MM/yyyy'
          TimeFormat = 'HH:mm:ss'
          TabOrder = 2
          ScreenMask.WaitData = True
        end
        object UniLabel2: TUniLabel
          Left = 110
          Top = 20
          Width = 6
          Height = 13
          Hint = ''
          Caption = #225
          TabOrder = 3
        end
      end
      object GBFacturable: TUniGroupBox
        Left = 701
        Top = 66
        Width = 121
        Height = 45
        Hint = ''
        Caption = 'Compl'#233'ment'
        TabOrder = 8
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
      object GBTypeNav: TUniGroupBox
        Left = 475
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
      object GBStatut: TUniGroupBox
        Left = 850
        Top = 66
        Width = 181
        Height = 45
        Hint = ''
        Caption = 'Statut'
        TabOrder = 10
        object CBStatut: TUniComboBox
          Left = 5
          Top = 15
          Width = 156
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'NON REGL'#201'ES'
            'REGL'#201'ES'
            'PARTIELLEMENT')
          TabOrder = 1
          ClearButton = True
          IconItems = <>
        end
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 649
      Width = 1313
      Height = 33
      Hint = ''
      ParentColor = False
      Color = clInfoBk
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 632
      ExplicitWidth = 1228
      object BtnExport: TUniButton
        AlignWithMargins = True
        Left = 1154
        Top = 3
        Width = 75
        Height = 27
        Hint = ''
        Caption = 'Exporter'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 1
        IconCls = 'action'
        ExplicitLeft = 1069
      end
      object BtnPrint: TUniButton
        AlignWithMargins = True
        Left = 1235
        Top = 3
        Width = 75
        Height = 27
        Hint = ''
        Caption = 'Imprimer'
        Align = alRight
        ParentFont = False
        Font.Color = clBlack
        TabOrder = 2
        IconCls = 'print'
        ExplicitLeft = 1150
      end
      object PanRowCount: TUniPanel
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 99
        Height = 27
        Hint = ''
        Align = alLeft
        ParentFont = False
        Font.Color = clRed
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 3
        Caption = ''
        Color = clInfoBk
      end
    end
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 160
      Width = 1319
      Height = 486
      Hint = ''
      DataSource = DM.DS_Grid_Reglement
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 4
      Columns = <
        item
          FieldName = 'id_regle'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'date_regle'
          Title.Alignment = taCenter
          Title.Caption = 'Date Reg.'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'ref_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = 'Facture'
          Title.Font.Style = [fsBold]
          Width = 121
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_fact'
          Title.Alignment = taCenter
          Title.Caption = 'Type Fact.'
          Title.Font.Style = [fsBold]
          Width = 95
        end
        item
          FieldName = 'date_emise_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = ' Date Fact.'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
        end
        item
          ShowToolTipAlways = False
          FieldName = 'montant_xof'
          Title.Alignment = taCenter
          Title.Caption = 'Mt Fact.'
          Title.Font.Style = [fsBold]
          Width = 114
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'montant_regle'
          Title.Alignment = taCenter
          Title.Caption = 'Mt Regl'#233
          Title.Font.Style = [fsBold]
          Width = 101
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_r'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire Reg.'
          Title.Font.Style = [fsBold]
          Width = 205
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_f'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire Fact.'
          Title.Font.Style = [fsBold]
          Width = 161
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'control'
          Title.Alignment = taCenter
          Title.Caption = ' C'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'validation'
          Title.Alignment = taCenter
          Title.Caption = 'V'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset_reglement'
    CloseDataSource = False
    DataSource = DM.DS_Grid_Escale
    BCDToCurrency = False
    Left = 184
    Top = 216
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
    Left = 400
    Top = 200
  end
  object frxReport: TfrxReport
    Version = '6.9.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44860.737619745400000000
    ReportOptions.LastChange = 44910.150676423600000000
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
        DataSetName = 'frxDBDataset_reglement'
      end
      item
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_reglement'
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110236220500000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176)
          ParentFont = False
        end
        object sum_lib_title: TfrxMemoView
          AllowVectorExport = True
          Left = 94.488188980000000000
          Width = 453.543307090000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haCenter
          Memo.UTF8W = (
            'N'#176)
          ParentFont = False
        end
        object sum_nb_title: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031496060000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haCenter
          Memo.UTF8W = (
            'NOMBRE')
          ParentFont = False
        end
      end
      object ReportSummary_sum: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110236220500000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 510.236220470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          AllowVectorExport = True
          Left = 548.031496060000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."nb_fact">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter_sum: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_reglement'
        RowCount = 0
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795300000000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          AllowVectorExport = True
          Left = 94.488213390000000000
          Width = 453.543307090000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
        object sum_nb_data: TfrxMemoView
          AllowVectorExport = True
          Left = 548.031496060000000000
          Top = -0.028424360000000000
          Width = 113.385826770000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 400.630180000000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897637800000000000
        Top = 170.078850000000000000
        Width = 1069.606990000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 37.795275590551180000
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
          Align = baLeft
          AllowVectorExport = True
          Left = 37.795275590551180000
          Width = 102.047244094488200000
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
            'Numero')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 139.842519685039400000
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
          Memo.UTF8W = (
            'Ref Nav')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 196.535433075039400000
          Width = 75.590551180000000000
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
            'Type')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 272.125984255039400000
          Width = 132.283464566929000000
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
            'Navire')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1035.590551190079000000
          Width = 26.456692910000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
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
          Left = 404.409448821968400000
          Width = 132.283464566929100000
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
            'Consignataire Nav.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 536.692913388897500000
          Width = 132.283464566929100000
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
            'Consignataire Fact.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 668.976377955826600000
          Width = 56.692913385826800000
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
            'Mt R ('#8364')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo16: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 725.669291341653400000
          Width = 49.133858267716540000
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
            'Cpl.('#8364')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 774.803149609370000000
          Width = 56.692913385826800000
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
            'Mt T('#8364')')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 831.496062995196800000
          Width = 86.929133860000000000
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
            'Mt T (XOF)')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 918.425196855196800000
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
          Memo.UTF8W = (
            'Emise')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 975.118110245196800000
          Width = 60.472440944881890000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Ech'#233'ance')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object ReportTitle_main: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
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
        Top = 287.244280000000000000
        Width = 1069.606990000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_reglement'
        RowCount = 0
        Stretched = True
        object line: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Width = 102.047244090000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 139.842519680000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 196.535433070000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 272.125984250000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 1035.590551200000000000
          Width = 26.456692910000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset."statut_fact"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 404.409448820000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 536.692913390000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 668.976377960000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 725.669291350000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 774.803149620000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 831.496063010000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 918.425196870000000000
          Width = 56.692913390000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 975.118110260000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_ech_facture_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 249.448980000000000000
        Width = 1069.606990000000000000
        Condition = 'frxDBDataset_fact_pal.""'
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 362.834880000000000000
        Width = 1069.606990000000000000
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Width = 831.496270470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 831.496270470000000000
          Width = 94.488176770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."montant_xof">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset_sum: TfrxDBDataset
    UserName = 'frxDBDataset_sum_reglement'
    CloseDataSource = False
    DataSet = DM.QSum
    BCDToCurrency = False
    Left = 152
    Top = 264
  end
end
object FEtatsRade: TFEtatsRade
  Left = 0
  Top = 0
  ClientHeight = 734
  ClientWidth = 1271
  Caption = 'Editions Etats des Navires en Rade'
  OnShow = UniFormShow
  WindowState = wsMaximized
  OldCreateOrder = False
  BorderIcons = [biSystemMenu, biMaximize]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object MainContainer: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1271
    Height = 734
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitWidth = 1191
    ExplicitHeight = 707
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1271
      Height = 30
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 1
      ExplicitWidth = 1304
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1236
        Height = 30
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
        Caption = 'Etats Rade'
        Color = clSkyBlue
        Layout = 'column'
        ExplicitLeft = 41
        ExplicitTop = -3
      end
      object UniPanel1: TUniPanel
        Left = 0
        Top = 0
        Width = 35
        Height = 30
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
      Top = 33
      Width = 1265
      Height = 114
      Hint = ''
      Caption = 'Options de Recherche'
      Align = alTop
      TabOrder = 2
      ExplicitWidth = 1298
      object GBPeriode: TUniGroupBox
        Left = 3
        Top = 16
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'Periode'
        TabOrder = 1
        object EdPeriode1: TUniDateTimePicker
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
        object EdPeriode2: TUniDateTimePicker
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
      object GBConsignataire: TUniGroupBox
        Left = 247
        Top = 16
        Width = 281
        Height = 45
        Hint = ''
        Caption = 'Consignataire'
        TabOrder = 2
        object DBLConsignataire: TUniDBLookupComboBox
          Left = 3
          Top = 15
          Width = 259
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
      object GBTypeNav: TUniGroupBox
        Left = 537
        Top = 16
        Width = 187
        Height = 45
        Hint = ''
        Caption = 'Type Navire'
        TabOrder = 3
        object DBLTypeNavire: TUniDBLookupComboBox
          Left = 10
          Top = 15
          Width = 158
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
      object GBFacturePAL: TUniGroupBox
        Left = 250
        Top = 63
        Width = 100
        Height = 45
        Hint = ''
        Caption = 'Factur'#233' PAL'
        TabOrder = 4
        object CBFacturePAL: TUniComboBox
          Left = 3
          Top = 15
          Width = 75
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            ''
            'OUI'
            'NON')
          TabOrder = 1
          IconItems = <>
        end
      end
      object GBFactureInt: TUniGroupBox
        Left = 428
        Top = 63
        Width = 100
        Height = 45
        Hint = ''
        Caption = 'Factur'#233' Int'
        TabOrder = 5
        object CBFactureInt: TUniComboBox
          Left = 3
          Top = 15
          Width = 75
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            ''
            'OUI'
            'NON')
          TabOrder = 1
          IconItems = <>
        end
      end
      object GBNavire: TUniGroupBox
        Left = 7
        Top = 63
        Width = 229
        Height = 45
        Hint = ''
        Caption = 'Navire'
        TabOrder = 6
        object DBLNavire: TUniDBLookupComboBox
          Left = 0
          Top = 15
          Width = 207
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
        Left = 1113
        Top = 18
        Width = 147
        Height = 91
        Hint = ''
        Align = alRight
        TabOrder = 7
        Caption = ''
        ExplicitLeft = 1146
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
          Top = 52
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
      object UniButton1: TUniButton
        Left = 1056
        Top = 15
        Width = 54
        Height = 97
        Hint = ''
        Caption = 'TEST'
        Align = alRight
        TabOrder = 8
        OnClick = UniButton1Click
        ExplicitHeight = 34
      end
    end
    object UniContainerPanel2: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 698
      Width = 1265
      Height = 33
      Hint = ''
      ParentColor = False
      Color = clInfoBk
      Align = alBottom
      TabOrder = 3
      ExplicitTop = 720
      ExplicitWidth = 1298
      object BtnExport: TUniButton
        AlignWithMargins = True
        Left = 1106
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
        ExplicitLeft = 1139
      end
      object BtnPrint: TUniButton
        AlignWithMargins = True
        Left = 1187
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
        OnClick = BtnPrintClick
        ExplicitLeft = 1220
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
      Top = 150
      Width = 1271
      Height = 545
      Hint = ''
      DataSource = DM.DS_Grid_Rade
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 4
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'ref_ex'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Int'
          Title.Font.Style = [fsBold]
          Width = 96
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 238
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'nom_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire'
          Title.Font.Style = [fsBold]
          Width = 182
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
          Title.Font.Style = [fsBold]
          Width = 45
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'debut'
          Title.Alignment = taCenter
          Title.Caption = ' Debut'
          Title.Font.Style = [fsBold]
          Width = 95
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fin'
          Title.Alignment = taCenter
          Title.Caption = 'Fin'
          Title.Font.Style = [fsBold]
          Width = 95
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'sejour'
          Title.Alignment = taCenter
          Title.Caption = 'Nb Jours'
          Title.Font.Style = [fsBold]
          Width = 55
        end
        item
          FieldName = 'nombre_jour_taux_rade'
          Title.Alignment = taCenter
          Title.Caption = 'Base'
          Title.Font.Style = [fsBold]
          Width = 47
        end
        item
          FieldName = 'qte'
          Title.Alignment = taCenter
          Title.Caption = ' Qte'
          Title.Font.Style = [fsBold]
          Width = 44
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
        end
        item
          FieldName = 'fact_int'
          Title.Alignment = taCenter
          Title.Caption = ' FI'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fact_pal'
          Title.Alignment = taCenter
          Title.Caption = ' FP'
          Title.Font.Style = [fsBold]
          Width = 30
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end>
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
    Left = 400
    Top = 200
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
    ReportOptions.LastChange = 44893.409795520830000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 280
    Top = 192
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_rade'
      end
      item
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_rade'
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
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
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
        Height = 96.574830000000000000
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
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTE DES RADES')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519790000000000000
          Top = 63.193487930000000000
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
            'Fact. PAL')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 362.393940000000000000
          Top = 63.193487930000000000
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
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 162.519790000000000000
          Top = 74.532070610000000000
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
            'Fact. INT')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 362.393940000000000000
          Top = 74.532070610000000000
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
            'Navire')
          ParentFont = False
        end
        object title_factPAL_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 211.633743810000000000
          Top = 63.193487930000000000
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
        object title_factInt_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 211.633743810000000000
          Top = 74.532070610000000000
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
        object title_typeNav_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 411.527830000000000000
          Top = 63.193487930000000000
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
        object title_navire_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 411.527830000000000000
          Top = 74.532070610000000000
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
          Left = 339.480520010000000000
          Top = 49.354360000000000000
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
        Top = 185.196970000000000000
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
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 510.236220470000000000
          Height = 15.118110236220500000
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
            '[SUM(<frxDBDataset_sum."nb_rade">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter_sum: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118120000000000000
        Top = 374.173470000000000000
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
        Top = 260.787570000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_rade'
        RowCount = 0
        object sum_line: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
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
          Left = 94.488188980000000000
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
          Top = -0.028424360000000010
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
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      Duplex = dmVertical
      Frame.Typ = []
      MirrorMode = []
      TitleBeforeHeader = False
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Frame.Typ = []
        Height = 94.488250000000000000
        Top = 71.811070000000000000
        Width = 718.110700000000000000
        object title_report: TfrxMemoView
          AllowVectorExport = True
          Top = 1.000000000000000000
          Width = 737.008350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'LISTE DES RADES')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Top = 38.236213150000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Fact. PAL')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Top = 60.913393150000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Type Navire')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Top = 49.574795830000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Fact. INT')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Top = 72.251975830000000000
          Width = 49.133858270000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Navire')
          ParentFont = False
        end
        object title_factPal: TfrxMemoView
          AllowVectorExport = True
          Left = 49.113953810000000000
          Top = 38.236213150000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_factInt: TfrxMemoView
          AllowVectorExport = True
          Left = 49.113953810000000000
          Top = 49.574795830000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_typeNav: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133858270000000000
          Top = 60.913393150000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object title_navire: TfrxMemoView
          AllowVectorExport = True
          Left = 49.133858270000000000
          Top = 72.251975830000000000
          Width = 151.181102360000000000
          Height = 11.338582680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Top = 26.456710000000000000
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
      object MasterData: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        Height = 15.118110240000000000
        ParentFont = False
        Top = 306.141930000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_rade'
        RowCount = 0
        object line: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
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
          Align = baLeft
          AllowVectorExport = True
          Left = 41.574803150000000000
          Width = 60.472440944881890000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."ref"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 102.047244094881900000
          Width = 170.078740157480300000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."nom_navire"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 272.125984252362200000
          Width = 45.354330708661420000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_type_nav"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 317.480314961023600000
          Width = 139.842519685039400000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."nom_consignataire"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 457.322834646063000000
          Width = 56.692913385826770000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."debut"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 514.015748031889800000
          Width = 56.692913385826770000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."fin"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 570.708661417716600000
          Width = 26.456692913385830000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."sejour"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 634.960629921102400000
          Width = 26.456692910000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."qte"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo33: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 597.165354331102400000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset."nombre_jour_taux_rade"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo35: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 661.417322831102400000
          Width = 30.236220472440940000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset."fact_int"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo37: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 691.653543303543300000
          Width = 26.456692913385830000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset."fact_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 381.732530000000000000
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
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
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 18.897637800000000000
        Top = 188.976500000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 41.574803149606300000
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
          Left = 41.574803149606300000
          Width = 60.472440944881890000
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
            'Ref')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 102.047244094488200000
          Width = 170.078740157480300000
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
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 272.125984251968500000
          Width = 45.354330708661420000
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
        object Memo13: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 317.480314960629900000
          Width = 139.842519685039400000
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
            'Consignataire')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 457.322834645669300000
          Width = 56.692913385826770000
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
            'Arriv'#233)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 514.015748031496100000
          Width = 56.692913385826770000
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
            'Depart')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 570.708661417322900000
          Width = 26.456692913385830000
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
            'NbJ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo25: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 634.960629920708700000
          Width = 26.456692910000000000
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
        object Memo32: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 597.165354330708700000
          Width = 37.795275590000000000
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
            'U')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo34: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 661.417322830708700000
          Width = 30.236220472440940000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          HAlign = haCenter
          Memo.UTF8W = (
            'FI')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo36: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 691.653543303149600000
          Width = 26.456692913385830000
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
            'FP')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader: TfrxGroupHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        Condition = 'frxDBDataset_rade.""'
        StartNewPage = True
        object title_group: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 714.331170000000000000
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
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset_rade'
    CloseDataSource = False
    DataSource = DM.DS_Grid_Rade
    BCDToCurrency = False
    Left = 184
    Top = 216
  end
  object frxDBDataset_sum: TfrxDBDataset
    UserName = 'frxDBDataset_sum_rade'
    CloseDataSource = False
    DataSet = DM.QSum
    BCDToCurrency = False
    Left = 112
    Top = 296
  end
end

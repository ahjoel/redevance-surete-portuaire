object FEtatsReglement: TFEtatsReglement
  Left = 0
  Top = 0
  ClientHeight = 685
  ClientWidth = 1319
  Caption = 'Editions Etats des R'#233'gl'#233'ments'
  OnShow = UniFormShow
  WindowState = wsMaximized
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
      object GBPeriode_Em: TUniGroupBox
        Left = 3
        Top = 16
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'Periode R'#233'glement'
        TabOrder = 1
        object EdPeriode1_Reg: TUniDateTimePicker
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
        object EdPeriode2_Reg: TUniDateTimePicker
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
        Left = 475
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
        Caption = 'Cat'#233'gorie  et  Type Facture'
        TabOrder = 3
        object DBLCatFact: TUniDBLookupComboBox
          Left = 5
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
      object GBNavire: TUniGroupBox
        Left = 475
        Top = 64
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
      object GBConsignataire_Nav: TUniGroupBox
        Left = 250
        Top = 16
        Width = 215
        Height = 45
        Hint = ''
        Caption = 'Consignataire R'#233'glement'
        TabOrder = 6
        object DBLConsignataire_Reg: TUniDBLookupComboBox
          Left = 9
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
      object GBPeriode_Ech: TUniGroupBox
        Left = 3
        Top = 64
        Width = 233
        Height = 45
        Hint = ''
        Caption = 'Periode Facture'
        TabOrder = 7
        object EdPeriode1_Fact: TUniDateTimePicker
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
        object EdPeriode2_Fact: TUniDateTimePicker
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
        Caption = 'Statut'
        TabOrder = 8
        object CBStatut: TUniComboBox
          Left = 11
          Top = 15
          Width = 84
          Hint = ''
          Style = csDropDownList
          Text = ''
          Items.Strings = (
            'PARTIEL'
            'TOTAL')
          TabOrder = 1
          ClearButton = True
          IconItems = <>
          OnChangeValue = CBStatutChangeValue
        end
      end
      object GBTypeNav: TUniGroupBox
        Left = 250
        Top = 64
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
        OnClick = BtnPrintClick
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
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id_regle'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
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
          Width = 113
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_fact'
          Title.Alignment = taCenter
          Title.Caption = 'Type Fact.'
          Title.Font.Style = [fsBold]
          Width = 86
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_emise_facture_pal'
          Title.Alignment = taCenter
          Title.Caption = ' Date Fact.'
          Title.Font.Style = [fsBold]
          Width = 80
          Alignment = taCenter
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'montant_xof'
          Title.Alignment = taCenter
          Title.Caption = 'Mt Fact.'
          Title.Font.Style = [fsBold]
          Width = 90
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'montant_regle'
          Title.Alignment = taCenter
          Title.Caption = 'Mt Regl'#233
          Title.Font.Style = [fsBold]
          Width = 90
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 200
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = ' Type Nav.'
          Title.Font.Style = [fsBold]
          Width = 66
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_reg'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire Reg.'
          Title.Font.Style = [fsBold]
          Width = 180
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'cons_fact'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire Fact.'
          Title.Font.Style = [fsBold]
          Width = 180
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
        end
        item
          FieldName = 'st_reg'
          Title.Alignment = taCenter
          Title.Caption = ' St'
          Title.Font.Style = [fsBold]
          Width = 28
          Alignment = taCenter
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
        Height = 107.913420000000000000
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
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779566610000000000
          Top = 52.913420000000000000
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
            'Periode Fact')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779566610000000000
          Top = 64.251990470000000000
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
            'Cons. Fact.')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 203.653716610000000000
          Top = 52.913420000000000000
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
            'Cat. Fact.')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 203.653716610000000000
          Top = 64.251990470000000000
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
            'Type Fact.')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 75.590573150000000000
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
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 203.653716610000000000
          Top = 75.590570710000000000
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
        object title_periodeFact_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893520420000000000
          Top = 52.913420000000000000
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
        object title_consFact_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 52.893520420000000000
          Top = 64.251990470000000000
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
        object title_catFact_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 252.787606610000000000
          Top = 52.913432200000000000
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
        object title_TypeFact_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 252.787606610000000000
          Top = 64.251990470000000000
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
        object title_typeNav_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913388260000000000
          Top = 75.590573150000000000
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
        object title_navire_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 252.787606610000000000
          Top = 75.590570710000000000
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
      end
      object ColumnHeader_sum: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 196.535560000000000000
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
          Width = 340.157480314961000000
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
          Left = 434.645596060000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'NOMBRE')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Fill.BackColor = 13421772
          HAlign = haRight
          Memo.UTF8W = (
            'MONTANT')
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
        Height = 15.118110240000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 396.850320470000000000
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
          Left = 529.133846060000000000
          Width = 132.283476770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."mt_reg">,MasterData_sum)]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 434.645950000000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Frame.Width = 0.500000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."nb_reg">,MasterData_sum)]')
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
        Top = 385.512060000000000000
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
        object SysMemo4: TfrxSysMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 611.448536960000000000
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
      end
      object MasterData_sum: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 272.126160000000000000
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
          Width = 340.157480314961000000
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
          Left = 434.645596060000000000
          Top = -0.028424360000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
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
        object sum_montant_data: TfrxMemoView
          AllowVectorExport = True
          Left = 529.134200000000000000
          Width = 132.283464570000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
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
        Top = 464.882190000000000000
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
          Width = 37.795275590551200000
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
          Left = 37.795275590551200000
          Width = 60.472440940000000000
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
            'Date')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 98.267716530551200000
          Width = 94.488188980000000000
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
            'Facture Reg.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 192.755905510551200000
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
            'Type Fact.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 268.346456690551200000
          Width = 60.472440944881900000
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
            'Date Fact.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1016.692913381731000000
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
          Left = 729.448818893543300000
          Width = 143.622047244094000000
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
            'Consignataire Reg.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 873.070866137637300000
          Width = 143.622047244094000000
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
        object Memo16: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 661.417322833543300000
          Width = 68.031496060000000000
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
            'Type Nav.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 328.818897635433100000
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
            'Mt Fact')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 502.677165355433100000
          Width = 7.559055118110240000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 415.748031495433100000
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
            'Mt R'#233'gl'#233)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 510.236220473543300000
          Width = 151.181102360000000000
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
            'LISTE DES REGLEMENTS')
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
          Left = 1.779530000000000000
          Top = 32.015770000000000000
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
            'Periode Fact')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779530000000000000
          Top = 43.354340470000000000
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
            'Cons. Fact.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 201.653680000000000000
          Top = 32.015770000000000000
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
            'Cat. Fact.')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 201.653680000000000000
          Top = 43.354340470000000000
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
            'Type Fact.')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 1.779493390000000000
          Top = 54.692923150000000000
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
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 201.653680000000000000
          Top = 54.692920710000000000
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
        object title_periodeFact: TfrxMemoView
          AllowVectorExport = True
          Left = 50.893483810000000000
          Top = 32.015770000000000000
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
        object title_consFact: TfrxMemoView
          AllowVectorExport = True
          Left = 50.893483810000000000
          Top = 43.354340470000000000
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
        object title_catFact: TfrxMemoView
          AllowVectorExport = True
          Left = 250.787570000000000000
          Top = 32.015782200000000000
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
        object title_TypeFact: TfrxMemoView
          AllowVectorExport = True
          Left = 250.787570000000000000
          Top = 43.354340470000000000
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
          Left = 50.913351650000000000
          Top = 54.692923150000000000
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
          Left = 250.787570000000000000
          Top = 54.692920710000000000
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
        Top = 291.023810000000000000
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
          StretchMode = smMaxHeight
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
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_regle"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 98.267716530000000000
          Width = 94.488188980000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."ref_facture_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 192.755905510000000000
          Width = 75.590551180000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
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
          Left = 268.346456690000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
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
        object Memo25: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1016.692913376298000000
          Width = 26.456692910000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset."st_reg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 729.448818888110200000
          Width = 143.622047244094000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."cons_reg"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 873.070866132204200000
          Width = 143.622047244094000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
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
        object Memo29: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 661.417322828110200000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_type_nav"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 328.818897630000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
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
          Left = 502.677165350000000000
          Width = 7.559055118110240000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 415.748031490000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
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
            '[frxDBDataset."montant_regle"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 510.236220468110200000
          Width = 151.181102360000000000
          Height = 15.118110240000000000
          StretchMode = smMaxHeight
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
      end
      object GroupHeader: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897637800000000000
        Top = 249.448980000000000000
        Width = 1069.606990000000000000
        Condition = 'frxDBDataset_reglement.""'
        ReprintOnNewPage = True
        StartNewPage = True
        object title_group: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Top = -1.220470000000000000
          Width = 1043.150280000000000000
          Height = 18.897637800000000000
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
      object ReportSummary: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795275590551180000
        Top = 404.409710000000000000
        Width = 1069.606990000000000000
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 19.000000000000000000
          Width = 1043.150280000000000000
          Height = 18.897650000000000000
          Fill.BackColor = 15000804
          Fill.ForeColor = clNone
          Frame.Typ = []
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Top = 19.000000000000000000
          Width = 328.818780470000000000
          Height = 18.897637800000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TOTAL GENERAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 415.747970470000000000
          Top = 19.000000000000000000
          Width = 86.929116770000000000
          Height = 18.897637800000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."montant_regle">,MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 328.819110000000000000
        Width = 1069.606990000000000000
        object Shape2: TfrxShapeView
          AllowVectorExport = True
          Width = 1043.150280000000000000
          Height = 15.118110240000000000
          Fill.ForeColor = clNone
          Frame.Typ = []
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Width = 328.818780470000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
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
          Left = 415.747970470000000000
          Width = 86.929116770000000000
          Height = 15.118110240000000000
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset."montant_regle">,MasterData_main)]')
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

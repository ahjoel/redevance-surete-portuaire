object FEtatsEscale: TFEtatsEscale
  Left = 0
  Top = 0
  ClientHeight = 723
  ClientWidth = 1395
  Caption = 'Editions Etats des Navires Accost'#233's'
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
    Width = 1395
    Height = 723
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -319
    ExplicitWidth = 1432
    ExplicitHeight = 700
    object DBGrid: TUniDBGrid
      Left = 0
      Top = 156
      Width = 1395
      Height = 528
      Hint = ''
      TitleFont.Style = [fsBold]
      DataSource = DM.DS_Grid_Escale
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
      ReadOnly = True
      WebOptions.Paged = False
      WebOptions.PageSize = 200
      LoadMask.Message = 'Loading data...'
      StripeRows = False
      Align = alClient
      TabOrder = 1
      OnRecordCount = DBGridRecordCount
      Columns = <
        item
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = 'id'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
          ReadOnly = True
        end
        item
          FieldName = 'ref_ex'
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
          FieldName = 'num_port'
          Title.Alignment = taCenter
          Title.Caption = 'Ref Port'
          Title.Font.Style = [fsBold]
          Width = 70
          Alignment = taRightJustify
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'nom_navire'
          Title.Alignment = taCenter
          Title.Caption = 'Navire'
          Title.Font.Style = [fsBold]
          Width = 176
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_type_nav'
          Title.Alignment = taCenter
          Title.Caption = 'Type'
          Title.Font.Style = [fsBold]
          Width = 44
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'statut'
          Title.Alignment = taCenter
          Title.Caption = 'St'
          Title.Font.Style = [fsBold]
          Width = 33
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          ShowToolTipAlways = False
          FieldName = 'nom_consignataire'
          Title.Alignment = taCenter
          Title.Caption = 'Consignataire'
          Title.Font.Style = [fsBold]
          Width = 154
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_rade'
          Title.Alignment = taCenter
          Title.Caption = 'Rade'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_accost'
          Title.Alignment = taCenter
          Title.Caption = 'Accostage'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'date_depart'
          Title.Alignment = taCenter
          Title.Caption = 'Depart'
          Title.Font.Style = [fsBold]
          Width = 90
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_pq'
          Title.Alignment = taCenter
          Title.Caption = ' Poste'
          Title.Font.Style = [fsBold]
          Width = 46
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'orgine'
          Title.Alignment = taCenter
          Title.Caption = ' Provenance'
          Title.Font.Style = [fsBold]
          Width = 91
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'destination'
          Title.Alignment = taCenter
          Title.Caption = ' Destination'
          Title.Font.Style = [fsBold]
          Width = 84
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'tonne_brut'
          Title.Alignment = taCenter
          Title.Caption = 'TN Brut'
          Title.Font.Style = [fsBold]
          Width = 64
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'tonne_net'
          Title.Alignment = taCenter
          Title.Caption = ' TN Net'
          Title.Font.Style = [fsBold]
          Width = 64
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'code_obs'
          Title.Alignment = taCenter
          Title.Caption = ' OBS'
          Title.Font.Style = [fsBold]
          Width = 41
          ReadOnly = True
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
          FieldName = 'rapport_esc'
          Title.Alignment = taCenter
          Title.Caption = ' R'
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
          Alignment = taCenter
          ReadOnly = True
          Menu.MenuEnabled = False
          Menu.ColumnHideable = False
        end
        item
          FieldName = 'fact_pal'
          Title.Alignment = taCenter
          Title.Caption = ' FP'
          Title.Font.Style = [fsBold]
          Width = 30
          Alignment = taCenter
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
        end
        item
          FieldName = 'commentaire_validate'
          Title.Alignment = taCenter
          Title.Caption = 'commentaire_validate'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'rapport_control'
          Title.Caption = 'rapport_control'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end
        item
          FieldName = 'rapport_validate'
          Title.Caption = 'rapport_validate'
          Title.Font.Style = [fsBold]
          Width = 64
          Visible = False
        end>
    end
    object UniContainerPanel1: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 1395
      Height = 36
      Hint = ''
      ParentColor = False
      Align = alTop
      TabOrder = 2
      object PanTitle: TUniPanel
        Left = 35
        Top = 0
        Width = 1360
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
        Caption = 'Etats Escales'
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
      Width = 1389
      Height = 114
      Hint = ''
      Caption = 'Options de Recherche'
      Align = alTop
      TabOrder = 3
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
      object GBInstaPost: TUniGroupBox
        Left = 735
        Top = 16
        Width = 362
        Height = 45
        Hint = ''
        Caption = 'IP et  Postes'
        TabOrder = 3
        object DBLInstallationPort: TUniDBLookupComboBox
          Left = 10
          Top = 15
          Width = 191
          Hint = ''
          ListField = 'libelle_ip'
          ListSource = DM.DS_DBL_IP
          KeyField = 'id_ip'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
          Style = csDropDown
          OnChange = DBLInstallationPortChange
        end
        object DBLPostQuai: TUniDBLookupComboBox
          Left = 224
          Top = 15
          Width = 121
          Hint = ''
          ListField = 'libelle_pq'
          ListSource = DM.DS_DBL_PQ
          KeyField = 'id_pq'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 2
          Color = clWindow
          Style = csDropDown
        end
      end
      object GBObs: TUniGroupBox
        Left = 247
        Top = 63
        Width = 281
        Height = 45
        Hint = ''
        Caption = 'Observation'
        TabOrder = 4
        object DBLObs: TUniDBLookupComboBox
          Left = 8
          Top = 15
          Width = 254
          Hint = ''
          ListField = 'libelle_obs'
          ListSource = DM.DS_DBL_Obs
          KeyField = 'id_obs'
          ListFieldIndex = 0
          ClearButton = True
          TabOrder = 1
          Color = clWindow
        end
      end
      object GBTypeNav: TUniGroupBox
        Left = 537
        Top = 16
        Width = 187
        Height = 45
        Hint = ''
        Caption = 'Type Navire'
        TabOrder = 5
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
      object GBFacturable: TUniGroupBox
        Left = 537
        Top = 63
        Width = 99
        Height = 45
        Hint = ''
        Caption = 'Facturable'
        TabOrder = 6
        object CBFacturable: TUniComboBox
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
      object GBFacturePAL: TUniGroupBox
        Left = 648
        Top = 63
        Width = 100
        Height = 45
        Hint = ''
        Caption = 'Factur'#233' PAL'
        TabOrder = 7
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
        Left = 760
        Top = 63
        Width = 100
        Height = 45
        Hint = ''
        Caption = 'Factur'#233' Int'
        TabOrder = 8
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
        TabOrder = 9
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
        Left = 1237
        Top = 18
        Width = 147
        Height = 91
        Hint = ''
        Align = alRight
        TabOrder = 10
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
    end
    object UniContainerPanel2: TUniContainerPanel
      AlignWithMargins = True
      Left = 3
      Top = 687
      Width = 1389
      Height = 33
      Hint = ''
      ParentColor = False
      Color = clInfoBk
      Align = alBottom
      TabOrder = 4
      object BtnExport: TUniButton
        AlignWithMargins = True
        Left = 1230
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
        Left = 1311
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
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'frxDBDataset_esc'
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
    ReportOptions.LastChange = 44874.586629074100000000
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
        DataSetName = 'frxDBDataset_esc'
      end
      item
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_esc'
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
        Height = 115.472480000000000000
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
            'LISTE DES ESCALES')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 59.413984780000000000
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
            'Facturable')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 70.752555250000000000
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
            'Observation')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 82.091137930000000000
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
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 358.614410000000000000
          Top = 59.413984780000000000
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
            'Inst. Port.')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 358.614410000000000000
          Top = 70.752555250000000000
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
            'Poste Quai')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 358.614410000000000000
          Top = 82.091137930000000000
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
          Left = 158.740260000000000000
          Top = 93.429720610000000000
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
          Left = 358.614410000000000000
          Top = 93.429720610000000000
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
        object title_statut_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 207.854213810000000000
          Top = 59.413984780000000000
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
        object title_obs_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 207.854213810000000000
          Top = 70.752555250000000000
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
        object title_factPAL_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 207.854213810000000000
          Top = 82.091137930000000000
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
          Left = 207.854213810000000000
          Top = 93.429720610000000000
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
        object title_instPort_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 407.748300000000000000
          Top = 59.413996980000000000
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
        object title_postQuai_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 407.748300000000000000
          Top = 70.752555250000000000
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
          Left = 407.748300000000000000
          Top = 82.091137930000000000
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
          Left = 407.748300000000000000
          Top = 93.429720610000000000
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
          Top = 48.354360000000000000
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
        Height = 15.118110236220470000
        Top = 204.094620000000000000
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
        Height = 15.118110236220470000
        Top = 355.275820000000000000
        Width = 718.110700000000000000
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 37.795275590000000000
          Width = 510.236220470000000000
          Height = 15.118110236220470000
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
          Height = 15.118110236220470000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."nb_esc">,MasterData_sum)]')
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
        Top = 393.071120000000000000
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
        Height = 15.118110236220470000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_esc'
        RowCount = 0
        object Memo50: TfrxMemoView
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
          Memo.UTF8W = (
            '')
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
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
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
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 940.267646960000000000
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
        Width = 1046.929810000000000000
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
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 45.354330708661400000
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
          Left = 45.354330708661400000
          Width = 60.472440940000000000
          Height = 18.897637795275600000
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
        object Memo9: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 105.826771648661400000
          Width = 49.133858267716500000
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
            'Port')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 154.960629916377900000
          Width = 151.181102362205000000
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
          Left = 306.141732278582900000
          Width = 41.574803149606300000
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
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 347.716535428189200000
          Width = 26.456692913385800000
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
            'St')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 374.173228341575000000
          Width = 151.181102362205000000
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
          Left = 525.354330703780000000
          Width = 64.251968500000000000
          Height = 18.897637795275600000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Accost.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 589.606299203780000000
          Width = 64.251968500000000000
          Height = 18.897637795275600000
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
        object Memo16: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 653.858267703780000000
          Width = 37.795275590000000000
          Height = 18.897637795275600000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Poste')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 691.653543293780000000
          Width = 120.944881889764000000
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
            'Provenance')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 812.598425183544000000
          Width = 120.944881889764000000
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
            'Destination')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 933.543307073308000000
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
          Memo.UTF8W = (
            'F INT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 971.338582663308000000
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
          Memo.UTF8W = (
            'F PAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1009.133858253308000000
          Width = 37.795275590000000000
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
            'Obs')
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
        Height = 86.929190000000000000
        ParentFont = False
        Top = 71.811070000000000000
        Width = 1046.929810000000000000
        object title_report: TfrxMemoView
          AllowVectorExport = True
          Top = -2.220470000000000000
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
            'LISTE DES ESCALES')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 29.897650000000000000
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
            'Facturable')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 41.236220470000000000
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
            'Observation')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 52.574803150000000000
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
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 29.897650000000000000
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
            'Inst. Port.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 41.236220470000000000
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
            'Poste Quai')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 52.574803150000000000
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
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 63.913385830000000000
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
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 63.913385830000000000
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
        object title_statut: TfrxMemoView
          AllowVectorExport = True
          Left = 50.011603810000000000
          Top = 29.897650000000000000
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
        object title_obs: TfrxMemoView
          AllowVectorExport = True
          Left = 50.011603810000000000
          Top = 41.236220470000000000
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
        object title_factPal: TfrxMemoView
          AllowVectorExport = True
          Left = 50.011603810000000000
          Top = 52.574803150000000000
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
          Left = 50.011603810000000000
          Top = 63.913385830000000000
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
        object title_instPort: TfrxMemoView
          AllowVectorExport = True
          Left = 249.905690000000000000
          Top = 29.897662200000000000
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
        object title_postQuai: TfrxMemoView
          AllowVectorExport = True
          Left = 249.905690000000000000
          Top = 41.236220470000000000
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
          Left = 249.905690000000000000
          Top = 52.574803150000000000
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
          Left = 249.905690000000000000
          Top = 63.913385830000000000
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
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000010000000000
          Top = 17.058495220000000000
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
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_esc'
        RowCount = 0
        object Memo6: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 45.354330710000000000
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
          Left = 45.354330710000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."ref"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 105.826771650000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."num_port"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 154.960629920000000000
          Width = 151.181102362205000000
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
        object Memo24: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 306.141732282205000000
          Width = 41.574803149606300000
          Height = 15.118110240000000000
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
        object Memo25: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 347.716535431811300000
          Width = 26.456692910000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."statut"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 374.173228341811300000
          Width = 151.181102360000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."nom_consignataire"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 525.354330701811300000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_accost"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 589.606299201811300000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_depart"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 653.858267701811300000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_pq"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 691.653543291811300000
          Width = 120.944881889764000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."orgine"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 812.598425181575300000
          Width = 120.944881889764000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."destination"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 933.543307071339300000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."fact_int"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 971.338582661339300000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."fact_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1009.133858251339000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_obs"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object frxDBDataset_sum: TfrxDBDataset
    UserName = 'frxDBDataset_sum_esc'
    CloseDataSource = False
    DataSet = DM.QSum
    BCDToCurrency = False
    Left = 152
    Top = 264
  end
  object frxReport_group: TfrxReport
    Version = '6.9.15'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44860.737619745400000000
    ReportOptions.LastChange = 44881.398302546300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'procedure Memo58OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  if Engine.FinalPass Then'
      '  count_group.Text := '#39'[COUNT(MasterData_main)]'#39';      '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 264
    Top = 336
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_esc'
      end
      item
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_esc'
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
        Height = 115.472480000000000000
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
            'LISTE DES ESCALES')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 59.413984780000000000
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
            'Facturable')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 70.752555250000000000
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
            'Observation')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 82.091137930000000000
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
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 358.614410000000000000
          Top = 59.413984780000000000
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
            'Inst. Port.')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 358.614410000000000000
          Top = 70.752555250000000000
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
            'Poste Quai')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 358.614410000000000000
          Top = 82.091137930000000000
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
          Left = 158.740260000000000000
          Top = 93.429720610000000000
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
          Left = 358.614410000000000000
          Top = 93.429720610000000000
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
        object title_statut_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 207.854213810000000000
          Top = 59.413984780000000000
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
        object title_obs_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 207.854213810000000000
          Top = 70.752555250000000000
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
        object title_factPAL_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 207.854213810000000000
          Top = 82.091137930000000000
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
          Left = 207.854213810000000000
          Top = 93.429720610000000000
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
        object title_instPort_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 407.748300000000000000
          Top = 59.413996980000000000
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
        object title_postQuai_sum: TfrxMemoView
          AllowVectorExport = True
          Left = 407.748300000000000000
          Top = 70.752555250000000000
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
          Left = 407.748300000000000000
          Top = 82.091137930000000000
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
          Left = 407.748300000000000000
          Top = 93.429720610000000000
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
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 204.094620000000000000
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
        Top = 355.275820000000000000
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
          Height = 15.118110236220500000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset_sum."nb_esc">,MasterData_sum)]')
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
        Top = 393.071120000000000000
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
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset_sum
        DataSetName = 'frxDBDataset_sum_esc'
        RowCount = 0
        object Memo50: TfrxMemoView
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
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
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
        Top = 411.968770000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 940.267646960000000000
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
        Width = 1046.929810000000000000
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
        Top = 181.417440000000000000
        Width = 1046.929810000000000000
        object Memo7: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 45.354330708661400000
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
          Left = 45.354330708661400000
          Width = 60.472440940000000000
          Height = 18.897637795275600000
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
        object Memo9: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 105.826771648661400000
          Width = 49.133858267716500000
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
            'Port')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 154.960629916377900000
          Width = 151.181102362205000000
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
          Left = 306.141732278582900000
          Width = 41.574803149606300000
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
        object Memo12: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 347.716535428189200000
          Width = 26.456692913385800000
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
            'St')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo13: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 374.173228341575000000
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
            'Consignataire')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo14: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 525.354330701575000000
          Width = 64.251968500000000000
          Height = 18.897637795275600000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Accost.')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 589.606299201575000000
          Width = 64.251968500000000000
          Height = 18.897637795275600000
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
        object Memo16: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 653.858267701575000000
          Width = 37.795275590000000000
          Height = 18.897637795275600000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Fill.BackColor = 15000804
          Memo.UTF8W = (
            'Poste')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo17: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 691.653543291575000000
          Width = 120.944881889764000000
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
            'Provenance')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 812.598425181339000000
          Width = 120.944881889764000000
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
            'Destination')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo19: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 933.543307071103000000
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
          Memo.UTF8W = (
            'F INT')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 971.338582661103000000
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
          Memo.UTF8W = (
            'F PAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo43: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1009.133858251103000000
          Width = 37.795275590000000000
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
            'Obs')
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
        Height = 86.929190000000000000
        ParentFont = False
        Top = 71.811070000000000000
        Width = 1046.929810000000000000
        object title_report: TfrxMemoView
          AllowVectorExport = True
          Top = -2.220470000000000000
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
            'LISTE DES ESCALES')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 29.897650000000000000
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
            'Facturable')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 41.236220470000000000
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
            'Observation')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 52.574803150000000000
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
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 29.897650000000000000
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
            'Inst. Port.')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 41.236220470000000000
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
            'Poste Quai')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 52.574803150000000000
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
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 0.897650000000000000
          Top = 63.913385830000000000
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
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 200.771800000000000000
          Top = 63.913385830000000000
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
        object title_statut: TfrxMemoView
          AllowVectorExport = True
          Left = 50.011603810000000000
          Top = 29.897650000000000000
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
        object title_obs: TfrxMemoView
          AllowVectorExport = True
          Left = 50.011603810000000000
          Top = 41.236220470000000000
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
        object title_factPal: TfrxMemoView
          AllowVectorExport = True
          Left = 50.011603810000000000
          Top = 52.574803150000000000
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
          Left = 50.011603810000000000
          Top = 63.913385830000000000
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
        object title_instPort: TfrxMemoView
          AllowVectorExport = True
          Left = 249.905690000000000000
          Top = 29.897662200000000000
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
        object title_postQuai: TfrxMemoView
          AllowVectorExport = True
          Left = 249.905690000000000000
          Top = 41.236220470000000000
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
          Left = 249.905690000000000000
          Top = 52.574803150000000000
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
          Left = 249.905690000000000000
          Top = 63.913385830000000000
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
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000010000000000
          Top = 17.058495220000000000
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
        Top = 298.582870000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset
        DataSetName = 'frxDBDataset_esc'
        RowCount = 0
        object Memo6: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 45.354330710000000000
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
          Left = 45.354330710000000000
          Width = 60.472440940000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."ref"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo22: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 105.826771650000000000
          Width = 49.133858270000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."num_port"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 154.960629920000000000
          Width = 151.181102360000000000
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
        object Memo24: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 306.141732280000000000
          Width = 41.574803149606300000
          Height = 15.118110240000000000
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
        object Memo25: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 347.716535429606300000
          Width = 26.456692910000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."statut"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo26: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 374.173228339606300000
          Width = 151.181102360000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."nom_consignataire"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo27: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 525.354330699606300000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_accost"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo28: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 589.606299199606300000
          Width = 64.251968500000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."date_depart"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo29: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 653.858267699606300000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_pq"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo30: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 691.653543289606300000
          Width = 120.944881889764000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."orgine"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo31: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 812.598425179370300000
          Width = 120.944881890000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."destination"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 933.543307069370300000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."fact_int"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 971.338582659370300000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."fact_pal"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Left = 1009.133858249370000000
          Width = 37.795275590000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Frame.Typ = [ftRight, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."code_obs"]')
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
        Top = 260.787570000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset.""'
        StartNewPage = True
        object title_group: TfrxMemoView
          Align = baLeft
          AllowVectorExport = True
          Width = 944.882500000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          Memo.UTF8W = (
            '[frxDBDataset."nom_consignataire"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object count_group: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          OnBeforePrint = 'Memo58OnBeforePrint'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = [ftRight, ftTop, ftBottom]
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 15.118110240000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object Memo59: TfrxMemoView
          Align = baRight
          AllowVectorExport = True
          Left = 944.882500000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          Frame.Typ = []
          Frame.Width = 0.100000000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData_main)]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
end

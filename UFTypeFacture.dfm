object FTypeFacture: TFTypeFacture
  Left = 0
  Top = 0
  ClientHeight = 321
  ClientWidth = 598
  Caption = 'Types Facture'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object PType: TUniPageControl
    Left = 0
    Top = 0
    Width = 598
    Height = 321
    Hint = ''
    ActivePage = PageCategorie
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -24
    ExplicitWidth = 563
    object PageCategorie: TUniTabSheet
      Hint = ''
      Caption = 'Categorie Facture'
      object UniPanel3: TUniPanel
        Left = 0
        Top = 0
        Width = 590
        Height = 27
        Hint = ''
        Align = alTop
        ParentFont = False
        Font.Color = clBlack
        Font.Height = -12
        Font.Style = [fsBold]
        TabOrder = 0
        Title = 'Escales'
        Caption = 'Categories Facture'
        Color = clWhite
        Layout = 'column'
      end
      object UniPanel4: TUniPanel
        Left = 0
        Top = 27
        Width = 590
        Height = 60
        Hint = ''
        Align = alTop
        TabOrder = 1
        Caption = ''
        object EdLibCat: TUniEdit
          Left = 12
          Top = 25
          Width = 157
          Hint = ''
          CharCase = ecUpperCase
          MaxLength = 50
          Text = ''
          TabOrder = 1
        end
        object UniLabel3: TUniLabel
          Left = 12
          Top = 6
          Width = 29
          Height = 13
          Hint = ''
          Caption = 'Libell'#233
          TabOrder = 3
        end
        object UniSimplePanel2: TUniSimplePanel
          AlignWithMargins = True
          Left = 501
          Top = 4
          Width = 85
          Height = 52
          Hint = ''
          ParentColor = False
          Align = alRight
          TabOrder = 4
          object BtSaveCF: TUniButton
            Left = 0
            Top = 0
            Width = 85
            Height = 25
            Hint = ''
            Caption = 'Enregistrer'
            Align = alTop
            TabOrder = 1
            IconCls = 'bookmarks'
            OnClick = BtSaveCFClick
          end
          object BtnCancelCF: TUniButton
            Left = 0
            Top = 27
            Width = 85
            Height = 25
            Hint = ''
            Caption = 'Annuler'
            Align = alBottom
            TabOrder = 2
            IconCls = 'delete'
            OnClick = BtnCancelCFClick
          end
        end
        object EdCodeCat: TUniEdit
          Left = 196
          Top = 25
          Width = 93
          Hint = ''
          CharCase = ecUpperCase
          MaxLength = 15
          Text = ''
          TabOrder = 2
        end
        object UniLabel4: TUniLabel
          Left = 196
          Top = 6
          Width = 25
          Height = 13
          Hint = ''
          Caption = 'Code'
          TabOrder = 5
        end
      end
      object UniPanel5: TUniPanel
        Left = 0
        Top = 87
        Width = 44
        Height = 206
        Hint = ''
        Align = alLeft
        TabOrder = 2
        Caption = ''
        object BtnAddCF: TUniButton
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 36
          Height = 30
          Hint = 'Ajouter'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Ajouter'
          Align = alTop
          TabOrder = 1
          IconAlign = iaTop
          IconCls = 'add'
          OnClick = BtnAddCFClick
        end
        object BtnUpdateCF: TUniButton
          AlignWithMargins = True
          Left = 4
          Top = 40
          Width = 36
          Height = 30
          Hint = 'Modifier'
          ShowHint = True
          ParentShowHint = False
          Caption = 'Modifier'
          Align = alTop
          TabOrder = 2
          IconAlign = iaTop
          IconCls = 'compose'
          OnClick = BtnUpdateCFClick
        end
        object BtnDeleteCF: TUniButton
          AlignWithMargins = True
          Left = 4
          Top = 76
          Width = 36
          Height = 30
          Hint = 'Supprimer'
          Enabled = False
          ShowHint = True
          ParentShowHint = False
          Caption = 'Supprimer'
          Align = alTop
          TabOrder = 3
          IconAlign = iaTop
          IconCls = 'trash'
        end
      end
      object DBGridCF: TUniDBGrid
        Left = 44
        Top = 87
        Width = 546
        Height = 206
        Hint = ''
        DataSource = DM.DS_Grid_CatFact
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
        ReadOnly = True
        WebOptions.Paged = False
        LoadMask.Message = 'Loading data...'
        StripeRows = False
        Align = alClient
        TabOrder = 3
        OnRecordCount = DBGridCFRecordCount
        Columns = <
          item
            FieldName = 'id_cat'
            Title.Alignment = taCenter
            Title.Caption = 'id'
            Title.Font.Style = [fsBold]
            Width = 64
            Visible = False
          end
          item
            FieldName = 'libelle_cat_fact'
            Title.Alignment = taCenter
            Title.Caption = 'Libell'#233
            Title.Font.Style = [fsBold]
            Width = 257
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end
          item
            FieldName = 'code_cat_fact'
            Title.Alignment = taCenter
            Title.Caption = 'Code'
            Title.Font.Style = [fsBold]
            Width = 114
            Menu.MenuEnabled = False
            Menu.ColumnHideable = False
          end>
      end
    end
    object PageType: TUniTabSheet
      Hint = ''
      Caption = 'Types Facture'
      OnBeforeActivate = PageTypeBeforeActivate
      object UniContainerPanel1: TUniContainerPanel
        Left = 0
        Top = 0
        Width = 590
        Height = 293
        Hint = ''
        ParentColor = False
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 555
        object PanTitle: TUniPanel
          Left = 0
          Top = 0
          Width = 590
          Height = 27
          Hint = ''
          Align = alTop
          ParentFont = False
          Font.Color = clBlack
          Font.Height = -12
          Font.Style = [fsBold]
          TabOrder = 1
          Title = 'Escales'
          Caption = 'Types Facture'
          Color = clWhite
          Layout = 'column'
        end
        object UniPanel1: TUniPanel
          Left = 0
          Top = 27
          Width = 590
          Height = 60
          Hint = ''
          Align = alTop
          TabOrder = 2
          Caption = ''
          object EdLibelle: TUniEdit
            Left = 12
            Top = 25
            Width = 157
            Hint = ''
            CharCase = ecUpperCase
            MaxLength = 50
            Text = ''
            TabOrder = 1
          end
          object UniLabel2: TUniLabel
            Left = 12
            Top = 6
            Width = 29
            Height = 13
            Hint = ''
            Caption = 'Libell'#233
            TabOrder = 3
          end
          object UniSimplePanel1: TUniSimplePanel
            AlignWithMargins = True
            Left = 501
            Top = 4
            Width = 85
            Height = 52
            Hint = ''
            ParentColor = False
            Align = alRight
            TabOrder = 4
            object BtnSaveTF: TUniButton
              Left = 0
              Top = 0
              Width = 85
              Height = 25
              Hint = ''
              Caption = 'Enregistrer'
              Align = alTop
              TabOrder = 1
              IconCls = 'bookmarks'
              OnClick = BtnSaveTFClick
            end
            object BtnCancelTF: TUniButton
              Left = 0
              Top = 27
              Width = 85
              Height = 25
              Hint = ''
              Caption = 'Annuler'
              Align = alBottom
              TabOrder = 2
              IconCls = 'delete'
              OnClick = BtnCancelTFClick
            end
          end
          object EdCode: TUniEdit
            Left = 196
            Top = 25
            Width = 93
            Hint = ''
            CharCase = ecUpperCase
            MaxLength = 15
            Text = ''
            TabOrder = 2
          end
          object UniLabel1: TUniLabel
            Left = 196
            Top = 6
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Code'
            TabOrder = 5
          end
          object UniLabel5: TUniLabel
            Left = 316
            Top = 6
            Width = 47
            Height = 13
            Hint = ''
            Caption = 'Cat'#233'gorie'
            TabOrder = 6
          end
          object DBLCat: TUniDBLookupComboBox
            Left = 316
            Top = 25
            Width = 173
            Hint = ''
            ListField = 'libelle_cat_fact'
            ListSource = DM.DS_DBL_Cat_Fact
            KeyField = 'id_cat'
            ListFieldIndex = 0
            ClearButton = True
            TabOrder = 7
            Color = clWindow
          end
        end
        object UniPanel2: TUniPanel
          Left = 0
          Top = 87
          Width = 44
          Height = 206
          Hint = ''
          Align = alLeft
          TabOrder = 3
          Caption = ''
          object BtnAddTF: TUniButton
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 36
            Height = 30
            Hint = 'Ajouter'
            ShowHint = True
            ParentShowHint = False
            Caption = 'Ajouter'
            Align = alTop
            TabOrder = 1
            IconAlign = iaTop
            IconCls = 'add'
            OnClick = BtnAddTFClick
          end
          object BtnUpdateTF: TUniButton
            AlignWithMargins = True
            Left = 4
            Top = 40
            Width = 36
            Height = 30
            Hint = 'Modifier'
            ShowHint = True
            ParentShowHint = False
            Caption = 'Modifier'
            Align = alTop
            TabOrder = 2
            IconAlign = iaTop
            IconCls = 'compose'
            OnClick = BtnUpdateTFClick
          end
          object BtnDeleteTF: TUniButton
            AlignWithMargins = True
            Left = 4
            Top = 76
            Width = 36
            Height = 30
            Hint = 'Supprimer'
            Enabled = False
            ShowHint = True
            ParentShowHint = False
            Caption = 'Supprimer'
            Align = alTop
            TabOrder = 3
            IconAlign = iaTop
            IconCls = 'trash'
          end
        end
        object DBGridTF: TUniDBGrid
          Left = 44
          Top = 87
          Width = 546
          Height = 206
          Hint = ''
          DataSource = DM.DS_Grid_TypeFact
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
          ReadOnly = True
          WebOptions.Paged = False
          LoadMask.Message = 'Loading data...'
          StripeRows = False
          Align = alClient
          TabOrder = 4
          OnRecordCount = DBGridTFRecordCount
          Columns = <
            item
              FieldName = 'id_type_fact'
              Title.Alignment = taCenter
              Title.Caption = 'id'
              Title.Font.Style = [fsBold]
              Width = 64
              Visible = False
            end
            item
              FieldName = 'libelle_type_fact'
              Title.Alignment = taCenter
              Title.Caption = 'Libell'#233
              Title.Font.Style = [fsBold]
              Width = 209
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'code_type_fact'
              Title.Alignment = taCenter
              Title.Caption = 'Code'
              Title.Font.Style = [fsBold]
              Width = 120
              Menu.MenuEnabled = False
              Menu.ColumnHideable = False
            end
            item
              FieldName = 'libelle_cat_fact'
              Title.Alignment = taCenter
              Title.Caption = ' Cat'#233'gorie'
              Title.Font.Style = [fsBold]
              Width = 175
            end>
        end
      end
    end
  end
end

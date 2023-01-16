object FUser: TFUser
  Left = 0
  Top = 0
  ClientHeight = 693
  ClientWidth = 1084
  Caption = 'Utilisateurs'
  OnShow = UniFormShow
  BorderStyle = bsSingle
  OldCreateOrder = False
  BorderIcons = [biSystemMenu]
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 1084
    Height = 693
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 906
    ExplicitHeight = 683
    object PUser: TUniPageControl
      Left = 0
      Top = 27
      Width = 1084
      Height = 666
      Hint = ''
      ActivePage = TPerms
      Align = alClient
      TabOrder = 1
      object TUser: TUniTabSheet
        Hint = ''
        Caption = 'Utilisateurs'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 1146
        ExplicitHeight = 128
        object UniContainerPanel2: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 1076
          Height = 638
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniPanel2: TUniPanel
            Left = 0
            Top = 0
            Width = 1076
            Height = 73
            Hint = ''
            Align = alTop
            TabOrder = 1
            Caption = ''
            ExplicitLeft = -25
            ExplicitTop = -2
            object UniLabel1: TUniLabel
              Left = 44
              Top = 15
              Width = 21
              Height = 13
              Hint = ''
              Caption = 'Nom'
              TabOrder = 1
            end
            object UniLabel3: TUniLabel
              Left = 343
              Top = 47
              Width = 64
              Height = 13
              Hint = ''
              Caption = 'Mot de passe'
              TabOrder = 2
            end
            object UniLabel4: TUniLabel
              Left = 452
              Top = 13
              Width = 41
              Height = 13
              Hint = ''
              Caption = 'Pr'#233'noms'
              TabOrder = 3
            end
            object UniLabel6: TUniLabel
              Left = 46
              Top = 47
              Width = 71
              Height = 13
              Hint = ''
              Caption = 'Nom utilisateur'
              TabOrder = 4
            end
            object EdLastNameUser: TUniEdit
              Left = 133
              Top = 10
              Width = 276
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 5
            end
            object EdPassUser: TUniEdit
              Left = 452
              Top = 41
              Width = 161
              Hint = ''
              Text = ''
              TabOrder = 8
            end
            object EdFirstNameUser: TUniEdit
              Left = 506
              Top = 7
              Width = 200
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 6
            end
            object EdLoginUser: TUniEdit
              Left = 133
              Top = 41
              Width = 156
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 7
            end
            object UniSimplePanel1: TUniSimplePanel
              AlignWithMargins = True
              Left = 977
              Top = 4
              Width = 95
              Height = 65
              Hint = ''
              ParentColor = False
              Align = alRight
              TabOrder = 9
              object BtnSaveUser: TUniButton
                Left = 0
                Top = 0
                Width = 95
                Height = 27
                Hint = ''
                Caption = 'Enregistrer'
                Align = alTop
                TabOrder = 1
                IconCls = 'bookmarks'
                OnClick = BtnSaveUserClick
              end
              object BtnCancelUser: TUniButton
                Left = 0
                Top = 36
                Width = 95
                Height = 29
                Hint = ''
                Caption = 'Annuler'
                Align = alBottom
                TabOrder = 2
                IconCls = 'delete'
              end
            end
            object UniLabel12: TUniLabel
              Left = 666
              Top = 47
              Width = 24
              Height = 13
              Hint = ''
              Caption = 'Profil'
              TabOrder = 10
            end
            object DBLProfilUser: TUniDBLookupComboBox
              Left = 712
              Top = 41
              Width = 233
              Hint = ''
              ListField = 'libelle_profil'
              ListSource = DM.DS_DBL_Profil_User
              KeyField = 'id_profil'
              ListFieldIndex = 0
              TabOrder = 11
              Color = clWindow
            end
          end
          object UniPanel3: TUniPanel
            Left = 0
            Top = 73
            Width = 44
            Height = 565
            Hint = ''
            Align = alLeft
            TabOrder = 2
            Caption = ''
            object BtnAddUser: TUniButton
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
            end
            object BtnUpdateUser: TUniButton
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
              OnClick = BtnUpdateUserClick
            end
            object BtnDeleteUser: TUniButton
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
          object DBGrid_User: TUniDBGrid
            Left = 44
            Top = 73
            Width = 1032
            Height = 565
            Hint = ''
            DataSource = DM.DS_Grid_User
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            LoadMask.Message = 'Loading data...'
            StripeRows = False
            Align = alClient
            TabOrder = 3
            OnRecordCount = DBGrid_UserRecordCount
            Columns = <
              item
                FieldName = 'id_user'
                Title.Alignment = taCenter
                Title.Caption = 'id'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'last_name_user'
                Title.Alignment = taCenter
                Title.Caption = 'Nom'
                Title.Font.Style = [fsBold]
                Width = 228
                DisplayMemo = True
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'first_name_user'
                Title.Alignment = taCenter
                Title.Caption = 'Pr'#233'noms'
                Title.Font.Style = [fsBold]
                Width = 166
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'libelle_profil'
                Title.Alignment = taCenter
                Title.Caption = ' Profil'
                Title.Font.Style = [fsBold]
                Width = 156
              end
              item
                ShowToolTipAlways = False
                FieldName = 'login_user'
                Title.Alignment = taCenter
                Title.Caption = 'Nom utilisateur'
                Title.Font.Style = [fsBold]
                Width = 121
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'password_user'
                Title.Alignment = taCenter
                Title.Caption = 'Mot de passe'
                Title.Font.Style = [fsBold]
                Width = 113
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'statut_user'
                Title.Alignment = taCenter
                Title.Caption = 'Actif'
                Title.Font.Style = [fsBold]
                Width = 47
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'created_user'
                Title.Alignment = taCenter
                Title.Caption = 'Date Cr'#233'ation'
                Title.Font.Style = [fsBold]
                Width = 124
                Alignment = taCenter
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
      end
      object TProfil: TUniTabSheet
        Hint = ''
        Caption = 'Profils'
        object UniContainerPanel3: TUniContainerPanel
          Left = 0
          Top = 0
          Width = 1076
          Height = 638
          Hint = ''
          ParentColor = False
          Align = alClient
          TabOrder = 0
          object UniPanel1: TUniPanel
            Left = 0
            Top = 0
            Width = 1076
            Height = 65
            Hint = ''
            Align = alTop
            TabOrder = 1
            Caption = ''
            object UniSimplePanel3: TUniSimplePanel
              AlignWithMargins = True
              Left = 977
              Top = 4
              Width = 95
              Height = 57
              Hint = ''
              ParentColor = False
              Align = alRight
              TabOrder = 1
              object BtnSaveProfil: TUniButton
                Left = 0
                Top = 0
                Width = 95
                Height = 25
                Hint = ''
                Caption = 'Enregistrer'
                Align = alTop
                TabOrder = 1
                IconCls = 'bookmarks'
                OnClick = BtnSaveProfilClick
              end
              object BtnCancelProfil: TUniButton
                Left = 0
                Top = 32
                Width = 95
                Height = 25
                Hint = ''
                Caption = 'Annuler'
                Align = alBottom
                TabOrder = 2
                IconCls = 'delete'
              end
            end
            object UniLabel2: TUniLabel
              Left = 44
              Top = 13
              Width = 29
              Height = 13
              Hint = ''
              Caption = 'Libelle'
              TabOrder = 2
            end
            object UniLabel5: TUniLabel
              Left = 393
              Top = 13
              Width = 53
              Height = 13
              Hint = ''
              Caption = 'Description'
              TabOrder = 3
            end
            object EdLibProfil: TUniEdit
              Left = 96
              Top = 13
              Width = 233
              Hint = ''
              CharCase = ecUpperCase
              Text = ''
              TabOrder = 4
            end
            object EdDescProfil: TUniMemo
              Left = 452
              Top = 13
              Width = 437
              Height = 46
              Hint = ''
              Lines.Strings = (
                'EdDescProfil')
              TabOrder = 5
            end
          end
          object UniPanel4: TUniPanel
            Left = 0
            Top = 65
            Width = 44
            Height = 573
            Hint = ''
            Align = alLeft
            TabOrder = 2
            Caption = ''
            object BtnAddProfil: TUniButton
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
              OnClick = BtnAddProfilClick
            end
            object BtnUpdateProfil: TUniButton
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
              OnClick = BtnUpdateProfilClick
            end
            object BtnDeleteProfil: TUniButton
              AlignWithMargins = True
              Left = 4
              Top = 76
              Width = 36
              Height = 30
              Hint = 'Supprimer'
              ShowHint = True
              ParentShowHint = False
              Caption = 'Supprimer'
              Align = alTop
              TabOrder = 3
              IconAlign = iaTop
              IconCls = 'trash'
            end
          end
          object DBGrid_Profil: TUniDBGrid
            Left = 44
            Top = 65
            Width = 1032
            Height = 573
            Hint = ''
            DataSource = DM.DS_Grid_Profil
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            LoadMask.Message = 'Loading data...'
            StripeRows = False
            Align = alClient
            TabOrder = 3
            OnRecordCount = DBGrid_ProfilRecordCount
            Columns = <
              item
                FieldName = 'id_profil'
                Title.Alignment = taCenter
                Title.Caption = 'id'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'libelle_profil'
                Title.Alignment = taCenter
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 235
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'description_profil'
                Title.Alignment = taCenter
                Title.Caption = 'Description'
                Title.Font.Style = [fsBold]
                Width = 548
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
      end
      object TPerms: TUniTabSheet
        Hint = ''
        Caption = 'Permissions'
        OnBeforeActivate = TPermsBeforeActivate
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 898
        ExplicitHeight = 628
        object UniPanel5: TUniPanel
          Left = 0
          Top = 0
          Width = 1076
          Height = 65
          Hint = ''
          Align = alTop
          TabOrder = 0
          Caption = ''
          object EdLibPerms: TUniEdit
            Left = 9
            Top = 27
            Width = 300
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object EdCodePerms: TUniEdit
            Left = 346
            Top = 27
            Width = 244
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object DBLParentPerms: TUniDBLookupComboBox
            Left = 619
            Top = 27
            Width = 337
            Hint = ''
            ListField = 'libelle_perms'
            ListSource = DM.DS_DBL_Perms
            KeyField = 'id_perms'
            ListFieldIndex = 0
            TabOrder = 3
            Color = clWindow
          end
          object UniSimplePanel2: TUniSimplePanel
            AlignWithMargins = True
            Left = 977
            Top = 4
            Width = 95
            Height = 57
            Hint = ''
            ParentColor = False
            Align = alRight
            TabOrder = 4
            object BtnSavePerms: TUniButton
              Left = 0
              Top = 0
              Width = 95
              Height = 25
              Hint = ''
              Caption = 'Enregistrer'
              Align = alTop
              TabOrder = 1
              IconCls = 'bookmarks'
              OnClick = BtnSavePermsClick
            end
            object BtnCancelPerms: TUniButton
              Left = 0
              Top = 32
              Width = 95
              Height = 25
              Hint = ''
              Caption = 'Annuler'
              Align = alBottom
              TabOrder = 2
              IconCls = 'delete'
            end
          end
          object UniLabel9: TUniLabel
            Left = 9
            Top = 8
            Width = 29
            Height = 13
            Hint = ''
            Caption = 'Libell'#233
            TabOrder = 5
          end
          object UniLabel10: TUniLabel
            Left = 349
            Top = 8
            Width = 25
            Height = 13
            Hint = ''
            Caption = 'Code'
            TabOrder = 6
          end
          object UniLabel11: TUniLabel
            Left = 619
            Top = 8
            Width = 61
            Height = 13
            Hint = ''
            Caption = 'Menu parent'
            TabOrder = 7
          end
        end
        object UniPanel6: TUniPanel
          Left = 44
          Top = 65
          Width = 550
          Height = 573
          Hint = ''
          Align = alLeft
          TabOrder = 1
          Caption = ''
          object UniPanel8: TUniPanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 542
            Height = 23
            Hint = ''
            Align = alTop
            ParentFont = False
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
            BorderStyle = ubsOutset
            Alignment = taLeftJustify
            Caption = 'Permissions'
          end
          object DBGridPerms: TUniDBGrid
            Left = 1
            Top = 30
            Width = 548
            Height = 542
            Hint = ''
            RowEditor = True
            DataSource = DM.DS_Grid_Perms
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.PageSize = 50
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
            OnSelectionChange = DBGridPermsSelectionChange
            OnRecordCount = DBGridPermsRecordCount
            Columns = <
              item
                FieldName = 'id_perms'
                Title.Caption = 'Id'
                Title.Font.Style = [fsBold]
                Width = 27
                Visible = False
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'libelle_perms'
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 237
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_perms'
                Title.Caption = ' Code'
                Title.Font.Style = [fsBold]
                Width = 201
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
        object UniPanel7: TUniPanel
          Left = 594
          Top = 65
          Width = 482
          Height = 573
          Hint = ''
          Align = alClient
          TabOrder = 2
          Caption = 'UniPanel7'
          object UniPanel9: TUniPanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 474
            Height = 23
            Hint = ''
            Align = alTop
            ParentFont = False
            Font.Height = -12
            Font.Style = [fsBold]
            TabOrder = 1
            BorderStyle = ubsOutset
            Alignment = taLeftJustify
            Caption = 'Sous - Permissions'
          end
          object DBGridSousPerms: TUniDBGrid
            Left = 1
            Top = 30
            Width = 480
            Height = 542
            Hint = ''
            DataSource = DM.DS_Grid_SousPerms
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            WebOptions.PageSize = 50
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 2
            Columns = <
              item
                FieldName = 'id_perms'
                Title.Caption = 'Id'
                Title.Font.Style = [fsBold]
                Width = 27
                Visible = False
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'libelle_perms'
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 237
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_perms'
                Title.Caption = ' Code'
                Title.Font.Style = [fsBold]
                Width = 200
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
        end
        object UniPanel10: TUniPanel
          Left = 0
          Top = 65
          Width = 44
          Height = 573
          Hint = ''
          Align = alLeft
          TabOrder = 3
          Caption = ''
          object BtnAddPerms: TUniButton
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
          end
          object BtnUpdatePerms: TUniButton
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
          end
          object BtnDeletePerms: TUniButton
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
      end
      object TAttribut: TUniTabSheet
        Hint = ''
        Caption = 'Attributions'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 1146
        ExplicitHeight = 128
        object UniPanel12: TUniPanel
          Left = 0
          Top = 0
          Width = 1076
          Height = 24
          Hint = ''
          Align = alTop
          ParentFont = False
          Font.Style = [fsBold]
          TabOrder = 0
          Caption = 'Attribution des Permissions'
        end
        object UniPanel13: TUniPanel
          Left = 562
          Top = 24
          Width = 514
          Height = 614
          Hint = ''
          Align = alClient
          TabOrder = 1
          Caption = ''
          object DBGridListAttrib: TUniDBGrid
            Left = 1
            Top = 35
            Width = 512
            Height = 578
            Hint = ''
            RowEditor = True
            DataSource = DM.DS_Grid_HavePerms
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            WebOptions.PageSize = 50
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
            OnRecordCount = DBGridListAttribRecordCount
            Columns = <
              item
                FieldName = 'id_have_perms'
                Title.Caption = 'Id'
                Title.Font.Style = [fsBold]
                Width = 27
                Visible = False
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'id_perms'
                Title.Alignment = taCenter
                Title.Caption = 'id_perms'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'profil'
                Title.Alignment = taCenter
                Title.Caption = 'profil'
                Title.Font.Style = [fsBold]
                Width = 64
                Visible = False
              end
              item
                FieldName = 'libelle_perms'
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 168
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_perms'
                Title.Caption = ' Code'
                Title.Font.Style = [fsBold]
                Width = 312
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
          object UniSimplePanel5: TUniSimplePanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 506
            Height = 28
            Hint = ''
            ParentColor = False
            Align = alTop
            TabOrder = 2
            ExplicitWidth = 542
            object DBLProfilAttrib: TUniDBLookupComboBox
              Left = 64
              Top = 3
              Width = 421
              Hint = ''
              ListField = 'libelle_profil'
              ListSource = DM.DS_DBL_Profil_Attrib
              KeyField = 'id_profil'
              ListFieldIndex = 0
              ClearButton = True
              TabOrder = 1
              Color = clWindow
              OnChange = DBLProfilAttribChange
            end
            object UniLabel8: TUniLabel
              Left = 3
              Top = 7
              Width = 29
              Height = 13
              Hint = ''
              Caption = 'Profil'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 2
            end
          end
        end
        object UniPanel17: TUniPanel
          Left = 0
          Top = 24
          Width = 500
          Height = 614
          Hint = ''
          Align = alLeft
          TabOrder = 2
          Caption = ''
          object DBGridListPerms: TUniDBGrid
            Left = 1
            Top = 34
            Width = 498
            Height = 579
            Hint = ''
            RowEditor = True
            DataSource = DM.DS_Grid_Perms
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgAutoRefreshRow]
            ReadOnly = True
            WebOptions.PageSize = 50
            LoadMask.Message = 'Loading data...'
            Align = alClient
            TabOrder = 1
            OnSelectionChange = DBGridPermsSelectionChange
            OnRecordCount = DBGridListPermsRecordCount
            Columns = <
              item
                FieldName = 'id_perms'
                Title.Caption = 'Id'
                Title.Font.Style = [fsBold]
                Width = 27
                Visible = False
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'libelle_perms'
                Title.Caption = 'Libell'#233
                Title.Font.Style = [fsBold]
                Width = 237
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end
              item
                FieldName = 'code_perms'
                Title.Caption = ' Code'
                Title.Font.Style = [fsBold]
                Width = 201
                Menu.MenuEnabled = False
                Menu.ColumnHideable = False
              end>
          end
          object UniSimplePanel6: TUniSimplePanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 492
            Height = 27
            Hint = ''
            ParentColor = False
            Align = alTop
            TabOrder = 2
            object UniLabel7: TUniLabel
              AlignWithMargins = True
              Left = 13
              Top = 7
              Width = 121
              Height = 13
              Hint = ''
              Alignment = taCenter
              Caption = 'Liste des Permissions'
              ParentFont = False
              Font.Style = [fsBold]
              TabOrder = 1
            end
          end
        end
        object UniPanel16: TUniPanel
          Left = 500
          Top = 24
          Width = 62
          Height = 614
          Hint = ''
          Align = alLeft
          TabOrder = 3
          Caption = ''
          object BtnAddAttrib: TUniSpeedButton
            Left = 3
            Top = 168
            Width = 54
            Height = 33
            Hint = 'Attribuer'
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00B8824DFFB8824D4DFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824D4DFFFFFF00FFFFFF00B8824DFFB8824DFFB8824D4DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824D4DFFFFFF00B8824DFFB8824DFFB8824DFFB882
              4D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824D4DB8824DB2B8824DFFB8824DFFB882
              4DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824D4DB8824DB2B8824DFFB882
              4DFFB8824DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824D4DB8824DB2B882
              4DFFB8824DFFB8824DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824D4DB882
              4DB2B8824DFFB8824DFFB8824DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824D4DB8824DB2B882
              4DFFB8824DFFB8824DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFB8824D4DB8824DB2B8824DFFB882
              4DFFB8824DFFB8824D4D97A77600FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824DFFB8824D4DB8824DB2B8824DFFB8824DFFB882
              4DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824DFFB8824D4DFFFFFF00B8824DFFB8824DFFB8824DFFB882
              4D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824DFFB8824D4DFFFFFF00FFFFFF00B8824DFFB8824DFFB8824D4DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4DFFB8824D4DFFFFFF00FFFFFF00FFFFFF00B8824DFFB8824D4DFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B882
              4D4DFFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
            Caption = ''
            ParentColor = False
            TabOrder = 1
            OnClick = BtnAddAttribClick
          end
          object BtnDelAttrib: TUniSpeedButton
            Left = 4
            Top = 216
            Width = 52
            Height = 33
            Hint = 'Retirer'
            Enabled = False
            ShowHint = True
            ParentShowHint = False
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B8824D4DFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DB8824DFFFFFF
              FF00FFFFFF00FFFFFF00B8824D4DB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DB8824DFFB8824DFFFFFF
              FF00FFFFFF00B8824D4DB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B8824D4DB8824DFFB8824DFFB8824DFFFFFF
              FF00B8824D4DB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00B8824D4DB8824DFFB8824DFFB8824DFFB8824DB2B882
              4D4DB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B8824D4DB8824DFFB8824DFFB8824DFFB8824DB2B8824D4DB882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00B8824D4DB8824DFFB8824DFFB8824DFFB8824DB2B8824D4DB8824DFFB882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00B882
              4D4DB8824DFFB8824DFFB8824DFFB8824DB2B8824D4DB8824DFFB8824DFFB882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00B8824D4DB8824DFFB8824DFFB8824DFFB8824DB2B8824D4DB8824DFFB882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF0097A77600B8824D4DB8824DFFB8824DFFB8824DFFB8824DB2B8824D4DB882
              4DFFB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00B8824D4DB8824DFFB8824DFFB8824DFFB8824DB2B882
              4D4DB8824DFFB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B8824D4DB8824DFFB8824DFFB8824DFFFFFF
              FF00B8824D4DB8824DFFB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DB8824DFFB8824DFFFFFF
              FF00FFFFFF00B8824D4DB8824DFFB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DB8824DFFFFFF
              FF00FFFFFF00FFFFFF00B8824D4DB8824DFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8824D4DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B8824D4DFFFFFF00FFFFFF00}
            Caption = ''
            ParentColor = False
            TabOrder = 2
            OnClick = BtnDelAttribClick
          end
        end
      end
    end
    object PanTitle: TUniPanel
      Left = 0
      Top = 0
      Width = 1084
      Height = 27
      Hint = ''
      Align = alTop
      ParentFont = False
      Font.Color = clBlack
      Font.Height = -12
      Font.Style = [fsBold]
      TabOrder = 2
      Title = 'Escales'
      Caption = 'Utilisateurs'
      Color = clWhite
      Layout = 'column'
    end
  end
end

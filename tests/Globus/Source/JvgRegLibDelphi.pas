{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvgRegLibDelphi.PAS, released on 2003-01-15.

The Initial Developer of the Original Code is Andrey V. Chudin,  [chudin@yandex.ru]
Portions created by Andrey V. Chudin are Copyright (C) 2003 Andrey V. Chudin.
All Rights Reserved.

Contributor(s):
Michael Beck [mbeck@bigfoot.com].

Last Modified:  2003-01-15

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}

{$I JVCL.INC}

//  this unit contains registration procedures for Delphi 4 - 7

unit JvgRegLibDelphi;

{$I glDEF.INC}

interface

//{$DEFINE INC_ALPHA_UNITS} // ������������� ����� �������������� ����������

procedure Register;

implementation

uses Classes,

  { beta version units - ������� � ������������� ���������� }
  JvgBevel, JvgLabel, JvgEdit, JvgCheckBox, JvgTreeView, JvgFlyingText, JvgPage, JvgTab,
  JvgHint, Jvg3DColors, JvgCaption, JvgProgress, JvgHShape, JvgJump,
  JvgDigits, JvgGroupBox, JvgImage, JvgShadow, JvgListBox, JvgAskListBox, JvgScrollBox, JvgGraphicButton, JvgQRLabel,
  JvgBitBtn, JvgRuler, JvgStringGrid, JvgProcess, JvgSysInf, JvgSplit, {JvgShape,}
  {JvgReport, JvgReportEditor,} JvgMailSlots, JvgExceptionHandler, JvgSpeedButton,
  JvgSingleInstance, JvgHelpPanel, JvgStringContainer, JvgSysRequirements,
  JvgSmallFontsDefence, JvgWizardHeader, {$IFDEF GLVER_D5}JvgXMLSerializer, JvgLanguageLoader, {$ENDIF}
  JvgExportComponents, JvgShadowEditor, JvgHelpPanelEditor

  { alpha version units - ���������� � ������ ��������� }
  {$IFDEF INC_ALPHA_UNITS}
  {JvgMultiResources, JvgButton,  },
  JvgPropertyCenter,
  JvgGridHeaderControl,
  JvgCrossTable,
  JvgReportParamEditor,
  JvgComponentListEditor,
  geGHC,
  JvgLogics, JvgLogicsEditor,
  JvgInspectorGrid
  {$ENDIF}
  {$IFDEF GLVER_D6}, DesignIntf, DesignWindows, DesignEditors{$ELSE}{$IFDEF GLVER_D4}, dsgnintf{$ENDIF}{$ENDIF};

procedure Register;
begin
  RegisterComponents('Gl Controls', [TJvgBevel, TJvgLabel, TJvgBitBtn, TJvgGraphicButton, TJvgMaskEdit, TJvgCheckBox, TJvgTreeView, TJvgCheckTreeView, TJvgFlyingText,
    TJvgPageControl, TJvgTabControl, TJvgProgress, TJvgHoleShape,
      TJvgDigits, TJvgShadow, TJvgGroupBox, TJvgBitmapImage, TJvgStaticTextLabel, TJvgListBox,
      TJvgCheckListBox, TJvgAskListBox, TJvgScrollBox, TJvgMaskEdit, TJvgRuler, TJvgStringGrid,
      TJvgSplitter, TJvgSpeedButton,
      TJvgHelpPanel, TJvgWizardHeader
      ]);

  RegisterComponents('Gl Components', [Tgl3DColors, TJvgCaption, TJvgHint, TJvgProcess, TJvgSysInfo,
    TJvgJumpingComponent, TJvgMailSlotServer, TJvgMailSlotClient,
      //TJvgReport, TJvgReportEditor,
    TJvgExceptionHandler, TJvgSingleInstance, TJvgStringContainer, TJvgSysRequirements,
      TJvgSmallFontsDefence {, TJvgMultipleResources}]);
  {$IFDEF GLVER_D5}
  RegisterComponents('Gl Components', [TJvgXMLSerializer, TJvgLanguageLoader]);
  {$ENDIF}

  RegisterComponents('Gl QReport', [TJvgQRLabel, TJvgQRDBText]);

  RegisterComponents('Gl ExportImport', [TJvgExportExcel, TJvgExportDBETable {, TJvgExportHTML, TJvgExportXML}]);

  {$IFDEF INC_ALPHA_UNITS}
  RegisterComponents('Gl Controls', [TJvgGridHeaderControl, TJvgInspectorGrid {, TJvgButton}]);
  RegisterComponents('Gl Components', [TJvgReportParamsEditor, TJvgLogicProducer {, TJvgMultipleResources}]);
  RegisterComponents('Gl DB', [TJvgPrintCrossTable]);

  RegisterComponentEditor(TJvgPropertyCenter, TJvgComponentListEditor);
  RegisterPropertyEditor(TypeInfo(TStringList), TJvgPropertyCenter, 'ComponentList', TJvgComponentListProperty);
  RegisterComponentEditor(TJvgReportParamsEditor, TJvgRepParamsEditor);
  RegisterComponentEditor(TJvgGridHeaderControl, TglGridHeaderControl_Editor);
  RegisterComponentEditor(TJvgLogicProducer, TJvgLogicsComponentEditor);
  {
    RegisterComponents( 'Gl Components', [ Tgl3DColors, TJvgCaption,
          TJvgHint, TJvgJumpingComponent, TJvgProcess, TJvgStringContainer,
          TJvgMultipleResources , TJvgPropertyCenter, TJvgSysInfo,
                        TJvgReport, TJvgReportEditor, TJvgReportParamsEditor] );
    RegisterComponents( 'Gl DBAware', [ TJvgDBGrid, TJvgVertDBSGrid, TJvgPrintCrossTable ] );
  }
  //  RegisterPropertyEditor(TypeInfo(string), TglEdit, 'EditMask', TMaskProperty);
  //  RegisterPropertyEditor(TypeInfo(string), TJvgProcess, 'FileName', TFilenameProperty);
  //  RegisterPropertyEditor( TypeInfo(TJvgResStringList), TJvgMultipleResources, 'Resources', TJvgResourcesProperty );
  {$ENDIF};

  //  RegisterComponentEditor(TJvgReport, TJvgReportCompEditor);
  //  RegisterPropertyEditor( TypeInfo(TStringList), TJvgReport, 'Report', TJvgRepProperty );
  //  RegisterComponentEditor(TJvgReportEditor, TJvgReportCompEditor);

  RegisterComponentEditor(TJvgShadow, TJvgShadowEditor);
  RegisterComponentEditor(TJvgHelpPanel, TJvgHelpPanelEditor);

end;

end.

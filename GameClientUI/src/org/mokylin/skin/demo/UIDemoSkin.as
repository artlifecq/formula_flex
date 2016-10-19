package org.mokylin.skin.demo
{
	import feathers.controls.text.Fontter;
	import feathers.layout.IVirtualLayout;
	import feathers.layout.TiledRowsLayout;
	import flash.filters.GlowFilter;
	import feathers.data.ListCollection;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.ComboBox;
	import feathers.controls.Group;
	import feathers.controls.Slider;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.ProgressBar;
	import feathers.controls.Radio;
	import feathers.controls.Rect;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TabBar;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.Tree;
	import feathers.controls.UIAsset;
	import feathers.controls.UIMovieClip;
	import feathers.controls.UINumber;
	import feathers.controls.Slider;
	import feathers.layout.HorizontalLayout;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.common.AutoDressEquipAlertSkin;
	import org.mokylin.skin.common.TreeNodeSkin;
	import org.mokylin.skin.common.number.UINumberSkin_sz;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.button.ButtonSkin_green_redlabel;
	import org.mokylin.skin.component.button.ButtonSkin_labelBtn;
	import org.mokylin.skin.component.check.CheckSkin_2;
	import org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin;
	import org.mokylin.skin.component.list.ListSkin;
	import org.mokylin.skin.component.progress.ProgressBarSkin_1;
	import org.mokylin.skin.component.radio.RadioButtonSkin;
	import org.mokylin.skin.component.radio.RadioSkin_3;
	import org.mokylin.skin.component.slider.HSliderChatSkin;
	import org.mokylin.skin.component.slider.VSliderChatSkin;
	import org.mokylin.skin.component.tabbar.TabBarXiaofenye;
	import org.mokylin.skin.component.text.TextAreaSkin;
	import org.mokylin.skin.component.text.TextInputSkin;
	import org.mokylin.skin.demo.MyCustomComponentSkin;
	import org.mokylin.skin.demo.UIMultiStagePanelSkin;
	import org.mokylin.skin.effect.UIMovieClipSkin_finishTask;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class UIDemoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __UIDemoSkin_HorizontalLayout1:feathers.layout.HorizontalLayout;

		public var __UIDemoSkin_TileLayout1:feathers.layout.IVirtualLayout;

		public var bg:feathers.controls.UIAsset;

		public var btn:feathers.controls.Button;

		public var btn0:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var checkBox1:feathers.controls.Check;

		public var checkBox2:feathers.controls.Check;

		public var comboBox:feathers.controls.ComboBox;

		public var grpNoLayout:feathers.controls.Group;

		public var horizontalLayoutGroup:feathers.controls.Group;

		public var hslider:feathers.controls.Slider;

		public var labHLayoutSub2:feathers.controls.Label;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var labelFilterGreen:flash.filters.GlowFilter;

		public var labelFilterRed:flash.filters.GlowFilter;

		public var labelFilterYellow:flash.filters.GlowFilter;

		public var lb:feathers.controls.Label;

		public var lb0:feathers.controls.Label;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var lb3:feathers.controls.Label;

		public var lbMuline:feathers.controls.Label;

		public var lbPos:feathers.controls.Label;

		public var lbTxtGroup:feathers.controls.Label;

		public var lbTxtLayout:feathers.controls.Label;

		public var lbTxtNo:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var matrixAsset:feathers.controls.UIAsset;

		public var mcFinish:feathers.controls.UIMovieClip;

		public var multi:feathers.controls.SkinnableContainer;

		public var myCom1:feathers.controls.SkinnableContainer;

		public var myCom2:feathers.controls.SkinnableContainer;

		public var noLayoutGrpBg:feathers.controls.UIAsset;

		public var numMc1:feathers.controls.UIMovieClip;

		public var numMc2:feathers.controls.UIMovieClip;

		public var numMc3:feathers.controls.UIMovieClip;

		public var numMc4:feathers.controls.UIMovieClip;

		public var progress:feathers.controls.ProgressBar;

		public var radio0:feathers.controls.Radio;

		public var radio1:feathers.controls.Radio;

		public var radio2:feathers.controls.Radio;

		public var slider:feathers.controls.Slider;

		public var tabbar:feathers.controls.TabBar;

		public var textArea:feathers.controls.TextArea;

		public var textInput:feathers.controls.TextInput;

		public var tileLayout:feathers.controls.Group;

		public var tree:feathers.controls.Tree;

		public var uiNumber0:feathers.controls.UINumber;

		public var uiNumber3:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function UIDemoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 620;
			this.width = 1440;
			labelFilterRed_i();
			labelFilterGreen_i();
			labelFilterBlack_i();
			labelFilterYellow_i();
			this.elementsContent = [bg_i(),uiNumber0_i(),uiNumber3_i(),tileLayout_i(),horizontalLayoutGroup_i(),__UIDemoSkin_Label25_i(),__UIDemoSkin_Label26_i(),__UIDemoSkin_Label27_i(),btnClose_i(),__UIDemoSkin_Label28_i(),grpNoLayout_i(),lb0_i(),matrixAsset_i(),tabbar_i(),checkBox1_i(),checkBox2_i(),radio1_i(),radio0_i(),radio2_i(),btn_i(),btn0_i(),lb_i(),lb1_i(),textArea_i(),textInput_i(),numMc1_i(),numMc2_i(),numMc3_i(),numMc4_i(),mcFinish_i(),list_i(),slider_i(),hslider_i(),lb2_i(),__UIDemoSkin_Rect1_i(),__UIDemoSkin_Label29_i(),tree_i(),myCom1_i(),myCom2_i(),comboBox_i(),lbPos_i(),lbMuline_i(),__UIDemoSkin_Label30_i(),__UIDemoSkin_Label31_i(),__UIDemoSkin_Label32_i(),__UIDemoSkin_Label33_i(),multi_i(),__UIDemoSkin_Button1_i(),progress_i(),__UIDemoSkin_SkinnableContainer1_i()];
			
			states = {
				init:[
						{target:"__UIDemoSkin_TileLayout1",
							name:"paddingLeft",
							value:1
						}
						,
						{target:"__UIDemoSkin_HorizontalLayout1",
							name:"paddingLeft",
							value:1
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __UIDemoSkin_ArrayCollection1_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['一','二','三','四'];
			return temp;
		}

		private function __UIDemoSkin_ArrayCollection2_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5','6','7','8'];
			return temp;
		}

		private function __UIDemoSkin_ArrayCollection3_i():feathers.data.ListCollection
		{
			var temp:feathers.data.ListCollection = new feathers.data.ListCollection();
			temp.data = ['1','2','3','4','5','6','7','8'];
			return temp;
		}

		private function __UIDemoSkin_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "lableBtn";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_labelBtn;
			temp.width = 93;
			temp.x = 730;
			temp.y = 402;
			return temp;
		}

		private function __UIDemoSkin_HorizontalLayout1_i():feathers.layout.HorizontalLayout
		{
			var temp:feathers.layout.HorizontalLayout = new feathers.layout.HorizontalLayout();
			temp.gap = 20;
			temp.horizontalAlign = "left";
			temp.paddingBottom = 1;
			__UIDemoSkin_HorizontalLayout1 = temp;
			temp.paddingRight = 1;
			temp.paddingTop = 1;
			temp.verticalAlign = "middle";
			return temp;
		}

		private function __UIDemoSkin_Label10_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF703BA;
			temp.x = 190;
			temp.y = 31;
			return temp;
		}

		private function __UIDemoSkin_Label11_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xE41313;
			temp.x = 7;
			temp.y = 62;
			return temp;
		}

		private function __UIDemoSkin_Label12_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF8F307;
			temp.x = 54;
			temp.y = 62;
			return temp;
		}

		private function __UIDemoSkin_Label13_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0DBC41;
			temp.x = 102;
			temp.y = 62;
			return temp;
		}

		private function __UIDemoSkin_Label14_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0D1DF9;
			temp.x = 149;
			temp.y = 62;
			return temp;
		}

		private function __UIDemoSkin_Label15_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF703BA;
			temp.x = 197;
			temp.y = 62;
			return temp;
		}

		private function __UIDemoSkin_Label16_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xE41313;
			temp.x = 5;
			temp.y = 95;
			return temp;
		}

		private function __UIDemoSkin_Label17_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF8F307;
			temp.x = 52;
			temp.y = 95;
			return temp;
		}

		private function __UIDemoSkin_Label18_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0DBC41;
			temp.x = 100;
			temp.y = 95;
			return temp;
		}

		private function __UIDemoSkin_Label19_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0D1DF9;
			temp.x = 147;
			temp.y = 95;
			return temp;
		}

		private function __UIDemoSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xE41313;
			temp.x = 2;
			temp.y = 0;
			return temp;
		}

		private function __UIDemoSkin_Label20_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF703BA;
			temp.x = 195;
			temp.y = 95;
			return temp;
		}

		private function __UIDemoSkin_Label21_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xE41313;
			temp.x = 0;
			temp.y = 7;
			return temp;
		}

		private function __UIDemoSkin_Label22_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0DBC41;
			temp.x = 95.5;
			temp.y = 7;
			return temp;
		}

		private function __UIDemoSkin_Label23_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0D1DF9;
			temp.x = 142.5;
			temp.y = 7;
			return temp;
		}

		private function __UIDemoSkin_Label24_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF703BA;
			temp.x = 190;
			temp.y = 7;
			return temp;
		}

		private function __UIDemoSkin_Label25_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 20;
			temp.text = "Group_HorizontalLayout";
			temp.color = 0xFB0000;
			temp.width = 241;
			temp.x = 310;
			temp.y = 44;
			return temp;
		}

		private function __UIDemoSkin_Label26_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 20;
			temp.text = "Group_VerticalLayout";
			temp.color = 0xFB0308;
			temp.width = 215;
			temp.x = 579;
			temp.y = 44;
			return temp;
		}

		private function __UIDemoSkin_Label27_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = true;
			temp.height = 20;
			temp.text = "Group_TileLayout";
			temp.color = 0xFB032D;
			temp.width = 242;
			temp.x = 311;
			temp.y = 101;
			return temp;
		}

		private function __UIDemoSkin_Label28_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.touchable = false;
			temp.text = "标题_请把本标题mouseEnable属性设为false.";
			temp.textAlign = "center";
			temp.color = 0xE0D470;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.x = 387;
			temp.y = 11;
			return temp;
		}

		private function __UIDemoSkin_Label29_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "Rect";
			temp.textAlign = "center";
			temp.color = 0xEBFC03;
			temp.width = 65;
			temp.x = 204;
			temp.y = 541;
			return temp;
		}

		private function __UIDemoSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF8F307;
			temp.x = 49;
			temp.y = 0;
			return temp;
		}

		private function __UIDemoSkin_Label30_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "复合面板";
			temp.color = 0xFFFFFF;
			temp.x = 1104;
			temp.y = 46;
			return temp;
		}

		private function __UIDemoSkin_Label31_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "树";
			temp.color = 0xFFFFFF;
			temp.x = 831;
			temp.y = 42;
			return temp;
		}

		private function __UIDemoSkin_Label32_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "列表";
			temp.color = 0xFFFFFF;
			temp.x = 320;
			temp.y = 393;
			return temp;
		}

		private function __UIDemoSkin_Label33_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "矩阵转换";
			temp.color = 0xFDFDFD;
			temp.x = 765;
			temp.y = 453;
			return temp;
		}

		private function __UIDemoSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0DBC41;
			temp.x = 97;
			temp.y = 0;
			return temp;
		}

		private function __UIDemoSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0D1DF9;
			temp.x = 144;
			temp.y = 0;
			return temp;
		}

		private function __UIDemoSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF703BA;
			temp.x = 192;
			temp.y = 0;
			return temp;
		}

		private function __UIDemoSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xE41313;
			temp.x = 0;
			temp.y = 31;
			return temp;
		}

		private function __UIDemoSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0xF8F307;
			temp.x = 47;
			temp.y = 31;
			return temp;
		}

		private function __UIDemoSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0DBC41;
			temp.x = 95;
			temp.y = 31;
			return temp;
		}

		private function __UIDemoSkin_Label9_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "标签";
			temp.color = 0x0D1DF9;
			temp.x = 142;
			temp.y = 31;
			return temp;
		}

		private function __UIDemoSkin_Rect1_i():feathers.controls.Rect
		{
			var temp:feathers.controls.Rect = new feathers.controls.Rect();
			temp.bottomLeftRadius = 5;
			temp.bottomRightRadius = 5;
			temp.fillColor = 0xFFFF00;
			temp.height = 25;
			temp.topLeftRadius = 10;
			temp.topRightRadius = 10;
			temp.width = 81;
			temp.x = 198;
			temp.y = 563;
			return temp;
		}

		private function __UIDemoSkin_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.bottom = 344;
			temp.left = 1078;
			temp.right = 154;
			var skin:StateSkin = new org.mokylin.skin.common.AutoDressEquipAlertSkin()
			temp.skin = skin
			temp.top = 68;
			return temp;
		}

		private function __UIDemoSkin_TileLayout1_i():feathers.layout.TiledRowsLayout
		{
			var temp:feathers.layout.TiledRowsLayout = new feathers.layout.TiledRowsLayout();
			temp.horizontalAlign = "center";
			temp.horizontalGap = 10;
			temp.paddingBottom = 1;
			__UIDemoSkin_TileLayout1 = temp;
			temp.paddingRight = 1;
			temp.paddingTop = 1;
			temp.requestedRowCount = 4;
			temp.verticalAlign = "middle";
			temp.verticalGap = 10;
			return temp;
		}

		private function __UIDemoSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 620;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 1440;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 28;
			temp.label = "弹出面板";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_green2;
			temp.color = 0xD69E66;
			temp.width = 132;
			temp.x = 129;
			temp.y = 206;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 1409;
			temp.y = 5;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 28;
			temp.label = "按钮_Button";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_green_redlabel;
			temp.color = 0xE9C099;
			temp.width = 99;
			temp.x = 15;
			temp.y = 206;
			return temp;
		}

		private function checkBox1_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			checkBox1 = temp;
			temp.name = "checkBox1";
			temp.label = "111";
			temp.styleClass = org.mokylin.skin.component.check.CheckSkin_2;
			temp.textAlign = "right";
			temp.color = 0xC9B489;
			temp.width = 100;
			temp.x = 14;
			temp.y = 85;
			return temp;
		}

		private function checkBox2_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			checkBox2 = temp;
			temp.name = "checkBox2";
			temp.isEnabled = false;
			temp.label = "复选框_不可用";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.check.CheckSkin_2;
			temp.color = 0xC9B489;
			temp.width = 104;
			temp.x = 14;
			temp.y = 110;
			return temp;
		}

		private function comboBox_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			comboBox = temp;
			temp.name = "comboBox";
			temp.height = 23;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBoxSkin_2Skin;
			temp.textAlign = "center";
			temp.color = 0xF6D621;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = 127;
			temp.y = 239;
			temp.dataProvider = __UIDemoSkin_ArrayCollection3_i();
			return temp;
		}

		private function grpNoLayout_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpNoLayout = temp;
			temp.name = "grpNoLayout";
			temp.height = 92;
			temp.width = 245;
			temp.x = 317;
			temp.y = 297;
			temp.elementsContent = [noLayoutGrpBg_i(),lbTxtGroup_i(),lbTxtNo_i(),lbTxtLayout_i(),lb3_i()];
			return temp;
		}

		private function horizontalLayoutGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			horizontalLayoutGroup = temp;
			temp.name = "horizontalLayoutGroup";
			temp.height = 16;
			temp.width = 242;
			temp.x = 310;
			temp.y = 65;
			temp.layout = __UIDemoSkin_HorizontalLayout1_i();
			temp.elementsContent = [__UIDemoSkin_Label21_i(),labHLayoutSub2_i(),__UIDemoSkin_Label22_i(),__UIDemoSkin_Label23_i(),__UIDemoSkin_Label24_i()];
			return temp;
		}

		private function hslider_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			hslider = temp;
			temp.name = "hslider";
			temp.height = 10;
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.HSliderChatSkin;
			temp.width = 147;
			temp.x = 1070;
			temp.y = 292;
			return temp;
		}

		private function labHLayoutSub2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHLayoutSub2 = temp;
			temp.name = "labHLayoutSub2";
			temp.text = "标签";
			temp.color = 0xF8F307;
			temp.x = 47.5;
			temp.y = 7;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function labelFilterGreen_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterGreen = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x00FF00;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function labelFilterRed_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterRed = temp;
			temp.alpha = 1.00;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0xFF0000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function labelFilterYellow_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterYellow = temp;
			temp.alpha = 1.00;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0xFFFF00;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function lb0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb0 = temp;
			temp.name = "lb0";
			temp.fontName = "微软雅黑";
			temp.text = "普通容器_group(无布局)";
			temp.color = 0xFEFEFE;
			temp.width = 248;
			temp.x = 316;
			temp.y = 271;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.nativeFilters = Fontter.filterObj[[labelFilterGreen]];
			temp.height = 22;
			temp.maxWidth = 184;
			temp.text = "位图数字:UINumber";
			temp.width = 184;
			temp.x = 16;
			temp.y = 540;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.nativeFilters = Fontter.filterObj[[labelFilterRed]];
			temp.fontName = "SimHei";
			temp.height = 19;
			temp.italic = true;
			temp.leading = 5;
			temp.fontSize = 14;
			temp.text = "横向居中";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.width = 249;
			temp.x = 15;
			temp.y = 424;
			return temp;
		}

		private function lb3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb3 = temp;
			temp.name = "lb3";
			temp.nativeFilters = Fontter.filterObj[[labelFilterRed]];
			temp.fontName = "SimHei";
			temp.height = 91;
			temp.italic = true;
			temp.leading = 5;
			temp.fontSize = 14;
			temp.text = "垂直居中";
			temp.textAlign = "center";
			temp.color = 0xFFFFFF;
			temp.verticalAlign = "middle";
			temp.width = 247;
			temp.x = -1;
			temp.y = 1;
			return temp;
		}

		private function lbMuline_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbMuline = temp;
			temp.name = "lbMuline";
			temp.fontName = "SimSun";
			temp.leading = 5;
			temp.letterSpacing = 3;
			temp.maxWidth = 245;
			temp.fontSize = 12;
			temp.text = "自动换行maxWidth自动换行maxWidth自动换行maxWidth自动换行maxWidth自动换行maxWidth自动换行maxWidth自动换行maxWidth";
			temp.color = 0xFABA5B;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 245;
			temp.x = 18;
			temp.y = 443;
			return temp;
		}

		private function lbPos_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbPos = temp;
			temp.name = "lbPos";
			temp.height = 21;
			temp.fontSize = 12;
			temp.text = "测试对位";
			temp.color = 0xFDFDFD;
			temp.width = 54;
			temp.x = 15;
			temp.y = 388;
			return temp;
		}

		private function lbTxtGroup_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTxtGroup = temp;
			temp.name = "lbTxtGroup";
			temp.text = "Group";
			temp.color = 0xD82121;
			temp.x = 42;
			temp.y = 53;
			return temp;
		}

		private function lbTxtLayout_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTxtLayout = temp;
			temp.name = "lbTxtLayout";
			temp.text = "Layout";
			temp.color = 0xE30B0B;
			temp.x = 132;
			temp.y = 53;
			return temp;
		}

		private function lbTxtNo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTxtNo = temp;
			temp.name = "lbTxtNo";
			temp.text = "No";
			temp.color = 0xAE0B0B;
			temp.x = 97.5;
			temp.y = 13;
			return temp;
		}

		private function lb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb = temp;
			temp.name = "lb";
			temp.nativeFilters = Fontter.filterObj[[labelFilterRed]];
			temp.height = 24;
			temp.text = "居左";
			temp.color = 0xFFFFFF;
			temp.width = 120;
			temp.x = 15;
			temp.y = 405;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 169;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin;
			temp.width = 358;
			temp.x = 317;
			temp.y = 412;
			temp.layout = __UIDemoSkin_VerticalLayout1_i();
			temp.dataProvider = __UIDemoSkin_ArrayCollection2_i();
			return temp;
		}

		private function matrixAsset_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			matrixAsset = temp;
			temp.name = "matrixAsset";
			temp.height = 81;
			temp.pivotX = 50;
			temp.pivotY = 50;
			temp.rotation = 0.5235987755982988;
			temp.scaleX = 0.5;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 361;
			temp.x = 715;
			temp.y = 505;
			return temp;
		}

		private function mcFinish_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			mcFinish = temp;
			temp.name = "mcFinish";
			temp.autoPlay = true;
			temp.frameRate = 24;
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.effect.UIMovieClipSkin_finishTask;
			temp.width = 371;
			temp.x = 1057;
			temp.y = 521;
			return temp;
		}

		private function multi_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			multi = temp;
			temp.name = "multi";
			temp.height = 54;
			var skin:StateSkin = new org.mokylin.skin.demo.UIMultiStagePanelSkin()
			temp.skin = skin
			temp.width = 251;
			temp.x = 1035;
			temp.y = 405;
			return temp;
		}

		private function myCom1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			myCom1 = temp;
			temp.name = "myCom1";
			temp.height = 40;
			var skin:StateSkin = new org.mokylin.skin.demo.MyCustomComponentSkin()
			temp.skin = skin
			temp.width = 41;
			temp.x = 597;
			temp.y = 346;
			return temp;
		}

		private function myCom2_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			myCom2 = temp;
			temp.name = "myCom2";
			temp.height = 40;
			var skin:StateSkin = new org.mokylin.skin.demo.MyCustomComponentSkin()
			temp.skin = skin
			temp.width = 41;
			temp.x = 649;
			temp.y = 346;
			return temp;
		}

		private function noLayoutGrpBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			noLayoutGrpBg = temp;
			temp.name = "noLayoutGrpBg";
			temp.height = 90;
			temp.styleName = "ui/common/kang/ejnk.png";
			temp.width = 239;
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function numMc1_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			numMc1 = temp;
			temp.name = "numMc1";
			temp.autoPlay = true;
			temp.fps = 2;
			temp.frameRate = 2;
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.width = 20;
			temp.x = 895;
			temp.y = 560;
			return temp;
		}

		private function numMc2_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			numMc2 = temp;
			temp.name = "numMc2";
			temp.autoPlay = true;
			temp.fps = 4;
			temp.frameRate = 4;
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.width = 20;
			temp.x = 923;
			temp.y = 560;
			return temp;
		}

		private function numMc3_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			numMc3 = temp;
			temp.name = "numMc3";
			temp.autoPlay = true;
			temp.fps = 8;
			temp.frameRate = 8;
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.width = 20;
			temp.x = 950;
			temp.y = 560;
			return temp;
		}

		private function numMc4_i():feathers.controls.UIMovieClip
		{
			var temp:feathers.controls.UIMovieClip = new feathers.controls.UIMovieClip();
			numMc4 = temp;
			temp.name = "numMc4";
			temp.autoPlay = true;
			temp.fps = 24;
			temp.frameRate = 16;
			temp.height = 20;
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.width = 20;
			temp.x = 978;
			temp.y = 560;
			return temp;
		}

		private function progress_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			progress = temp;
			temp.name = "progress";
			temp.maximum = 100;
			temp.minimum = 0;
			temp.progressMode = "scale";
			temp.styleClass = org.mokylin.skin.component.progress.ProgressBarSkin_1;
			temp.value = 100;
			temp.width = 588;
			temp.x = 828;
			temp.y = 486;
			return temp;
		}

		private function radio0_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			radio0 = temp;
			temp.name = "radio0";
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.groupName = "myBtnGrp1";
			temp.label = "单选按钮_选中";
			temp.isSelected = true;
			temp.styleClass = org.mokylin.skin.component.radio.RadioSkin_3;
			temp.textAlign = "left";
			temp.color = 0xFB3E24;
			temp.width = 115;
			temp.x = 10;
			temp.y = 132;
			return temp;
		}

		private function radio1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			radio1 = temp;
			temp.name = "radio1";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.groupName = "myBtnGrp1";
			temp.height = 21;
			temp.label = "单选按钮_Radio";
			temp.isSelected = false;
			temp.fontSize = 12;
			temp.styleClass = org.mokylin.skin.component.radio.RadioSkin_3;
			temp.textAlign = "left";
			temp.color = 0xF6D621;
			temp.width = 112;
			temp.x = 10;
			temp.y = 155;
			return temp;
		}

		private function radio2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			radio2 = temp;
			temp.name = "radio2";
			temp.isEnabled = false;
			temp.groupName = "myBtnGrp1";
			temp.height = 19;
			temp.label = "单选按钮_不可用";
			temp.isSelected = false;
			temp.styleClass = org.mokylin.skin.component.radio.RadioButtonSkin;
			temp.textAlign = "center";
			temp.color = 0xC9B489;
			temp.width = 123;
			temp.x = 15;
			temp.y = 180;
			return temp;
		}

		private function slider_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			slider = temp;
			temp.name = "slider";
			temp.height = 100;
			temp.direction = Slider.DIRECTION_VERTICAL
			temp.styleClass = org.mokylin.skin.component.slider.VSliderChatSkin;
			temp.width = 11;
			temp.x = 1040;
			temp.y = 294;
			return temp;
		}

		private function tabbar_i():feathers.controls.TabBar
		{
			var temp:feathers.controls.TabBar = new feathers.controls.TabBar();
			tabbar = temp;
			temp.name = "tabbar";
			temp.btnWidth = 45;
			temp.gap = -5;
			temp.styleClass = org.mokylin.skin.component.tabbar.TabBarXiaofenye;
			temp.width = 226;
			temp.x = 16;
			temp.y = 36;
			temp.dataProvider = __UIDemoSkin_ArrayCollection1_i();
			return temp;
		}

		private function textArea_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textArea = temp;
			temp.name = "textArea";
			temp.height = 99;
			temp.italic = true;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin;
			temp.text = "多行文本框多行输入文本框TextAreaTextArea\na\nb\nc\nd\ne\nf\ng\nh\ni";
			temp.textAlign = "center";
			temp.color = 0xD974428;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 253;
			temp.x = 15;
			temp.y = 291;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 22;
			temp.prompt = "请输入";
			temp.styleClass = org.mokylin.skin.component.text.TextInputSkin;
			temp.textAlign = "right";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 252;
			temp.x = 15;
			temp.y = 265;
			return temp;
		}

		private function tileLayout_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			tileLayout = temp;
			temp.name = "tileLayout";
			temp.height = 118;
			temp.width = 243;
			temp.x = 315;
			temp.y = 127;
			temp.layout = __UIDemoSkin_TileLayout1_i();
			temp.elementsContent = [__UIDemoSkin_Label1_i(),__UIDemoSkin_Label2_i(),__UIDemoSkin_Label3_i(),__UIDemoSkin_Label4_i(),__UIDemoSkin_Label5_i(),__UIDemoSkin_Label6_i(),__UIDemoSkin_Label7_i(),__UIDemoSkin_Label8_i(),__UIDemoSkin_Label9_i(),__UIDemoSkin_Label10_i(),__UIDemoSkin_Label11_i(),__UIDemoSkin_Label12_i(),__UIDemoSkin_Label13_i(),__UIDemoSkin_Label14_i(),__UIDemoSkin_Label15_i(),__UIDemoSkin_Label16_i(),__UIDemoSkin_Label17_i(),__UIDemoSkin_Label18_i(),__UIDemoSkin_Label19_i(),__UIDemoSkin_Label20_i()];
			return temp;
		}

		private function tree_i():feathers.controls.Tree
		{
			var temp:feathers.controls.Tree = new feathers.controls.Tree();
			tree = temp;
			temp.name = "tree";
			temp.height = 296;
			temp.styleClass = org.mokylin.skin.common.TreeNodeSkin;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin;
			temp.width = 220;
			temp.x = 743;
			temp.y = 68;
			return temp;
		}

		private function uiNumber0_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiNumber0 = temp;
			temp.name = "uiNumber0";
			temp.gap = -4;
			temp.height = 24;
			temp.label = "100";
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.tween = false;
			temp.width = 51;
			temp.x = 15;
			temp.y = 565;
			return temp;
		}

		private function uiNumber3_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			uiNumber3 = temp;
			temp.name = "uiNumber3";
			temp.gap = -4;
			temp.height = 24;
			temp.label = "100";
			temp.styleClass = org.mokylin.skin.common.number.UINumberSkin_sz;
			temp.tween = false;
			temp.width = 51;
			temp.x = 72;
			temp.y = 565;
			return temp;
		}

	}
}
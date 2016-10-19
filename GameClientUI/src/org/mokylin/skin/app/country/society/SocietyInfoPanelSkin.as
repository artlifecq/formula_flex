package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.list.ListRedSkin;
	import org.mokylin.skin.component.text.TextAreaSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyInfoPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var approveBtn:feathers.controls.Button;

		public var approveBtnGroup:feathers.controls.Group;

		public var approveTips:feathers.controls.UIAsset;

		public var constructTokenCountTxt:feathers.controls.Label;

		public var contributeValueTxt:feathers.controls.Label;

		public var conveneBtn:feathers.controls.Button;

		public var donationBtn:feathers.controls.Button;

		public var impeachmentBtn:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var leaderNameTxt:feathers.controls.Label;

		public var leaveBtn:feathers.controls.Button;

		public var levelTxt:feathers.controls.Label;

		public var list:feathers.controls.List;

		public var modifyBtn:feathers.controls.Button;

		public var moneyCountTxt:feathers.controls.Label;

		public var notifyEmptyInfo:feathers.controls.Label;

		public var notifyText:feathers.controls.TextArea;

		public var notifyTextFocused:feathers.controls.UIAsset;

		public var onlinePeopleCountTxt:feathers.controls.Label;

		public var peopleCountTxt:feathers.controls.Label;

		public var showOffline:feathers.controls.Check;

		public var societyNameTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyInfoPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			labelFilterBlack_i();
			this.elementsContent = [__SocietyInfoPanelSkin_UIAsset1_i(),__SocietyInfoPanelSkin_UIAsset2_i(),societyNameTxt_i(),leaderNameTxt_i(),levelTxt_i(),peopleCountTxt_i(),onlinePeopleCountTxt_i(),constructTokenCountTxt_i(),moneyCountTxt_i(),__SocietyInfoPanelSkin_UIAsset3_i(),__SocietyInfoPanelSkin_UIAsset4_i(),list_i(),__SocietyInfoPanelSkin_Label1_i(),__SocietyInfoPanelSkin_UIAsset5_i(),__SocietyInfoPanelSkin_Label2_i(),__SocietyInfoPanelSkin_UIAsset6_i(),__SocietyInfoPanelSkin_UIAsset7_i(),__SocietyInfoPanelSkin_UIAsset8_i(),__SocietyInfoPanelSkin_Label3_i(),__SocietyInfoPanelSkin_Label4_i(),__SocietyInfoPanelSkin_Label5_i(),__SocietyInfoPanelSkin_Label6_i(),modifyBtn_i(),conveneBtn_i(),impeachmentBtn_i(),leaveBtn_i(),donationBtn_i(),__SocietyInfoPanelSkin_UIAsset9_i(),showOffline_i(),notifyEmptyInfo_i(),notifyText_i(),notifyTextFocused_i(),__SocietyInfoPanelSkin_UIAsset10_i(),contributeValueTxt_i(),approveBtnGroup_i()];
			
			states = {
				normal:[
						{target:"notifyText",
							name:"styleName",
							value:"org.mokylin.skin.component.text.TextAreaLvSkin"
						}
					]
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyInfoPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 425;
			temp.y = 21;
			return temp;
		}

		private function __SocietyInfoPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "战斗力";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 497;
			temp.y = 21;
			return temp;
		}

		private function __SocietyInfoPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "个人贡献";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 594;
			temp.y = 21;
			return temp;
		}

		private function __SocietyInfoPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "当前位置";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 696;
			temp.y = 21;
			return temp;
		}

		private function __SocietyInfoPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "职位";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 783;
			temp.y = 21;
			return temp;
		}

		private function __SocietyInfoPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "族员名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 304;
			temp.y = 20;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/gerengongxian.png";
			temp.x = 0;
			temp.y = 422;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 420;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 618;
			temp.x = 256;
			temp.y = 7;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 420;
			temp.styleName = "ui/app/country/bangpai/zuodi.jpg";
			temp.width = 253;
			temp.x = 6;
			temp.y = 7;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.width = 614;
			temp.x = 260;
			temp.y = 8;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 300;
			temp.y = 19;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 357;
			temp.y = 19;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 444;
			temp.y = 19;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 554;
			temp.y = 19;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 648;
			temp.y = 19;
			return temp;
		}

		private function __SocietyInfoPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 873;
			temp.x = 5;
			temp.y = 426;
			return temp;
		}

		private function approveBtnGroup_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			approveBtnGroup = temp;
			temp.name = "approveBtnGroup";
			temp.x = 500;
			temp.y = 438;
			temp.elementsContent = [approveBtn_i(),approveTips_i()];
			return temp;
		}

		private function approveBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			approveBtn = temp;
			temp.name = "approveBtn";
			temp.height = 35;
			temp.label = "入族审批";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 0;
			temp.y = 2;
			return temp;
		}

		private function approveTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			approveTips = temp;
			temp.name = "approveTips";
			temp.styleName = "ui/common/icon/hong_dian.png";
			temp.x = 4;
			temp.y = 0;
			return temp;
		}

		private function constructTokenCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			constructTokenCountTxt = temp;
			temp.name = "constructTokenCountTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "建设令牌：1";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 164;
			temp.x = 20;
			temp.y = 191;
			return temp;
		}

		private function contributeValueTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			contributeValueTxt = temp;
			temp.name = "contributeValueTxt";
			temp.bold = false;
			temp.height = 28;
			temp.fontSize = 18;
			temp.text = "9999";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 300;
			temp.x = 126;
			temp.y = 449;
			return temp;
		}

		private function conveneBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			conveneBtn = temp;
			temp.name = "conveneBtn";
			temp.height = 20;
			temp.label = "召集";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 64;
			temp.x = 188;
			temp.y = 172;
			return temp;
		}

		private function donationBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			donationBtn = temp;
			temp.name = "donationBtn";
			temp.height = 20;
			temp.label = "捐款";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 64;
			temp.x = 188;
			temp.y = 222;
			return temp;
		}

		private function impeachmentBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			impeachmentBtn = temp;
			temp.name = "impeachmentBtn";
			temp.height = 35;
			temp.label = "弹劾族长";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 629;
			temp.y = 440;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 1;
			temp.blurX = 4;
			temp.blurY = 4;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function leaderNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			leaderNameTxt = temp;
			temp.name = "leaderNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "家族名称：花花";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 170;
			temp.x = 20;
			temp.y = 71;
			return temp;
		}

		private function leaveBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			leaveBtn = temp;
			temp.name = "leaveBtn";
			temp.height = 35;
			temp.label = "退出家族";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 758;
			temp.y = 440;
			return temp;
		}

		private function levelTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			levelTxt = temp;
			temp.name = "levelTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "家族等级：1";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 170;
			temp.x = 20;
			temp.y = 96;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 374;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 606;
			temp.x = 262;
			temp.y = 44;
			return temp;
		}

		private function modifyBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			modifyBtn = temp;
			temp.name = "modifyBtn";
			temp.height = 20;
			temp.label = "修改";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 54;
			temp.x = 198;
			temp.y = 392;
			return temp;
		}

		private function moneyCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			moneyCountTxt = temp;
			temp.name = "moneyCountTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "家族资金：1";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 164;
			temp.x = 20;
			temp.y = 216;
			return temp;
		}

		private function notifyEmptyInfo_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			notifyEmptyInfo = temp;
			temp.name = "notifyEmptyInfo";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 65;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "什么话也没留下";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 210;
			temp.x = 24;
			temp.y = 308;
			return temp;
		}

		private function notifyTextFocused_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			notifyTextFocused = temp;
			temp.name = "notifyTextFocused";
			temp.height = 89;
			temp.touchable = false;
			temp.styleName = "ui/component/text/select.png";
			temp.width = 236;
			temp.x = 12;
			temp.y = 294;
			return temp;
		}

		private function notifyText_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			notifyText = temp;
			temp.name = "notifyText";
			temp.height = 89;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin_1);
			temp.color = 0xD4C996;
			temp.nativeFilters = Fontter.filterObj["textFilterBlack"];
			temp.width = 236;
			temp.x = 12;
			temp.y = 294;
			return temp;
		}

		private function onlinePeopleCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			onlinePeopleCountTxt = temp;
			temp.name = "onlinePeopleCountTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "活跃在线：1";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 164;
			temp.x = 20;
			temp.y = 166;
			return temp;
		}

		private function peopleCountTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			peopleCountTxt = temp;
			temp.name = "peopleCountTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "家族人数：1";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 170;
			temp.x = 20;
			temp.y = 121;
			return temp;
		}

		private function showOffline_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			showOffline = temp;
			temp.name = "showOffline";
			temp.label = "显示离线人员";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.color = 0xFABA5B;
			temp.width = 120;
			temp.x = 750;
			temp.y = -26;
			return temp;
		}

		private function societyNameTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			societyNameTxt = temp;
			temp.name = "societyNameTxt";
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"微软雅黑\" SIZE=\"12\" COLOR=\"#F9F0CC\" LETTERSPACING=\"0\" KERNING=\"0\">时间：2015-11-25</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "家族名称：帮会名称七个字";
			temp.textAlign = "left";
			temp.color = 0xF9F0CC;
			temp.width = 170;
			temp.x = 20;
			temp.y = 46;
			return temp;
		}

	}
}
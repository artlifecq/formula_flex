package org.mokylin.skin.app.family
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.ScrollContainer;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.scrollbar.skin_chat.VScrollBarChatSkin;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FamilyInfoSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnDismissFamily:feathers.controls.Button;

		public var btnFamilyMsg:feathers.controls.Button;

		public var btnIncome:feathers.controls.Button;

		public var btnLeave:feathers.controls.Button;

		public var labAnnouncement:feathers.controls.TextArea;

		public var labCostMoney:feathers.controls.Label;

		public var labFamilyName:feathers.controls.Label;

		public var labHeadName:feathers.controls.Label;

		public var labLevel:feathers.controls.Label;

		public var labLive:feathers.controls.Label;

		public var labMoney:feathers.controls.Label;

		public var labMyGongXun:feathers.controls.Label;

		public var labMyJob:feathers.controls.Label;

		public var labMyNickname:feathers.controls.Label;

		public var labPopleCount:feathers.controls.Label;

		public var scrollFamily:feathers.controls.ScrollContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FamilyInfoSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 530;
			this.width = 827;
			this.elementsContent = [scrollFamily_i(),btnFamilyMsg_i(),btnIncome_i(),__FamilyInfoSkin_Button1_i(),__FamilyInfoSkin_Button2_i(),btnLeave_i(),__FamilyInfoSkin_Button3_i(),labFamilyName_i(),labHeadName_i(),__FamilyInfoSkin_Label1_i(),__FamilyInfoSkin_Label2_i(),__FamilyInfoSkin_Label3_i(),__FamilyInfoSkin_Label4_i(),__FamilyInfoSkin_Label5_i(),__FamilyInfoSkin_Label6_i(),__FamilyInfoSkin_Label7_i(),__FamilyInfoSkin_Label8_i(),labLevel_i(),labPopleCount_i(),labMoney_i(),labCostMoney_i(),labLive_i(),labMyNickname_i(),labMyJob_i(),labMyGongXun_i(),btnDismissFamily_i(),labAnnouncement_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FamilyInfoSkin_Button1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "家族建设";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 619;
			temp.y = 460;
			return temp;
		}

		private function __FamilyInfoSkin_Button2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "家族战车";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 715;
			temp.y = 460;
			return temp;
		}

		private function __FamilyInfoSkin_Button3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			temp.label = "家族聊天群";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 715;
			temp.y = 495;
			return temp;
		}

		private function __FamilyInfoSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "家族太常";
			temp.width = 150;
			temp.x = 12;
			temp.y = 68;
			return temp;
		}

		private function __FamilyInfoSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "昵称";
			temp.textAlign = "center";
			temp.width = 135;
			temp.x = 20;
			temp.y = 108;
			return temp;
		}

		private function __FamilyInfoSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "等级";
			temp.textAlign = "center";
			temp.width = 54;
			temp.x = 178;
			temp.y = 108;
			return temp;
		}

		private function __FamilyInfoSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "职位";
			temp.textAlign = "center";
			temp.width = 80;
			temp.x = 256;
			temp.y = 108;
			return temp;
		}

		private function __FamilyInfoSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "家族功勋";
			temp.textAlign = "center";
			temp.width = 89;
			temp.x = 344;
			temp.y = 108;
			return temp;
		}

		private function __FamilyInfoSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "称号";
			temp.textAlign = "center";
			temp.width = 137;
			temp.x = 450;
			temp.y = 108;
			return temp;
		}

		private function __FamilyInfoSkin_Label7_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "经验分享";
			temp.textAlign = "center";
			temp.x = 602;
			temp.y = 108;
			return temp;
		}

		private function __FamilyInfoSkin_Label8_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "家族活跃";
			temp.textAlign = "center";
			temp.width = 92;
			temp.x = 664;
			temp.y = 108;
			return temp;
		}

		private function btnDismissFamily_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnDismissFamily = temp;
			temp.name = "btnDismissFamily";
			temp.label = "解散家族";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 520;
			temp.y = 495;
			return temp;
		}

		private function btnFamilyMsg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFamilyMsg = temp;
			temp.name = "btnFamilyMsg";
			temp.label = "发布信息";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 619;
			temp.y = 427;
			return temp;
		}

		private function btnIncome_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnIncome = temp;
			temp.name = "btnIncome";
			temp.label = "家族收人";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 715;
			temp.y = 427;
			return temp;
		}

		private function btnLeave_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLeave = temp;
			temp.name = "btnLeave";
			temp.label = "退出家族";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 90;
			temp.x = 619;
			temp.y = 495;
			return temp;
		}

		private function labAnnouncement_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labAnnouncement = temp;
			temp.name = "labAnnouncement";
			temp.height = 83;
			temp.touchable = false;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInputSkin);
			temp.width = 482;
			temp.x = 21;
			temp.y = 432;
			return temp;
		}

		private function labCostMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labCostMoney = temp;
			temp.name = "labCostMoney";
			temp.text = "维护资金";
			temp.width = 128;
			temp.x = 441;
			temp.y = 8;
			return temp;
		}

		private function labFamilyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labFamilyName = temp;
			temp.name = "labFamilyName";
			temp.text = "家族名字";
			temp.width = 150;
			temp.x = 12;
			temp.y = 8;
			return temp;
		}

		private function labHeadName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labHeadName = temp;
			temp.name = "labHeadName";
			temp.text = "家族族长";
			temp.width = 150;
			temp.x = 12;
			temp.y = 40;
			return temp;
		}

		private function labLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLevel = temp;
			temp.name = "labLevel";
			temp.text = "家族等级";
			temp.width = 131;
			temp.x = 222;
			temp.y = 8;
			return temp;
		}

		private function labLive_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labLive = temp;
			temp.name = "labLive";
			temp.text = "家族繁荣度";
			temp.width = 130;
			temp.x = 441;
			temp.y = 68;
			return temp;
		}

		private function labMoney_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMoney = temp;
			temp.name = "labMoney";
			temp.text = "家族资金";
			temp.width = 170;
			temp.x = 222;
			temp.y = 68;
			return temp;
		}

		private function labMyGongXun_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMyGongXun = temp;
			temp.name = "labMyGongXun";
			temp.text = "家族功勋";
			temp.width = 119;
			temp.x = 662;
			temp.y = 68;
			return temp;
		}

		private function labMyJob_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMyJob = temp;
			temp.name = "labMyJob";
			temp.text = "族内职务";
			temp.width = 111;
			temp.x = 662;
			temp.y = 40;
			return temp;
		}

		private function labMyNickname_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labMyNickname = temp;
			temp.name = "labMyNickname";
			temp.text = "玩家昵称";
			temp.width = 128;
			temp.x = 662;
			temp.y = 8;
			return temp;
		}

		private function labPopleCount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPopleCount = temp;
			temp.name = "labPopleCount";
			temp.text = "家族人数";
			temp.width = 150;
			temp.x = 222;
			temp.y = 40;
			return temp;
		}

		private function scrollFamily_i():feathers.controls.ScrollContainer
		{
			var temp:feathers.controls.ScrollContainer = new feathers.controls.ScrollContainer();
			scrollFamily = temp;
			temp.name = "scrollFamily";
			temp.height = 280;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.scrollbar.skin_chat.VScrollBarChatSkin);
			temp.width = 810;
			temp.x = 8;
			temp.y = 130;
			return temp;
		}

	}
}
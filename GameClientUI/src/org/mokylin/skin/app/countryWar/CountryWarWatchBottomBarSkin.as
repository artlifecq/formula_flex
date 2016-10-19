package org.mokylin.skin.app.countryWar
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.countryWar.CountryWarWatchBottomOfficerListSkin;
	import org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_top_left;
	import org.mokylin.skin.component.button.ButtonSkin_orange_big;
	import org.mokylin.skin.component.button.ButtonSkin_orange_small;
	import org.mokylin.skin.component.button.ButtonSkin_xiala_up;
	import org.mokylin.skin.component.text.TextInput2Skin;
	import org.mokylin.skin.mainui.chat.button.ButtonChat_incre;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarWatchBottomBarSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var bgTarget:feathers.controls.UIAsset;

		public var btnAlign:feathers.controls.Button;

		public var btnHide:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnQuit:feathers.controls.Button;

		public var btnSend:feathers.controls.Button;

		public var containerList:feathers.controls.SkinnableContainer;

		public var imageColor:feathers.controls.UIAsset;

		public var lbDesc:feathers.controls.Label;

		public var lbTargetName:feathers.controls.Label;

		public var textInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarWatchBottomBarSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 1430;
			this.elementsContent = [bg_i(),lbDesc_i(),textInput_i(),btnAlign_i(),imageColor_i(),btnSend_i(),btnQuit_i(),bgTarget_i(),lbTargetName_i(),btnOpen_i(),btnHide_i(),containerList_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bgTarget_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgTarget = temp;
			temp.name = "bgTarget";
			temp.styleName = "ui/app/countryWar/dang_qian_guan_zhan.png";
			temp.x = 930;
			temp.y = -47;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/countryWar/liao_tian_di.png";
			temp.width = 1430;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnAlign_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAlign = temp;
			temp.name = "btnAlign";
			temp.styleClass = org.mokylin.skin.app.countryWar.button.ButtonSkin_danmu_top_left;
			temp.x = 486;
			temp.y = 15;
			return temp;
		}

		private function btnHide_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnHide = temp;
			temp.name = "btnHide";
			temp.styleClass = org.mokylin.skin.mainui.chat.button.ButtonChat_incre;
			temp.x = 1204;
			temp.y = -25;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_xiala_up;
			temp.x = 1204;
			temp.y = -25;
			return temp;
		}

		private function btnQuit_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnQuit = temp;
			temp.name = "btnQuit";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "退出观战";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_orange_big;
			temp.color = 0xF9F0CC;
			temp.x = 1093;
			temp.y = 11;
			return temp;
		}

		private function btnSend_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnSend = temp;
			temp.name = "btnSend";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "发送";
			temp.fontSize = 18;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_orange_small;
			temp.color = 0xF9F0CC;
			temp.x = 948;
			temp.y = 13;
			return temp;
		}

		private function containerList_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			containerList = temp;
			temp.name = "containerList";
			temp.height = 334;
			var skin:StateSkin = new org.mokylin.skin.app.countryWar.CountryWarWatchBottomOfficerListSkin()
			temp.skin = skin
			temp.width = 303;
			temp.x = 940;
			temp.y = -362;
			return temp;
		}

		private function imageColor_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageColor = temp;
			temp.name = "imageColor";
			temp.styleName = "ui/app/countryWar/font_color_1.png";
			temp.x = 535;
			temp.y = 20;
			return temp;
		}

		private function lbDesc_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDesc = temp;
			temp.name = "lbDesc";
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 390;
			temp.x = 560;
			temp.y = 2;
			return temp;
		}

		private function lbTargetName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTargetName = temp;
			temp.name = "lbTargetName";
			temp.text = "标签";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 161;
			temp.x = 1036;
			temp.y = -23;
			return temp;
		}

		private function textInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			textInput = temp;
			temp.name = "textInput";
			temp.styleClass = org.mokylin.skin.component.text.TextInput2Skin;
			temp.width = 380;
			temp.x = 560;
			temp.y = 24;
			return temp;
		}

	}
}
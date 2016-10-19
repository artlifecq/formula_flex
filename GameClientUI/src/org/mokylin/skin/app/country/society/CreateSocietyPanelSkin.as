package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.country.button.ButtonChuangjian_anniu;
	import org.mokylin.skin.app.country.society.CreateTextInputSkin;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CreateSocietyPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var autoAgree:feathers.controls.Check;

		public var btnCreate:feathers.controls.Button;

		public var inputName:feathers.controls.TextInput;

		public var inputTips:feathers.controls.Label;

		public var lingPaiTxt:feathers.controls.Label;

		public var yinZiTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CreateSocietyPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [__CreateSocietyPanelSkin_UIAsset1_i(),__CreateSocietyPanelSkin_UIAsset2_i(),btnCreate_i(),inputName_i(),autoAgree_i(),__CreateSocietyPanelSkin_UIAsset3_i(),__CreateSocietyPanelSkin_UIAsset4_i(),__CreateSocietyPanelSkin_UIAsset5_i(),__CreateSocietyPanelSkin_UIAsset6_i(),lingPaiTxt_i(),inputTips_i(),yinZiTxt_i(),__CreateSocietyPanelSkin_UIAsset7_i(),__CreateSocietyPanelSkin_UIAsset8_i(),__CreateSocietyPanelSkin_UIAsset9_i(),__CreateSocietyPanelSkin_UIAsset10_i(),__CreateSocietyPanelSkin_UIAsset11_i(),__CreateSocietyPanelSkin_UIAsset12_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CreateSocietyPanelSkin_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/huangdi.png";
			temp.x = 522;
			temp.y = 0;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/bang_pai_ming_cheng.png";
			temp.x = 256;
			temp.y = 440;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/xiao_hao.png";
			temp.x = 30;
			temp.y = 432;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/createSociety_1.jpg";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/createSociety_2.jpg";
			temp.x = 447;
			temp.y = 6;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.width = 146;
			temp.x = 62;
			temp.y = 428;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/shurukuang.png";
			temp.width = 146;
			temp.x = 62;
			temp.y = 454;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/tongyongtubiao_xiao/lingpai.png";
			temp.x = 64;
			temp.y = 427;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/tongyongtubiao_xiao/yinzi.png";
			temp.x = 64;
			temp.y = 451;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 408;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 444;
			temp.y = 6;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 3;
			temp.styleName = "ui/app/country/heng.png";
			temp.width = 873;
			temp.x = 5;
			temp.y = 413;
			return temp;
		}

		private function __CreateSocietyPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/bangpai/guowang.png";
			temp.x = 80;
			temp.y = 0;
			return temp;
		}

		private function autoAgree_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			autoAgree = temp;
			temp.name = "autoAgree";
			temp.label = "自动同意入族申请";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.color = 0xFABA5B;
			temp.width = 150;
			temp.x = 730;
			temp.y = -26;
			return temp;
		}

		private function btnCreate_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnCreate = temp;
			temp.name = "btnCreate";
			temp.height = 53;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.button.ButtonChuangjian_anniu);
			temp.width = 157;
			temp.x = 700;
			temp.y = 424;
			return temp;
		}

		private function inputName_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			inputName = temp;
			temp.name = "inputName";
			temp.height = 36;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.app.country.society.CreateTextInputSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 270;
			temp.x = 344;
			temp.y = 434;
			return temp;
		}

		private function inputTips_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			inputTips = temp;
			temp.name = "inputTips";
			temp.height = 26;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "请输入家族名称（2-7字）";
			temp.textAlign = "center";
			temp.color = 0x4A4744;
			temp.width = 263;
			temp.x = 347;
			temp.y = 442;
			return temp;
		}

		private function lingPaiTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lingPaiTxt = temp;
			temp.name = "lingPaiTxt";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "1000";
			temp.color = 0xF9F0CC;
			temp.width = 110;
			temp.x = 91;
			temp.y = 430;
			return temp;
		}

		private function yinZiTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			yinZiTxt = temp;
			temp.name = "yinZiTxt";
			temp.height = 22;
			temp.fontSize = 14;
			temp.text = "1000";
			temp.color = 0xF9F0CC;
			temp.width = 110;
			temp.x = 91;
			temp.y = 456;
			return temp;
		}

	}
}
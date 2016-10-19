package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;
	import org.mokylin.skin.component.list.ListRedSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownJinWeiJunPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var applyListBtn:feathers.controls.Button;

		public var conditionSetBtn:feathers.controls.Button;

		public var itemBg0:feathers.controls.UIAsset;

		public var list:feathers.controls.List;

		public var newWarInfoTxt:feathers.controls.Label;

		public var noticeBtn:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownJinWeiJunPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 885;
			this.elementsContent = [__CrownJinWeiJunPanelSkin_UIAsset1_i(),__CrownJinWeiJunPanelSkin_UIAsset2_i(),__CrownJinWeiJunPanelSkin_UIAsset3_i(),list_i(),itemBg0_i(),newWarInfoTxt_i(),noticeBtn_i(),conditionSetBtn_i(),applyListBtn_i(),__CrownJinWeiJunPanelSkin_UIAsset4_i(),__CrownJinWeiJunPanelSkin_UIAsset5_i(),__CrownJinWeiJunPanelSkin_UIAsset6_i(),__CrownJinWeiJunPanelSkin_UIAsset7_i(),__CrownJinWeiJunPanelSkin_UIAsset8_i(),__CrownJinWeiJunPanelSkin_UIAsset9_i(),__CrownJinWeiJunPanelSkin_Label1_i(),__CrownJinWeiJunPanelSkin_Label2_i(),__CrownJinWeiJunPanelSkin_Label3_i(),__CrownJinWeiJunPanelSkin_Label4_i(),__CrownJinWeiJunPanelSkin_Label5_i(),__CrownJinWeiJunPanelSkin_Label6_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownJinWeiJunPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 98;
			temp.x = 219;
			temp.y = 18;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "所在家族";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 119;
			temp.x = 316;
			temp.y = 18;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 438;
			temp.y = 18;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "战斗力";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 110;
			temp.x = 547;
			temp.y = 18;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "在线状态";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 100;
			temp.x = 657;
			temp.y = 18;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 101;
			temp.x = 757;
			temp.y = 18;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/neikuang.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 430;
			temp.styleName = "ui/app/crown/di.png";
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/guo_jia_jin_wei.jpg";
			temp.x = 5;
			temp.y = 5;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiaodi.png";
			temp.x = 218;
			temp.y = 9;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 181;
			temp.y = 19;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 300;
			temp.y = 19;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 410;
			temp.y = 19;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 620;
			temp.y = 19;
			return temp;
		}

		private function __CrownJinWeiJunPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/liebiao_fengekuang.png";
			temp.x = 520;
			temp.y = 19;
			return temp;
		}

		private function applyListBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			applyListBtn = temp;
			temp.name = "applyListBtn";
			temp.height = 33;
			temp.label = "申请列表";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 112;
			temp.x = 752;
			temp.y = 446;
			return temp;
		}

		private function conditionSetBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			conditionSetBtn = temp;
			temp.name = "conditionSetBtn";
			temp.height = 33;
			temp.label = "条件设置";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 112;
			temp.x = 636;
			temp.y = 446;
			return temp;
		}

		private function itemBg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg0 = temp;
			temp.name = "itemBg0";
			temp.height = 95;
			temp.styleName = "ui/common/kang/neikuang.png";
			temp.width = 649;
			temp.x = 224;
			temp.y = 324;
			return temp;
		}

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 270;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListRedSkin);
			temp.width = 650;
			temp.x = 220;
			temp.y = 44;
			return temp;
		}

		private function newWarInfoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			newWarInfoTxt = temp;
			temp.name = "newWarInfoTxt";
			temp.bold = true;
			temp.height = 80;
			temp.htmlText = "加入禁卫军能有很多好处";
			temp.fontSize = 14;
			temp.color = 0x5B2812;
			temp.width = 630;
			temp.x = 230;
			temp.y = 330;
			return temp;
		}

		private function noticeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			noticeBtn = temp;
			temp.name = "noticeBtn";
			temp.height = 33;
			temp.label = "公告";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 112;
			temp.x = 521;
			temp.y = 446;
			return temp;
		}

	}
}
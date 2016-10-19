package org.mokylin.skin.app.country
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
	public class JinWeiJunMemberPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var gotoJoinBtn:feathers.controls.Button;

		public var infoTxt:feathers.controls.Label;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JinWeiJunMemberPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__JinWeiJunMemberPanelSkin_UIAsset1_i(),__JinWeiJunMemberPanelSkin_UIAsset2_i(),__JinWeiJunMemberPanelSkin_UIAsset3_i(),__JinWeiJunMemberPanelSkin_UIAsset4_i(),__JinWeiJunMemberPanelSkin_UIAsset5_i(),__JinWeiJunMemberPanelSkin_UIAsset6_i(),__JinWeiJunMemberPanelSkin_UIAsset7_i(),__JinWeiJunMemberPanelSkin_UIAsset8_i(),list_i(),__JinWeiJunMemberPanelSkin_Label1_i(),__JinWeiJunMemberPanelSkin_Label2_i(),__JinWeiJunMemberPanelSkin_Label3_i(),__JinWeiJunMemberPanelSkin_Label4_i(),__JinWeiJunMemberPanelSkin_Label5_i(),gotoJoinBtn_i(),__JinWeiJunMemberPanelSkin_UIAsset9_i(),infoTxt_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JinWeiJunMemberPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "所在家族";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 443;
			temp.y = 17;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "玩家名称";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 274;
			temp.y = 16;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 60;
			temp.x = 560;
			temp.y = 16;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "战斗力";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 80;
			temp.x = 645;
			temp.y = 16;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "在线状态";
			temp.textAlign = "center";
			temp.color = 0xFFE258;
			temp.width = 108;
			temp.x = 751;
			temp.y = 16;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 483;
			temp.styleName = "ui/app/country/shu.png";
			temp.width = 3;
			temp.x = 215;
			temp.y = 6;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/guo_jia_jin_wei.jpg";
			temp.x = 6;
			temp.y = 5;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 430;
			temp.styleName = "ui/app/country/niupizhi/di.png";
			temp.width = 658;
			temp.x = 219;
			temp.y = 6;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiaodi.png";
			temp.x = 220;
			temp.y = 8;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 280;
			temp.y = 19;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 410;
			temp.y = 19;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 497;
			temp.y = 19;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/country/niupizhi/liebiao_fengekuang.png";
			temp.x = 600;
			temp.y = 19;
			return temp;
		}

		private function __JinWeiJunMemberPanelSkin_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 95;
			temp.styleName = "ui/common/kang/neikuang.png";
			temp.width = 649;
			temp.x = 224;
			temp.y = 324;
			return temp;
		}

		private function gotoJoinBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			gotoJoinBtn = temp;
			temp.name = "gotoJoinBtn";
			temp.height = 35;
			temp.label = "申请加入";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 113;
			temp.x = 752;
			temp.y = 444;
			return temp;
		}

		private function infoTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			infoTxt = temp;
			temp.name = "infoTxt";
			temp.bold = true;
			temp.height = 80;
			temp.htmlText = "加入禁卫军能有很多好处";
			temp.fontSize = 14;
			temp.text = "禁卫军令在线的能接一定要接。";
			temp.color = 0xF9F0CC;
			temp.width = 630;
			temp.x = 230;
			temp.y = 330;
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

	}
}
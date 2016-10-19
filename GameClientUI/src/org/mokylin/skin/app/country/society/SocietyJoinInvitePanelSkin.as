package org.mokylin.skin.app.country.society
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close_3;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;
	import org.mokylin.skin.component.check.CheckBoxSkin_3;
	import org.mokylin.skin.component.list.ListSkin3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class SocietyJoinInvitePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var allRefuseBtn:feathers.controls.Button;

		public var autoRefuse:feathers.controls.Check;

		public var closeBtn:feathers.controls.Button;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var list:feathers.controls.List;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function SocietyJoinInvitePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			labelFilterBlack_i();
			this.elementsContent = [__SocietyJoinInvitePanelSkin_UIAsset1_i(),__SocietyJoinInvitePanelSkin_UIAsset2_i(),closeBtn_i(),__SocietyJoinInvitePanelSkin_Label1_i(),__SocietyJoinInvitePanelSkin_UIAsset3_i(),__SocietyJoinInvitePanelSkin_UIAsset4_i(),__SocietyJoinInvitePanelSkin_Label2_i(),__SocietyJoinInvitePanelSkin_Label3_i(),__SocietyJoinInvitePanelSkin_Label4_i(),list_i(),autoRefuse_i(),allRefuseBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __SocietyJoinInvitePanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.nativeFilters = Fontter.filterObj[[labelFilterBlack]];
			temp.height = 24;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "入族邀请";
			temp.textAlign = "center";
			temp.color = 0xE9C099;
			temp.width = 100;
			temp.x = 248;
			temp.y = 6;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "邀请人";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 100;
			temp.x = 40;
			temp.y = 44;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "家族名称";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 230;
			temp.y = 44;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "操作";
			temp.textAlign = "center";
			temp.color = 0xD69E66;
			temp.width = 108;
			temp.x = 450;
			temp.y = 44;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 320;
			temp.styleName = "ui/common/backgound/dikuang.png";
			temp.width = 600;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/kang/taitougaoliang.png";
			temp.width = 590;
			temp.x = 3;
			temp.y = 4;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 230;
			temp.styleName = "ui/common/backgound/neikuang.png";
			temp.width = 570;
			temp.x = 15;
			temp.y = 38;
			return temp;
		}

		private function __SocietyJoinInvitePanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 26;
			temp.styleName = "ui/common/liebiao/liebiao.png";
			temp.width = 568;
			temp.x = 17;
			temp.y = 41;
			return temp;
		}

		private function allRefuseBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			allRefuseBtn = temp;
			temp.name = "allRefuseBtn";
			temp.height = 31;
			temp.label = "全部拒绝";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 76;
			temp.x = 470;
			temp.y = 278;
			return temp;
		}

		private function autoRefuse_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			autoRefuse = temp;
			temp.name = "autoRefuse";
			temp.label = "拒绝所有入族邀请（之后可在系统设置界面进行更改）";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.check.CheckBoxSkin_3);
			temp.color = 0xFABA5B;
			temp.width = 378;
			temp.x = 30;
			temp.y = 280;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			temp.height = 24;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close_3);
			temp.width = 24;
			temp.x = 566;
			temp.y = 6;
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

		private function list_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			list = temp;
			temp.name = "list";
			temp.height = 200;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.list.ListSkin3);
			temp.width = 570;
			temp.x = 16;
			temp.y = 64;
			return temp;
		}

	}
}
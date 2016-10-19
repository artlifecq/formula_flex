package org.mokylin.skin.app.team
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamFollowLeaderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnFollow:feathers.controls.Button;

		public var group:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamFollowLeaderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 170;
			this.width = 190;
			this.elementsContent = [__TeamFollowLeaderSkin_UIAsset1_i(),__TeamFollowLeaderSkin_UIAsset2_i(),group_i(),btnFollow_i(),__TeamFollowLeaderSkin_UIAsset3_i(),__TeamFollowLeaderSkin_Label1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamFollowLeaderSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "小队跟随";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 78;
			temp.x = 57;
			temp.y = 3;
			return temp;
		}

		private function __TeamFollowLeaderSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 170;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 190;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TeamFollowLeaderSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 123;
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 175;
			temp.x = 7;
			temp.y = 33;
			return temp;
		}

		private function __TeamFollowLeaderSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 164;
			temp.x = 21;
			temp.y = 3;
			return temp;
		}

		private function __TeamFollowLeaderSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			temp.gap = -5;
			return temp;
		}

		private function btnFollow_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFollow = temp;
			temp.name = "btnFollow";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 35;
			temp.label = "取消跟随";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.textAlign = "center";
			temp.color = 0xDDDABA;
			temp.width = 90;
			temp.x = 54;
			temp.y = 118;
			return temp;
		}

		private function group_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			group = temp;
			temp.name = "group";
			temp.height = 81;
			temp.width = 171;
			temp.x = 10;
			temp.y = 35;
			temp.layout = __TeamFollowLeaderSkin_VerticalLayout1_i();
			return temp;
		}

	}
}
package org.mokylin.skin.app.team
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TeamFollowTeamPlayerSkin extends feathers.controls.StateSkin
	{
		public var btnFollow:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TeamFollowTeamPlayerSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 170;
			this.width = 185;
			this.elementsContent = [__TeamFollowTeamPlayerSkin_UIAsset1_i(),__TeamFollowTeamPlayerSkin_UIAsset2_i(),__TeamFollowTeamPlayerSkin_Label1_i(),__TeamFollowTeamPlayerSkin_Label2_i(),btnFollow_i(),__TeamFollowTeamPlayerSkin_UIAsset3_i(),__TeamFollowTeamPlayerSkin_Label3_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TeamFollowTeamPlayerSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "小队跟随中......";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 162;
			temp.x = 13;
			temp.y = 51;
			return temp;
		}

		private function __TeamFollowTeamPlayerSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "请勿移动或释放技能";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 164;
			temp.x = 13;
			temp.y = 70;
			return temp;
		}

		private function __TeamFollowTeamPlayerSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.touchGroup = false;
			temp.touchable = false;
			temp.fontSize = 16;
			temp.text = "跟随状态";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 78;
			temp.x = 57;
			temp.y = 3;
			return temp;
		}

		private function __TeamFollowTeamPlayerSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 170;
			temp.styleName = "ui/common/backgound/di_ban.png";
			temp.width = 185;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __TeamFollowTeamPlayerSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 121;
			temp.name = "小队跟随";
			temp.styleName = "ui/common/version_3/D_di/di_4.png";
			temp.width = 168;
			temp.x = 10;
			temp.y = 33;
			return temp;
		}

		private function __TeamFollowTeamPlayerSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchGroup = false;
			temp.touchable = false;
			temp.styleName = "ui/common/backgound/gao_guang.png";
			temp.width = 164;
			temp.x = 10;
			temp.y = 3;
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
			temp.x = 50;
			temp.y = 116;
			return temp;
		}

	}
}
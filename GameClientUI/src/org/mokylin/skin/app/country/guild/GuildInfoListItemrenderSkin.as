package org.mokylin.skin.app.country.guild
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GuildInfoListItemrenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var active:feathers.controls.Label;

		public var bangzhu:feathers.controls.UIAsset;

		public var bg:feathers.controls.UIAsset;

		public var familyName:feathers.controls.Label;

		public var fightAmount:feathers.controls.Label;

		public var fubangzhu:feathers.controls.UIAsset;

		public var gongxian:feathers.controls.Label;

		public var level:feathers.controls.Label;

		public var office:feathers.controls.Label;

		public var player:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuildInfoListItemrenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 38;
			this.elementsContent = [bg_i(),player_i(),familyName_i(),level_i(),gongxian_i(),fightAmount_i(),active_i(),office_i(),bangzhu_i(),fubangzhu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function active_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			active = temp;
			temp.name = "active";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 73;
			temp.x = 366;
			temp.y = 11;
			return temp;
		}

		private function bangzhu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bangzhu = temp;
			temp.name = "bangzhu";
			temp.styleName = "ui/common/version_3/T_tubiao/G_guanzhi/bang_zhu.png";
			temp.x = 3;
			temp.y = 11;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 38;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 613;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.bold = false;
			temp.fontSize = 14;
			temp.text = "动态事件七个字";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 143;
			temp.x = 1;
			temp.y = 11;
			return temp;
		}

		private function fightAmount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fightAmount = temp;
			temp.name = "fightAmount";
			temp.bold = false;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 73;
			temp.x = 279;
			temp.y = 11;
			return temp;
		}

		private function fubangzhu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			fubangzhu = temp;
			temp.name = "fubangzhu";
			temp.styleName = "ui/common/version_3/T_tubiao/G_guanzhi/fu_bang_zhu.png";
			temp.x = 3;
			temp.y = 11;
			return temp;
		}

		private function gongxian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			gongxian = temp;
			temp.name = "gongxian";
			temp.bold = false;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 73;
			temp.x = 209;
			temp.y = 11;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.bold = false;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 62;
			temp.x = 143;
			temp.y = 11;
			return temp;
		}

		private function office_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			office = temp;
			temp.name = "office";
			temp.bold = false;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 14;
			temp.text = "1";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 73;
			temp.x = 443;
			temp.y = 11;
			return temp;
		}

		private function player_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			player = temp;
			temp.name = "player";
			temp.height = 20;
			temp.label = "成员详情";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 74;
			temp.x = 522;
			temp.y = 11;
			return temp;
		}

	}
}
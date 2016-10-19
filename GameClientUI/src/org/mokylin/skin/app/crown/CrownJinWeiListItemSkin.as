package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import flash.filters.GlowFilter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_getequip;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownJinWeiListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var btn0:feathers.controls.Button;

		public var family:feathers.controls.Label;

		public var fightAmount:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var labelFilterBlack:flash.filters.GlowFilter;

		public var level:feathers.controls.Label;

		public var online:feathers.controls.Label;

		public var playerName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownJinWeiListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 647;
			labelFilterBlack_i();
			this.elementsContent = [itemBg_i(),playerName_i(),family_i(),level_i(),fightAmount_i(),online_i(),btn_i(),btn0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btn0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn0 = temp;
			temp.name = "btn0";
			temp.height = 25;
			temp.label = "拒绝";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 49;
			temp.x = 576;
			temp.y = 4;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.height = 25;
			temp.label = "同意";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_getequip);
			temp.width = 49;
			temp.x = 525;
			temp.y = 4;
			return temp;
		}

		private function family_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			family = temp;
			temp.name = "family";
			temp.bold = false;
			temp.height = 26;
			temp.text = "家族";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.width = 127;
			temp.x = 125;
			temp.y = 3;
			return temp;
		}

		private function fightAmount_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fightAmount = temp;
			temp.name = "fightAmount";
			temp.bold = false;
			temp.height = 26;
			temp.text = "战斗力";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.width = 89;
			temp.x = 321;
			temp.y = 3;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
			temp.height = 32;
			temp.styleName = "ui/common/liebiao/liebiaotiao.png";
			temp.width = 647;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labelFilterBlack_i():flash.filters.GlowFilter
		{
			var temp:flash.filters.GlowFilter = new flash.filters.GlowFilter();
			labelFilterBlack = temp;
			temp.alpha = 0.8;
			temp.blurX = 2;
			temp.blurY = 2;
			temp.color = 0x000000;
			temp.inner = false;
			temp.knockout = false;
			temp.quality = 1;
			temp.strength = 10;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.bold = false;
			temp.height = 26;
			temp.text = "等级";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.width = 80;
			temp.x = 231;
			temp.y = 2;
			return temp;
		}

		private function online_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			online = temp;
			temp.name = "online";
			temp.bold = false;
			temp.height = 26;
			temp.text = "在线";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.width = 112;
			temp.x = 421;
			temp.y = 3;
			return temp;
		}

		private function playerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerName = temp;
			temp.name = "playerName";
			temp.bold = false;
			temp.height = 26;
			temp.text = "名字";
			temp.textAlign = "center";
			temp.color = 0xCAAF94;
			temp.width = 128;
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

	}
}
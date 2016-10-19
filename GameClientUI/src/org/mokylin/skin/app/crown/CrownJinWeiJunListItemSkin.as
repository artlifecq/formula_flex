package org.mokylin.skin.app.crown
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
	public class CrownJinWeiJunListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var familyName:feathers.controls.Label;

		public var fighting:feathers.controls.Label;

		public var itemBg0:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var level:feathers.controls.Label;

		public var onlineState:feathers.controls.Label;

		public var operateBtn:feathers.controls.Button;

		public var playerName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownJinWeiJunListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 660;
			this.elementsContent = [itemBg0_i(),itemSelected_i(),familyName_i(),level_i(),playerName_i(),fighting_i(),onlineState_i(),operateBtn_i(),__CrownJinWeiJunListItemSkin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownJinWeiJunListItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/tubiao/jin_wei_jun.png";
			temp.x = 8;
			temp.y = 7;
			return temp;
		}

		private function familyName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			familyName = temp;
			temp.name = "familyName";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "寒门子弟";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 120;
			temp.x = 100;
			temp.y = 4;
			return temp;
		}

		private function fighting_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			fighting = temp;
			temp.name = "fighting";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "12344";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 110;
			temp.x = 330;
			temp.y = 4;
			return temp;
		}

		private function itemBg0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg0 = temp;
			temp.name = "itemBg0";
			temp.height = 32;
			temp.styleName = "ui/app/crown/lieditiao_xiao.png";
			temp.width = 660;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemSelected_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemSelected = temp;
			temp.name = "itemSelected";
			temp.height = 32;
			temp.styleName = "ui/common/liebiao/select.png";
			temp.width = 660;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			level = temp;
			temp.name = "level";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "999";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 110;
			temp.x = 220;
			temp.y = 4;
			return temp;
		}

		private function onlineState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			onlineState = temp;
			temp.name = "onlineState";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "在线";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 110;
			temp.x = 440;
			temp.y = 4;
			return temp;
		}

		private function operateBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			operateBtn = temp;
			temp.name = "operateBtn";
			temp.label = "撤职";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 58;
			temp.x = 563;
			temp.y = 6;
			return temp;
		}

		private function playerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			playerName = temp;
			temp.name = "playerName";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "一哥";
			temp.textAlign = "center";
			temp.color = 0x5B281F;
			temp.width = 100;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

	}
}
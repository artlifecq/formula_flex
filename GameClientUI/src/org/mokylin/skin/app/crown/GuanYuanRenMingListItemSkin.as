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
	public class GuanYuanRenMingListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var familyName:feathers.controls.Label;

		public var governmentPost:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var onlineState:feathers.controls.Label;

		public var operateBtn:feathers.controls.Button;

		public var playerName:feathers.controls.Label;

		public var tubiao:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GuanYuanRenMingListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 660;
			this.elementsContent = [itemBg_i(),itemSelected_i(),governmentPost_i(),playerName_i(),familyName_i(),onlineState_i(),operateBtn_i(),tubiao_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
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
			temp.width = 140;
			temp.x = 260;
			temp.y = 4;
			return temp;
		}

		private function governmentPost_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			governmentPost = temp;
			temp.name = "governmentPost";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "国王";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 120;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function itemBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			itemBg = temp;
			temp.name = "itemBg";
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
			temp.width = 135;
			temp.x = 400;
			temp.y = 4;
			return temp;
		}

		private function operateBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			operateBtn = temp;
			temp.name = "operateBtn";
			temp.height = 20;
			temp.label = "任命";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 56;
			temp.x = 560;
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
			temp.color = 0x5B2812;
			temp.width = 140;
			temp.x = 120;
			temp.y = 4;
			return temp;
		}

		private function tubiao_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			tubiao = temp;
			temp.name = "tubiao";
			temp.styleName = "ui/app/crown/tubiao/guo_wang.png";
			temp.x = 12;
			temp.y = 7;
			return temp;
		}

	}
}
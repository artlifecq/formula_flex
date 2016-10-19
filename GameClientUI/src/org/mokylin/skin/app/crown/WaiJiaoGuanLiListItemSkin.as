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
	public class WaiJiaoGuanLiListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var countryLevel:feathers.controls.Label;

		public var countryName:feathers.controls.Label;

		public var currAlly:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var nationalStrength:feathers.controls.Label;

		public var operateBtn:feathers.controls.Button;

		public var treasuryCapital:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WaiJiaoGuanLiListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.width = 662;
			this.elementsContent = [itemBg_i(),itemSelected_i(),treasuryCapital_i(),nationalStrength_i(),countryName_i(),countryLevel_i(),currAlly_i(),operateBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function countryLevel_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryLevel = temp;
			temp.name = "countryLevel";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "普通";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 110;
			temp.x = 330;
			temp.y = 4;
			return temp;
		}

		private function countryName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			countryName = temp;
			temp.name = "countryName";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "荆州";
			temp.textAlign = "center";
			temp.color = 0x5B281F;
			temp.width = 100;
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function currAlly_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			currAlly = temp;
			temp.name = "currAlly";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "幽州";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 110;
			temp.x = 440;
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
			temp.width = 662;
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
			temp.width = 662;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function nationalStrength_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			nationalStrength = temp;
			temp.name = "nationalStrength";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "300000";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 110;
			temp.x = 220;
			temp.y = 4;
			return temp;
		}

		private function operateBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			operateBtn = temp;
			temp.name = "operateBtn";
			temp.height = 20;
			temp.label = "结盟";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 58;
			temp.x = 568;
			temp.y = 4;
			return temp;
		}

		private function treasuryCapital_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			treasuryCapital = temp;
			temp.name = "treasuryCapital";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "1008679";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 120;
			temp.x = 100;
			temp.y = 4;
			return temp;
		}

	}
}
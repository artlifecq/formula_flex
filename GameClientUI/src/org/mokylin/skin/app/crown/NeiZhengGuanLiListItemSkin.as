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
	public class NeiZhengGuanLiListItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var availableState:feathers.controls.Label;

		public var interiorName:feathers.controls.Label;

		public var itemBg:feathers.controls.UIAsset;

		public var itemSelected:feathers.controls.UIAsset;

		public var operateBtn:feathers.controls.Button;

		public var time:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function NeiZhengGuanLiListItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 32;
			this.elementsContent = [itemBg_i(),itemSelected_i(),availableState_i(),time_i(),interiorName_i(),operateBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function availableState_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			availableState = temp;
			temp.name = "availableState";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "可启用";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 165;
			temp.x = 165;
			temp.y = 4;
			return temp;
		}

		private function interiorName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			interiorName = temp;
			temp.name = "interiorName";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "发布国运";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 165;
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
			temp.width = 630;
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
			temp.width = 630;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function operateBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			operateBtn = temp;
			temp.name = "operateBtn";
			temp.height = 20;
			temp.label = "发布";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_liebiao_anniu);
			temp.width = 60;
			temp.x = 544;
			temp.y = 6;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.bold = true;
			temp.height = 24;
			temp.fontSize = 14;
			temp.text = "11：11";
			temp.textAlign = "center";
			temp.color = 0x5B2812;
			temp.width = 165;
			temp.x = 330;
			temp.y = 4;
			return temp;
		}

	}
}
package org.mokylin.skin.app.beibao.jingmai
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class StoneItem_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Icon:feathers.controls.UIAsset;

		public var txt_Name:feathers.controls.Label;

		public var txt_level:feathers.controls.Label;

		public var txt_xianzhi:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StoneItem_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 59;
			this.width = 330;
			this.elementsContent = [__StoneItem_Skin_UIAsset1_i(),Icon_i(),txt_Name_i(),txt_xianzhi_i(),txt_level_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			Icon = temp;
			temp.name = "Icon";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 4;
			temp.y = 2;
			return temp;
		}

		private function __StoneItem_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/jineng_di.png";
			temp.width = 330;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txt_Name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_Name = temp;
			temp.name = "txt_Name";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "侵略如火";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 63;
			temp.y = 8;
			return temp;
		}

		private function txt_level_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_level = temp;
			temp.name = "txt_level";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "等级:1/200";
			temp.color = 0x5cb006;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 136;
			temp.y = 9;
			return temp;
		}

		private function txt_xianzhi_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt_xianzhi = temp;
			temp.name = "txt_xianzhi";
			temp.touchable = false;
			temp.touchGroup = true;
			temp.text = "60级后自动获得";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 67;
			temp.y = 34;
			return temp;
		}

	}
}
package org.mokylin.skin.app.mount.item
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
	public class MountAttributeItemSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var add:feathers.controls.UIAsset;

		public var labAttr:feathers.controls.Label;

		public var labGroupUp:feathers.controls.Label;

		public var labPercentConversion:feathers.controls.Label;

		public var lower:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MountAttributeItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 23;
			this.width = 270;
			this.elementsContent = [labAttr_i(),labPercentConversion_i(),labGroupUp_i(),add_i(),lower_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function add_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			add = temp;
			temp.name = "add";
			temp.styleName = "ui/common/icon/jian_tou_shang.png";
			temp.x = 255;
			temp.y = 4;
			return temp;
		}

		private function labAttr_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labAttr = temp;
			temp.name = "labAttr";
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 120;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labGroupUp_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labGroupUp = temp;
			temp.name = "labGroupUp";
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 50;
			temp.x = 210;
			temp.y = 0;
			return temp;
		}

		private function labPercentConversion_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labPercentConversion = temp;
			temp.name = "labPercentConversion";
			temp.bold = false;
			temp.height = 23;
			temp.fontSize = 14;
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 86;
			temp.x = 121;
			temp.y = 0;
			return temp;
		}

		private function lower_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			lower = temp;
			temp.name = "lower";
			temp.styleName = "ui/common/icon/jian_tou_xia.png";
			temp.x = 255;
			temp.y = 4;
			return temp;
		}

	}
}
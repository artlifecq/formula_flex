package org.mokylin.skin.app.stall
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
	public class StallTitleSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var isSelect:feathers.controls.UIAsset;

		public var name:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function StallTitleSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [bg_i(),isSelect_i(),name_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/version_3/B_bujian/stall/dian_ji_0.png";
			temp.y = 0;
			return temp;
		}

		private function isSelect_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			isSelect = temp;
			temp.name = "isSelect";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/common/version_3/B_bujian/stall/wei_dian_ji_0.png";
			temp.y = 0;
			return temp;
		}

		private function name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			name = temp;
			temp.name = "name";
			temp.left = 19;
			temp.right = 20;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.color = 0x239D02;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.y = 5;
			return temp;
		}

	}
}
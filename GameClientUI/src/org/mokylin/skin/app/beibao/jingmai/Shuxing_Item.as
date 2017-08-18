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
	public class Shuxing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgAttr:feathers.controls.UIAsset;

		public var imgIco:feathers.controls.UIAsset;

		public var labAttr:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Shuxing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 228;
			this.elementsContent = [__Shuxing_Item_UIAsset1_i(),imgIco_i(),imgAttr_i(),labAttr_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Shuxing_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/jingmai/ditiao.png";
			temp.width = 228;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function imgAttr_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgAttr = temp;
			temp.name = "imgAttr";
			temp.styleName = "ui/common/shuxing/gjl.png";
			temp.x = 56;
			temp.y = 0;
			return temp;
		}

		private function imgIco_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgIco = temp;
			temp.name = "imgIco";
			temp.styleName = "ui/common/shuxingIcon/tubiao/gongji.png";
			temp.x = 29;
			temp.y = 1;
			return temp;
		}

		private function labAttr_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labAttr = temp;
			temp.name = "labAttr";
			temp.text = "8888";
			temp.textAlign = "right";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 147;
			temp.x = 46;
			temp.y = 3;
			return temp;
		}

	}
}
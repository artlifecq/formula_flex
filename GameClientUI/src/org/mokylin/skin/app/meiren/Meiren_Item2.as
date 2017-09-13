package org.mokylin.skin.app.meiren
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
	public class Meiren_Item2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbAdd:feathers.controls.Label;

		public var lbNum:feathers.controls.Label;

		public var uiName:feathers.controls.UIAsset;

		public var uiUp:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Meiren_Item2()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 235;
			this.elementsContent = [uiName_i(),lbNum_i(),lbAdd_i(),uiUp_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function lbAdd_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAdd = temp;
			temp.name = "lbAdd";
			temp.text = "+20";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 47;
			temp.x = 178;
			temp.y = 4;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "20000000";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 85;
			temp.x = 71;
			temp.y = 4;
			return temp;
		}

		private function uiName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiName = temp;
			temp.name = "uiName";
			temp.styleName = "ui/art_txt/common/shuxing/qx.png";
			temp.x = 20;
			temp.y = 4;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 165;
			temp.y = 6;
			return temp;
		}

	}
}
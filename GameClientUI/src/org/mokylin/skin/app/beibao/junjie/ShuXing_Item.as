package org.mokylin.skin.app.beibao.junjie
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
	public class ShuXing_Item extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var lbAdd:feathers.controls.Label;

		public var lbTotal:feathers.controls.Label;

		public var uiUp:feathers.controls.UIAsset;

		public var uiname:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShuXing_Item()
		{
			super();
			
			this.currentState = "normal";
			this.height = 24;
			this.width = 235;
			this.elementsContent = [__ShuXing_Item_UIAsset1_i(),uiname_i(),lbTotal_i(),uiUp_i(),lbAdd_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShuXing_Item_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/beibao/junjie/bg1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbAdd_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbAdd = temp;
			temp.name = "lbAdd";
			temp.text = "1024";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 72;
			temp.x = 156;
			temp.y = 3;
			return temp;
		}

		private function lbTotal_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbTotal = temp;
			temp.name = "lbTotal";
			temp.text = "110";
			temp.textAlign = "center";
			temp.color = 0xEAEABC;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 61;
			temp.x = 64;
			temp.y = 3;
			return temp;
		}

		private function uiUp_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiUp = temp;
			temp.name = "uiUp";
			temp.styleName = "ui/common/tubiao/jobup.png";
			temp.x = 144;
			temp.y = 5;
			return temp;
		}

		private function uiname_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiname = temp;
			temp.name = "uiname";
			temp.styleName = "ui/common/shuxing/sbz.png";
			temp.x = 17;
			temp.y = 2;
			return temp;
		}

	}
}
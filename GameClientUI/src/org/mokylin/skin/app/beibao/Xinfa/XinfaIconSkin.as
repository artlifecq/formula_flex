package org.mokylin.skin.app.beibao.Xinfa
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
	public class XinfaIconSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ico:feathers.controls.UIAsset;

		public var icod:feathers.controls.UIAsset;

		public var icok:feathers.controls.UIAsset;

		public var lab:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function XinfaIconSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [icod_i(),icok_i(),ico_i(),lab_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ico_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ico = temp;
			temp.name = "ico";
			temp.height = 23;
			temp.styleName = "ui/app/beibao/icons/jingmai/jihuo/fangyu.png";
			temp.width = 23;
			temp.x = 12;
			temp.y = 12;
			return temp;
		}

		private function icod_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icod = temp;
			temp.name = "icod";
			temp.height = 48;
			temp.styleName = "ui/app/beibao/icons/bianxian/1/an/0.png";
			temp.width = 48;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icok_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icok = temp;
			temp.name = "icok";
			temp.styleName = "ui/app/beibao/icons/kuang/putong/0.png";
			temp.x = 9;
			temp.y = 9;
			return temp;
		}

		private function lab_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lab = temp;
			temp.name = "lab";
			temp.bold = true;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "12";
			temp.color = 0x55BD15;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 25;
			temp.x = 22;
			temp.y = 27;
			return temp;
		}

	}
}
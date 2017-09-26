package org.mokylin.skin.common.attr
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
	public class AttrItemSkin extends feathers.controls.StateSkin
	{
		public var lbSF:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function AttrItemSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__AttrItemSkin_UIAsset1_i(),lbSF_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __AttrItemSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/art_txt/common/shuxing/sf.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbSF_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSF = temp;
			temp.name = "lbSF";
			temp.letterSpacing = -1;
			temp.text = "0";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 79;
			temp.x = 44;
			temp.y = 1;
			return temp;
		}

	}
}
package org.mokylin.skin.app.vip
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
	public class VipsMiaoshu extends feathers.controls.StateSkin
	{
		public var lbDec:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VipsMiaoshu()
		{
			super();
			
			this.currentState = "normal";
			this.height = 18;
			this.width = 262;
			this.elementsContent = [__VipsMiaoshu_UIAsset1_i(),lbDec_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __VipsMiaoshu_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/fenyefu.png";
			temp.x = 1;
			temp.y = 6;
			return temp;
		}

		private function lbDec_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDec = temp;
			temp.name = "lbDec";
			temp.leading = 3;
			temp.text = "1111";
			temp.color = 0x55BD15;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 250;
			temp.x = 11;
			temp.y = 0;
			return temp;
		}

	}
}
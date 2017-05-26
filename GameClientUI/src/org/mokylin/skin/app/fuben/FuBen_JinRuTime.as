package org.mokylin.skin.app.fuben
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.fuben.uinumber.UINumberTime;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuBen_JinRuTime extends feathers.controls.StateSkin
	{
		public var numTime:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuBen_JinRuTime()
		{
			super();
			
			this.currentState = "normal";
			this.height = 107;
			this.width = 299;
			this.elementsContent = [__FuBen_JinRuTime_UIAsset1_i(),__FuBen_JinRuTime_UIAsset2_i(),numTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuBen_JinRuTime_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 107;
			temp.styleName = "ui/app/fuben/tishibg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __FuBen_JinRuTime_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/fuben/jijiangjinrufuben.png";
			temp.x = 57;
			temp.y = 23;
			return temp;
		}

		private function numTime_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numTime = temp;
			temp.name = "numTime";
			temp.height = 32;
			temp.label = "5";
			temp.styleClass = org.mokylin.skin.app.fuben.uinumber.UINumberTime;
			temp.textAlign = "center";
			temp.width = 67;
			temp.x = 112;
			temp.y = 52;
			return temp;
		}

	}
}
package org.mokylin.skin.app.msg
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Arrows extends feathers.controls.StateSkin
	{
		public var line:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Arrows()
		{
			super();
			
			this.currentState = "normal";
			this.height = 1;
			this.width = 1;
			this.elementsContent = [__Arrows_UIAsset1_i(),line_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Arrows_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/msg/jiantou.png";
			temp.x = -21;
			temp.y = -26;
			return temp;
		}

		private function line_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line = temp;
			temp.name = "line";
			temp.styleName = "ui/mainui/msg/jiantouwaifaguang.png";
			temp.x = -25;
			temp.y = -30;
			return temp;
		}

	}
}
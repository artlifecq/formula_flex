package org.mokylin.skin.loading
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Bg_head extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var left:feathers.controls.UIAsset;

		public var right:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Bg_head()
		{
			super();
			
			this.currentState = "normal";
			this.height = 150;
			this.width = 1920;
			this.elementsContent = [left_i(),right_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function left_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			left = temp;
			temp.name = "left";
			temp.height = 151;
			temp.styleName = "ui/big_bg/bg_1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function right_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			right = temp;
			temp.name = "right";
			temp.height = 151;
			temp.scaleX = -1;
			temp.styleName = "ui/big_bg/bg_1.png";
			temp.x = 1920;
			temp.y = 0;
			return temp;
		}

	}
}
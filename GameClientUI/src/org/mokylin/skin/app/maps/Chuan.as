package org.mokylin.skin.app.maps
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Chuan extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Chuan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 48;
			this.width = 25;
			this.elementsContent = [__Chuan_UIAsset1_i(),__Chuan_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __Chuan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/chuan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __Chuan_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/maps/lan.png";
			temp.x = 6;
			temp.y = 31;
			return temp;
		}

	}
}
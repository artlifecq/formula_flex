package org.mokylin.skin.app.heroSearch
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroSearchListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var imgBg:feathers.controls.UIAsset;

		public var labName:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroSearchListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 25;
			this.width = 250;
			this.elementsContent = [imgBg_i(),labName_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function imgBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgBg = temp;
			temp.name = "imgBg";
			temp.height = 25;
			temp.styleName = "ui/common/kang/liebiao_di/liebiao_di.png";
			temp.width = 250;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function labName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labName = temp;
			temp.name = "labName";
			temp.height = 16;
			temp.text = "标签";
			temp.color = 0xC9B48A;
			temp.width = 206;
			temp.x = 9;
			temp.y = 4;
			return temp;
		}

	}
}
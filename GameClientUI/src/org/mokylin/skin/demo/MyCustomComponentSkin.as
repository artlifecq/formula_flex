package org.mokylin.skin.demo
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MyCustomComponentSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var lb:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MyCustomComponentSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 40;
			this.width = 41;
			this.elementsContent = [bg_i(),lb_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/common/icon/wpk.png";
			return temp;
		}

		private function lb_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb = temp;
			temp.name = "lb";
			temp.height = 16;
			temp.text = "标签";
			temp.textAlign = "right";
			temp.color = 0xFCFCFC;
			temp.width = 39;
			temp.x = 1;
			temp.y = 23;
			return temp;
		}

	}
}